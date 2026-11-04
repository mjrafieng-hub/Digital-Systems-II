module shift_register(
	input serial_port,
	input clk,
	input rst,
	output reg [3:0] final_value

);

always @(posedge clk)
	begin 
		if (rst)
		final_value <= 4'b0000;
		else  
		final_value <= { final_value[2:0], serial_port};
	
	end 
	
endmodule