`timescale 1ns / 1ps

module Car_Parking_TB();
reg clk, reset, carIn, carOut;
wire Full;
wire [7:0] count;

Car_Parking cp0 (clk, reset, carIn, carOut, Full, count);
always #20 clk = ~clk;
initial
begin
clk = 1; reset = 1;
#20 reset = 0;
#10 carIn=0; carOut=0;
#20 carIn=1; carOut=0;
#50 carIn=1; carOut=0;
#100 carIn=1; carOut=0;
#70 carIn=0; carOut=1;
#90 carIn=0; carOut=1;
#200 $finish;
end
endmodule
