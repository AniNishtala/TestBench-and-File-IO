module adder(
input [3:0] A,
input [3:0] B,
input clk,
output reg [3:0] sum

);

always @(posedge clk)
begin
	sum <= A + B;
end

endmodule
