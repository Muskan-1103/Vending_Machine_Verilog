// Code your design here
module vending_machine(
  input clk,
  input reset,
  input [1:0] in,// 01 = 5rs,10 = 10rs
  output reg out,
  output reg [1:0] change
);
  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;
  
  reg[1:0] pres_state,nxt_state;
  
  always @(posedge clk)
    begin
      if(reset == 1)
        begin
          pres_state = 0;
          nxt_state = 0;
          change = 2'b00;
        end
      else 
        pres_state = nxt_state;
      
        case(pres_state)
          s0: // 0 rupees
            if(in==2'b00)
             begin
            	nxt_state = s0;
                out = 0;
          		change = 2'b00;
        	 end
          else if (in == 2'b01)
            begin 
              nxt_state = s1;
              out = 0;
              change = 2'b00;
            end
          else if(in ==2'b10)
            begin
              nxt_state = s2;
              out = 1;
              change = 2'b00;
            end
          s1: //  5 rupees
          if(in==0)
             begin
            	nxt_state = s0;
                out = 0;
          		change = 2'b01;
        	 end
          else if (in == 2'b01)
            begin 
              nxt_state = s2;
              out = 0;
              change = 2'b00;
            end
          else if(in ==2'b10)
            begin
              nxt_state = s0;
              out = 1;
              change = 2'b00;
            end
          s2: // 10 rupees
          if(in==0)
             begin
            	nxt_state = s0;
                out = 0;
          		change = 2'b10;
        	 end
          else if (in == 2'b01)
            begin 
              nxt_state = s0;
              out = 1;
              change = 2'b00;
            end
          else if(in ==2'b10)
            begin
              nxt_state = s0;
              out = 1;
              change = 2'b01;
            end
        endcase
    end
endmodule

          
