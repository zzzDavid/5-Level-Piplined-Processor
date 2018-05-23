//************************************************//
//* You need to complete the testbench below     *//
//* by yourself according to your operation set  *//
//************************************************//

module cpu_tb_part ();
	reg reset, clock, enable, start;
	reg [15:0] i_datain;
	reg [15:0] d_datain;
	reg [3:0]	 select_y;
	wire[7:0]	 i_addr;
	wire[7:0]  d_addr;
	wire[15:0] d_dataout;
	wire[15:0] y;
	wire d_we;

	cpu_part test(
		.reset(reset),
		.clock(clock),
		.enable(enable),
		.start(start),
		.i_datain(i_datain),
		.d_datain(d_datain),
		.select_y(select_y),
		.i_addr(i_addr),
		.d_addr(d_addr),
		.d_dataout(d_dataout),
		.d_we(d_we),
		.y(y)
		);

  always #5 clock = ~clock;

  initial
	begin
//************* test pattern *************//
$display("pc:     id_ir      :regA:regB:regC:da: dd::w:regC1:gr1 :gr2 :gr3");
$monitor("%h:%b:%h:%h:%h:%h:%h:%b:%h:%h:%h:%h",
	cpu_part.pc, cpu_part.id_ir, cpu_part.reg_A, cpu_part.reg_B, cpu_part.reg_C,
	d_addr, d_dataout, d_we,cpu_part.reg_C1,cpu_part.gr[1], cpu_part.gr[2], cpu_part.gr[3]);

enable <= 1; start <= 0; i_datain <= 0; d_datain <= 0; select_y <= 0; clock <= 0;


#10 reset <= 0;
#10 reset <= 1;
#10 enable <= 1;
#10 start <=1;
#10 start <= 0;
	i_datain <= {`LOAD, `gr1, 1'b0, `gr0, 4'b0000};
#10 i_datain <= {`LOAD, `gr2, 1'b0, `gr0, 4'b0001};
#10 i_datain <= {`NOP, 11'b000_0000_0000};
#10 i_datain <= {`NOP, 11'b000_0000_0000};
	d_datain <=16'h00AB;  // 3 clk later from LOAD
#10 i_datain <= {`NOP, 11'b000_0000_0000};
	d_datain <=16'h3C00;  // 3 clk later from LOAD
#10 i_datain <= {`ADD, `gr3, 1'b0, `gr1, 1'b0, `gr2};
#10 i_datain <= {`NOP, 11'b000_0000_0000};
#10 i_datain <= {`NOP, 11'b000_0000_0000};
#10 i_datain <= {`NOP, 11'b000_0000_0000};
#10 i_datain <= {`STORE, `gr3, 1'b0, `gr0, 4'b0010};
#10 i_datain <= {`HALT, 11'b000_0000_0000};
end

endmodule // cpu_tb_part
