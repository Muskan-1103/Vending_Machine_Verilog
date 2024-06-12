// Code your testbench here
// or browse Examples
module vending_machine_tb;
  
  //inputs
  reg clk;
  reg reset;
  reg [1:0] in;
  
  //output 
  wire out;
  wire [1:0] change;
  
  vending_machine uut(
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out),
    .change(change)
  );
  
  initial begin
    
    //initialize inputs
    
    $dumpfile("vending_machine.vcd");
    $dumpvars(0,vending_machine_tb);
    
    reset =1;
    clk = 0;
    #6
    reset = 0;
    in = 1;
    #11
    in=1;
    #16
    in=1;
    #25 
    $finish;
  end
  always #5 clk=~clk;
endmodule

    
