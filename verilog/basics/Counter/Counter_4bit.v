module counter_4bit (
	input clk,
	input rst,
	input en,
	output reg [3:0] Q
);
	
always @(posedge clk )
		begin 
		if (rst)
			Q <= 4'b0000;
		else if (en)
			Q <= Q + 1;
		end 
endmodule 