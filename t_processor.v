// Project #2: 16-bit pipeline processor
// Test pattern
`timescale 1ns / 10ps
`include "processor.v"
`include"data_mem.v"
`include"instr_mem.v"

module t_processor;

reg reset, clock, enable, start;
reg [3:0] select_y;
wire [15:0] y;
processor processor (clock, reset, start, enable, select_y, y);


  integer x;
  integer dmem;
  initial dmem= $fopen("D:/dmem.mem.master");
  
task dmem_dump;	begin
	    x = 0;
        $fdisplay (dmem,"");
	        repeat (256)
		      begin
		      $fdisplay (dmem,"Add:%x, Cell:%x", x, data_mem.d_mem[x]);
		     // $display ("Add:%x, Cell:%x", x, data_mem.d_mem[x]);
		      x=x+1;
		      end
end
endtask


  // Clock
  initial clock = 0;
  always
    #5 clock = ~clock;



  initial
    begin
   // $display("pc:     id_ir      :regA:regB:regC:da: dd::w:regC1:gr1 :gr2 :gr3 :gr4 :gr5 :gr6 :gr7 :gr8 ");
    //$monitor("%h:%b:%h:%h:%h:%h:%h:%b:%h:%h:%h:%h:%h:%h:%h:%h:%h",
       //cpu_part.pc, cpu_part.id_ir, cpu_part.reg_A, cpu_part.reg_B, cpu_part.reg_C,
   //data_mem.d_addr, data_mem.d_dataout, data_mem.d_we,cpu_part.reg_C1,cpu_part.gr[0], cpu_part.gr[1], cpu_part.gr[2],cpu_part.gr[3],cpu_part.gr[4],cpu_part.gr[5],cpu_part.gr[6],cpu_part.gr[7]);
      enable <= 0; start <=0; reset <=0; select_y <= 3;
      #10 reset <= 0;
      #10 reset <= 1;
      #10 enable <= 1;
      #10 start <= 1; 
      #10 start <= 0; 
      #20000;
      dmem_dump;
      $fclose(dmem);
      $finish;
    end

endmodule
