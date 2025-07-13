//Timescale
'timescale 1ns / 1ps

//Module Definition 
module pc_unit (
    //Inputs
    input             i_clk    ,
    input      [15:0] i_opcode ,
    input      [15:0] i_pc     ,

    //Outputs
    output reg [15:0] o_pc  
);

    //Initial Block
    initial begin
        o_pc <= 0;
    end

    //ALU Operations
    always @ (negedge i_clk) begin
        
        case (i_opcode) begin

                2'b00 : o_pc <= o_pc     ;
                2'b01 : o_pc <= o_pc + 1 ; 
                2'b10 : o_pc <= i_pc     ;
                2'b11 : o_pc <= 0        ;
            
            end
        
        endcase

    end
    
endmodule