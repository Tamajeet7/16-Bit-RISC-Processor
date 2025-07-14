//Timescale
`timescale 1ns / 1ps

//Module Definition 
module reg_file (
    //Inputs
    input         i_clk          ,
    input         i_en           ,
    input         i_we           ,
    input  [2:0]  i_selA         ,
    input  [2:0]  i_selB         ,
    input  [2:0]  i_selD         ,
    input  [15:0] i_dataD        ,

    //Outputs
    output reg [15:0] o_dataA    ,
    output reg [15:0] o_dataB  
);
    
    //Internal Register Declarations
    reg [15:0] regs [7:0] ;

    //Loop variable
    integer count;

    //Initialize Register
    initial begin
        
        o_dataA = 0 ;
        o_dataB = 0 ;

        for (count = 0; count < 8; count = count + 1) begin
            
            regs[count] = 0;

            end

    end

    //Assigning correct values to output registers
    always @ (negedge i_clk) begin
        
        if (i_en) begin

            if(i_we)
                regs[i_selD] <= i_dataD;
            
            o_dataA <= regs[i_selA];
            o_dataB <= regs[i_selB];
            
        end
    end 
endmodule