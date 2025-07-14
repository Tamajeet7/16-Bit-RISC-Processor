//Timescale
`timescale 1ns / 1ps

//Module Definition 
module ctrl_unit (
    //Inputs
    input i_clk     ,
    input i_reset   ,

    //Outputs
    output o_enfetch,
    output o_endec  ,
    output o_enrgrd ,
    output o_enalu  ,
    output o_enrgwr ,
    output o_enmem  
);
    
    //Reg Declaration
    reg [5:0] state ;
    
    //Initial Block
    initial begin

        state  <=  6'b000001;

    end

    //State Select Block
    always @ (posedge i_clk) begin

        if (i_reset)

            state  <=  6'b000001;
        
        else begin
            
            case (state)

                6'b000001 : state <= 6'b000010;
                6'b000010 : state <= 6'b000100;
                6'b000100 : state <= 6'b001000;
                6'b001000 : state <= 6'b010000;
                6'b010000 : state <= 6'b100000;
                default:    state <= 6'b000001;

            endcase

        end
        
    end 

    //Assignment Enable Signals
    assign o_enfetch  =  state[0]            ;
    assign o_endec    =  state[1]            ;
    assign o_enrgrd   =  state[2] | state[4] ;
    assign o_enalu    =  state[3]            ;
    assign o_enrgwr   =  state[4]            ;
    assign o_enmem    =  state[5]            ;
    
endmodule