//Timescale
`timescale 1ns / 1ps

//Module Definition 
module main_test;

    //Variable Declarations
    //Regs
    reg        clk        ;
    reg        reset      ;
    reg        we     = 0 ;
    reg [15:0] dataI  = 0 ;

    //Wire
    wire [2:0]  selA      ; 
    wire [2:0]  selB      ; 
    wire [2:0]  selD      ;
    wire [15:0] dataA     ;
    wire [15:0] dataB     ;
    wire [15:0] dataD     ;
    wire [4:0]  aluop     ;
    wire [7:0]  imm       ;
    wire [15:0] dataO     ;
    wire [1:0]  opcode    ;
    wire [15:0] pcO       ;

    wire        shldBranch;
    wire        enfetch   ;
    wire        enalu     ;
    wire        endec     ;
    wire        enmem     ;
    wire        enrgrd    ;
    wire        enrgwr    ;

    //Assignments
    assign opcode = (reset) ? 2'b11 : ((shldBranch) ? 2'b10 : ((we) ? 2'b01 : 2'b00)) ;

    //Initial Block
    initial begin
        
        clk   = 0        ;
        reset = 1        ;
        #20
        reset = 0        ;

    end 

    always #5 clk = ~clk ;

    //Instantiation
    reg_file main_reg(
        //Inputs
        clk        ,
        en         ,
        we         ,
        selA       ,
        selB       ,
        selD       ,
        dataD      ,

        //Outputs
        dataA      ,
        dataB
    );

    inst_dec main_decoder(
        //Inputs
        clk         ,
        en          ,
        inst        ,

        //Outputs
        aluop       ,
        selA        ,
        selB        ,
        selD        ,
        imm         ,
        regwe
    );

    alu main_alu(
        //Inputs
        clk         ,
        en          ,
        aluop       , 
        dataA       ,
        dataB       ,
        imm         ,

        //Outputs
        dataResult  ,
        shldBranch  
    );
    
    ctrl_unit main_ctrl(
        //Inputs
        clk         ,
        reset       ,
   
        //Outputs
        enfetch     ,
        endec       ,
        enrgrd      ,
        enalu       ,
        enrgwr      ,
        enmem  
    );

    pc_unit main_pc(
        //Inputs
        clk         ,
        opcode      ,
        dataD       ,

        //Outputs
        pc  
    );

    fake_ram main_ram(
        //Inputs
        clk         ,
        we          ,
        addr        ,
        dataI       ,

        //Outputs
        dataO
    );

endmodule