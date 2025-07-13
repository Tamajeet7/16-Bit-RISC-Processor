//Timescale
`timescale 1ns / 1ps

//Module Declarations 
module decoder_unittest;

    //Variable Declarations
    //Regs
    reg        i_clk    ;
    reg        i_en     ;
    reg [15:0] i_inst   ;

    //Wires
    wire [4:0]  o_aluop  ;
    wire [3:0]  o_selA   ;
    wire [3:0]  o_selB   ;
    wire [3:0]  o_selD   ;
    wire [15:0] o_imm    ;
    wire        o_regwe  ;

    inst_dec decoder_test(
        //Inputs
        i_clk       ,
        i_en        ,
        i_inst      ,

        //Outputs
        o_aluop     ,
        o_selA      ,
        o_selB      ,
        o_selD      ,
        o_imm       ,
        o_regwe
    );

    initial begin
        //Time = 0
        i_clk  = 0 ;
        i_en   = 0 ;
        i_inst = 0 ;

        //Time = 10
        #10 i_inst = 16'b0001011100000100;

        //Time = 20
        #10 i_en = 1;

    end

    //Clock Generation
    always #5 i_clk = ~i_clk;
    
endmodule