//Timescale
`timescale 1ns / 1ps

//Module Definition
module inst_dec (
    //Inputs
    input        i_clk       ,
    input        i_en        ,
    input [15:0] i_inst      ,

    //Outputs
    output reg [4:0]  o_aluop,
    output reg [2:0]  o_selA ,
    output reg [2:0]  o_selB ,
    output reg [2:0]  o_selD ,
    output reg [15:0] o_imm  ,
    output reg        o_regwe
);
    
    //Initial Block
    initial begin
        
        o_aluop  <= 0;
        o_selA   <= 0;
        o_selB   <= 0;
        o_selD   <= 0;
        o_imm    <= 0;
        o_regwe  <= 0;

    end

    //Instrustion Decoder Block
    always @ (negedge i_clk) begin
        if (i_en) begin

            o_aluop  <= i_inst[15:11] ;  //opcode
            o_selA   <= i_inst[10:8]  ;  //REG A
            o_selB   <= i_inst[7:5]   ;  //REG B
            o_selD   <= i_inst[4:2]   ;  //REG D
            o_imm    <= i_inst[7:0]   ;  //Imm Data

            //REG Write Enable
            case(i_inst[15:12])

                4'b0111 : o_regwe <= 0;
                4'b1100 : o_regwe <= 0;
                4'b1101 : o_regwe <= 0;
                default : o_regwe <= 1;
            
            endcase

        end
    
    end
    
endmodule