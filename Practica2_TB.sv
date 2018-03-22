module Practica2_TB;

parameter EntradaBits = 16;


 // Input Ports
reg clk = 0;
reg reset;

reg [EntradaBits-1:0]r;
reg [EntradaBits-1:0]d;
reg [EntradaBits-1:0]q;


  // Output Ports 
wire [EntradaBits-1:0]Raiz;



Practica2
#(
	// Parameter Declarations
	.EntradaBits(EntradaBits)
)
DUT
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	
	.r(r),
	.q(q),
	.d(d),

	
	// Output Ports
	.Raiz(Raiz)

);	

/*********************************************************/
initial // Clock generator
  begin
    forever #10 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#50 reset = 1;
end

/*********************************************************/
initial begin // Variables
	#30 r = 0;
		 q = 0;
		 d = 127;
		 
		
end/*********************************************************/

/*********************************************************/
initial begin // enable
	//#60 Product = 0;
	//#60 start = 1;
end/*********************************************************/

endmodule 