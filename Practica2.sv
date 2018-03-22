module Practica2 
#(
	parameter EntradaBits = 16
)
(
	input clk,
	input reset,
	input [EntradaBits-1:0]r,
	input [EntradaBits-1:0]d, 
	input [EntradaBits-1:0]q,
	
	
	output [EntradaBits-1:0]Raiz

);

logic [4:0]i;

logic [EntradaBits-1:0]R;
logic [EntradaBits-1:0]D; 
logic [EntradaBits-1:0]Q;

always_ff@(posedge clk or negedge reset) begin:ThisIsARegister
	if(reset == 1'b0) 
	begin
		i=8;
		R=r;
		D=d;
		Q=q;
	end
	else begin
		if (i >= 1'b0)
		begin
			if(R >= 1'b0)
				begin 
					R = (R<<2) | (D >> (i+i) & 3);
					R = R - ((Q<<2)|1);
				end
			else 
				begin
					R = (R<<2) | (D >> (i+i) & 3);
					R = R + ((Q<<2)|3);
				end
			if(R >= 1'b0)
					Q = (Q << 1) | 1;
			else
					Q = (Q << 1) | 0;
		end
		if(R < 1'b0)
			R = R + ((Q<<1)|1);
			
	end
end:ThisIsARegister

assign Raiz = R;

endmodule 