`timescale 1ns / 1ps
module data_mem(reset, clock,d_we,d_addr,d_dataout,d_datain);
input reset, clock, d_we;
input [7:0] d_addr;
input [15:0] d_dataout;
output reg[15:0] d_datain;
reg [15:0] d_mem[63:0];
always @(*) begin
    if(!reset) begin
        d_datain <= 0;
        //init_test
        d_mem[0] <= 16'hfffd;
        d_mem[1] <= 16'h0004;
        d_mem[2] <= 16'h0005;
        d_mem[3] <= 16'hc369;
        d_mem[4] <= 16'h69c3;
        d_mem[5] <= 16'h0041;
        d_mem[6] <= 16'hffff;
        d_mem[7] <= 16'h0001; end
    else begin
         if(d_we) d_mem[d_addr] <= d_dataout;
	      else d_datain <= d_mem[d_addr];
    end
end
endmodule

  //64-bit adder
 /* d_mem[0] <= 16'hfffe;
  d_mem[1] <= 16'hfffe;
  d_mem[2] <= 16'hfffe;
  d_mem[3] <= 16'h0000;
  d_mem[4] <= 16'hffff;
  d_mem[5] <= 16'hffff;
  d_mem[6] <= 16'hffff;
  d_mem[7] <= 16'h0000;*/
  
  //gca
  /*d_mem[0] <= 16'h0000;
  d_mem[1] <= 16'h0009;
  d_mem[2] <= 16'h0003;*/
  
  //bubble
  /*d_mem[0] <= 16'h000a;
  d_mem[1] <= 16'h0004;
  d_mem[2] <= 16'h0005;
  d_mem[3] <= 16'h2369;
  d_mem[4] <= 16'h69c3;
  d_mem[5] <= 16'h0060;
  d_mem[6] <= 16'h0fff;
  d_mem[7] <= 16'h5555;
  d_mem[8] <= 16'h6152;
  d_mem[9] <= 16'h1057;
  d_mem[10] <= 16'h2895;*/



  
    //sort
 /* d_mem[0] <= 16'h000a;
  d_mem[1] <= 16'h0009;
  d_mem[2] <= 16'h0006;
  d_mem[3] <= 16'h0005;
  d_mem[4] <= 16'h0001;
  d_mem[5] <= 16'h0004;
  d_mem[6] <= 16'h0003;
  d_mem[7] <= 16'h0011;*/
  
      //gca
/*d_mem[0] <= 16'h0000;
d_mem[1] <= 16'h0009;
d_mem[2] <= 16'h0003;*/