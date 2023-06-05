`timescale 1ns / 1ps

module Car_Parking(
  input clk,        
  input reset,      
  input carIn,      
  input carOut,     
  output reg Full,
  output reg [7:0] count
);
     
  always @(posedge clk) begin
    if (reset) begin
      count <= 0;    
      Full <= 0;   
    end
    else begin
    if (carIn && !carOut) begin
        if (count < 10) // Change the value for adding or removing slots
          count <= count + 1;   
        else
          Full <= 1;          
      end
      else if (!carIn && carOut && count > 0) begin
        count <= count - 1;     
        Full <= 0;           
      end
    end
  end
endmodule
