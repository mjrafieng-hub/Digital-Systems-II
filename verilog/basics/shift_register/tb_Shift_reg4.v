`timescale 1ns/1ps


module tb_shift_register ();
	reg clk ;
	reg rst ;
	reg serial_port ;
	reg [3:0]test_victor;
	wire [3:0] final_value ;
	integer i;
	
shift_register uut(
	.serial_port(serial_port),
	.clk(clk),
	.rst(rst),
	.final_value(final_value)
	);
	
initial clk = 0;
always #10 clk = ~clk ;

initial
	begin
  
	rst = 1;
	serial_port = 0;
	test_victor = 4'b0110;
	
	#10;
	rst = 0;
	
	for ( i = 3; i >= 0; i = i - 1 )
		begin
			@( posedge clk );
			serial_port = test_victor[i];
		end 
    #30;
	$finish;		
	end 
endmodule