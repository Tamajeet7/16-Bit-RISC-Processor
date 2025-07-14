//Timescale
`timescale 1ns / 1ps

//Module Definition 
module regfile_unittest;

    //Variable Declarations
    //Regs
    reg          i_clk   ;
    reg  [15:0]  i_dataD ;
    reg          i_en    ;
    reg  [2:0]   i_selA  ;
    reg  [2:0]   i_selB  ;
    reg  [2:0]   i_selD  ;
    reg          i_we    ;

    //Wires
    wire [15:0]  o_dataA ;
    wire [15:0]  o_dataB ;

    //Instantiation
    reg_file reg_test(
        //Inputs
        i_clk      ,
        i_en       ,
        i_we       ,
        i_selA     ,
        i_selB     ,
        i_selD     ,
        i_dataD    ,

        //Outputs
        o_dataA    ,
        o_dataB
    );

    initial begin
        
        //Reset all Inputs
        i_clk   = 1'b0 ;
        i_dataD = 0    ; 
        i_en    = 0    ;
        i_selA  = 0    ;
        i_selB  = 0    ;
        i_selD  = 0    ;
        i_we    = 0    ;

        //Start Test
        i_en    = 1'b1 ;

        i_selA  = 3'b000   ;
        i_selB  = 3'b001   ;
        i_selD  = 3'b000   ;

        i_dataD = 16'hFFFF ;
        i_we    = 1'b1     ;

        //Time = 17
        #10;
        i_we    = 1'b0     ;
        i_selD  = 3'b010   ;
        i_dataD = 16'h2222 ;

        //Time = 27
        #10;
        i_we    = 1        ;

        //Time = 37
        #10;
        i_dataD = 16'h3333 ;

        //Time = 47
        #10;
        i_we    = 0        ;
        i_selD  = 3'b100   ;
        i_dataD = 16'h4444 ;

        //Time = 67
        #10;
        i_we    = 1        ;

        //Time = 117
        #50;
        i_selA  = 3'b100   ;
        i_selB  = 3'b100   ;

    end

    //Clock Generation
    always begin 
        #5 i_clk = ~i_clk; 
    end
endmodule