module t_count_ones_b ();

  parameter 				data_width = 4;
  parameter 				count_width = 3;
  wire 		[count_width-1:0] 		bit_count_0, bit_count_1, bit_count_2;
  reg 		[data_width-1:0] 		data;
  reg 					clk, reset;
 
initial #500 $finish;
initial fork
reset = 1;	// modified 5-17-2002 for longer reset
#10 reset = 0;
#200 reset = 1;
#211 reset = 0;
join

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
#10 data = 4'hf;
#60 data = 4'ha;
#60 data = 4'h5;
#60 data = 4'hb;
#60 data = 4'h9;
#60 data = 4'h0;
#60 data = 4'hc;

end

count_ones_b0 M0 (bit_count_0, data, clk, reset);
count_ones_b1 M1 (bit_count_1, data, clk, reset);
count_ones_b2 M2 (bit_count_2, data, clk, reset);

endmodule

