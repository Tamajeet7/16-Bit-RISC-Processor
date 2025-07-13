//Timescale
'timescale 1ns / 1ps

//Module Definition 
module alu (
    //Inputs
    input            i_clk       ,
    input            i_en        ,
    input  [4:0]     i_aluop     , 
    input  [15:0]    i_dataA     ,
    input  [15:0]    i_dataB     ,
    input  [7:0]     i_imm       ,

    //Outputs
    output [15:0]  o_dataResult  ,
    output reg     o_shldBranch  
);
    
    //Reg Declaration
    reg   [17:0] int_result ;
    wire         op_lsb     ;
    reg   [3:0]  opcode     ;

    //Parameter Declarations
    localparam  Add      = 0,
                Sub      = 1,
                OR       = 2,
                AND      = 3,
                XOR      = 4,
                NOT      = 5,
                Rdmem    = 6,
                Wrmem    = 7,
                Load     = 8,
                Cmp      = 9,
                SHL      = 10,
                SHR      = 11,
                JMPA     = 12,
                JMPR     = 13;

    //Initial Block
    initial begin

        int_result <= 0 ;

    end

    //Assigning values
    assign   op_lsb     <= i_aluop[0] ;
    assign   opcode      

    //ALU Operations
    always @ (negedge i_clk) begin

        if (i_en) begin
            
            case (opcode)
                
                Add :   begin
                            int_result <= (op_lsb ? ($signed(i_dataA) + $signed(i_dataB)) : (i_dataA + i_dataB))
                            o_shldBranch <= 0;
                        end

                Sub :   begin
                            int_result <= (op_lsb ? ($signed(i_dataA) - $signed(i_dataB)) : (i_dataA - i_dataB))
                            o_shldBranch <= 0;
                        end

                OR  :   begin
                            int_result <= i_dataAd | i_dataB;
                            o_shldBranch <= 0;
                        end
                
                AND  :   begin
                            int_result <= i_dataAd & i_dataB;
                            o_shldBranch <= 0;
                        end
                
                XOR :   begin
                            int_result <= i_dataAd ^ i_dataB;
                            o_shldBranch <= 0;
                        end
                
                NOT :   begin
                            int_result <= ~i_dataAd ;
                            o_shldBranch <= 0;
                        end

                Load : begin
                            int_result <= (op_lsb ? ({i_imm, 8'h00}) : ({8'hoo, i_imm}));
                            o_shldBranch <= 0;
                        end

                Cmp : begin
                            if(op_lsb) begin
                                int_result[0] <= ($signed(i_dataA) == $signed(i_dataB)) ? 1 : 0; 
                                int_result[1] <= ($signed(i_dataA) == 0) ? 1 : 0; 
                                int_result[2] <= ($signed(i_dataB) == 0) ? 1 : 0;
                                int_result[3] <= ($signed(i_dataA) >  $signed(i_dataB)) ? 1 : 0;
                                int_result[4] <= ($signed(i_dataA) <  $signed(i_dataB)) ? 1 : 0;
                            end
                            else begin
                                int_result[0] <= (i_dataA == i_dataB) ? 1 : 0; 
                                int_result[1] <= (i_dataA == 0) ? 1 : 0; 
                                int_result[2] <= (i_dataB == 0) ? 1 : 0;
                                int_result[3] <= (i_dataA >  i_dataB) ? 1 : 0;
                                int_result[4] <= (i_dataA <  i_dataB) ? 1 : 0;
                            end
                        o_shldBranch <= 0;
                        end
                
                SHL :   begin
                            int_result <= i_dataA << (i_dataB[3:0]);
                            o_shldBranch <= 0;
                        end

                SHR :   begin
                            int_result <= i_dataA >> (i_dataB[3:0]);
                            o_shldBranch <= 0;
                        end
                
                JMPA :  begin
                            int_result <= (op_lsb ? i_dataA : i_imm);
                            o_shldBranch <= 1;
                        end
                
                JMPR :  begin
                            int_result   <= i_dataA;
                            o_shldBranch <= i_dataB({op_lsb, i_imm[1:0]});
                        end
                default: 
            endcase
        end
        
    end
endmodule