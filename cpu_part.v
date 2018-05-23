`timescale 1ns / 1ps
//************************************************//
//* You need to complete the design below        *//
//* by yourself according to your operation set  *//
//************************************************//
//define gr
`define gr0     3'b000
`define gr1     3'b001
`define gr2     3'b010
`define gr3     3'b011
`define gr4     3'b100
`define gr5     3'b101
`define gr6     3'b110
`define gr7     3'b111
//define instructions
`define idle  1'b0
`define exec  1'b1
`define NOP   5'b00000
`define HALT  5'b00001
`define LOAD  5'b00010
`define STORE 5'b00011
`define LDIH  5'b10000
`define ADD   5'b01000
`define ADDI  5'b01001
`define ADDC  5'b10001
`define SUB   5'b01010
`define SUBI  5'b01011
`define SUBC  5'b10010
`define CMP   5'b01100
`define AND   5'b01101
`define OR    5'b01110
`define XOR   5'b01111
`define SLL   5'b00100
`define SRL   5'b00101
`define SLA   5'b00110
`define SRA   5'b00111
`define JUMP  5'b11000
`define JMPR  5'b11001
`define BZ    5'b11010
`define BNZ   5'b11011
`define BN    5'b11100
`define BNN   5'b11101
`define BC    5'b11110
`define BNC   5'b11111
`define NAND 5'b10011
`define INC  5'b10100
`define DEC    5'b10101
`define NOT   5'b10110
`define INV    5'b10111

`define R2_R3      (  id_ir[15:11] == `ADD || id_ir[15:11] == `ADDC    \
                    || id_ir[15:11] == `SUB || id_ir[15:11] == `SUBC    \
                    || id_ir[15:11] == `CMP || id_ir[15:11] == `AND     \
                    || id_ir[15:11] == `OR  || id_ir[15:11] == `XOR   \
                    || id_ir[15:11] == `NAND )

`define R1_V2V3    (  id_ir[15:11] == `ADDI || id_ir[15:11] == `SUBI   \
                    || id_ir[15:11] == `BZ   || id_ir[15:11] == `BNZ    \
                    || id_ir[15:11] == `BN   || id_ir[15:11] == `BNN    \
                    || id_ir[15:11] == `BC   || id_ir[15:11] == `BNC    \
                    || id_ir[15:11] == `JMPR )

`define R2_V3      (  id_ir[15:11] == `LOAD || id_ir[15:11] == `STORE  \
                    || id_ir[15:11] == `SLL  || id_ir[15:11] == `SRL    \
                    || id_ir[15:11] == `SLA  || id_ir[15:11] == `SRA )
                    
`define BRANCHJUMP  (  (ex_ir[15:11] == `BZ  && zf == 1'b1) \
                    || (ex_ir[15:11] == `BNZ && zf == 1'b0) \
                    || (ex_ir[15:11] == `BN  && nf == 1'b1) \
                    || (ex_ir[15:11] == `BNN && nf == 1'b0) \
                    || (ex_ir[15:11] == `BC  && cf == 1'b1) \
                    || (ex_ir[15:11] == `BNC && cf == 1'b0) \
                    || ex_ir[15:11] == `JUMP || ex_ir[15:11] == `JMPR)

`define SETFLAG     (  ex_ir[15:11] == `ADD  || ex_ir[15:11] == `ADDI   \
                    || ex_ir[15:11] == `ADDC || ex_ir[15:11] == `SUB    \
                    || ex_ir[15:11] == `SUBI || ex_ir[15:11] == `SUBC   \
                    || ex_ir[15:11] == `INC   || ex_ir[15:11] == `DEC   \
                    || ex_ir[15:11] == `CMP  || ex_ir[15:11] == `SLL    \
                    || ex_ir[15:11] == `SLA  || ex_ir[15:11] == `SRL    \
                    || ex_ir[15:11] == `SRA   ||  ex_ir[15:11] == `INV)

`define WB_ENABLE  (   wb_ir[15:11] == `LOAD || wb_ir[15:11] == `LDIH   \
                    || wb_ir[15:11] == `ADD  || wb_ir[15:11] == `ADDI   \
                    || wb_ir[15:11] == `ADDC || wb_ir[15:11] == `SUB    \
                    || wb_ir[15:11] == `SUBI || wb_ir[15:11] == `SUBC   \
                     || wb_ir[15:11] == `DEC || wb_ir[15:11] == `INC    \
                    || wb_ir[15:11] == `AND  || wb_ir[15:11] == `OR     \
                    || wb_ir[15:11] == `XOR  || wb_ir[15:11] == `SLL    \
                    || wb_ir[15:11] == `SRL  || wb_ir[15:11] == `SLA    \
                    || wb_ir[15:11] == `SRA  || wb_ir[15:11] == `NAND \
                    || wb_ir[15:11] == `INV    || wb_ir[15:11] == `NOT)

module cpu_part(
    input reset, clock, enable, start,
		input [15:0]i_datain,
		input [15:0]d_datain,
		input [3:0]select_y,
		output [8:0]i_addr,
		output [7:0]d_addr,
		output [15:0]d_dataout,
		output  d_we,
		output [15:0]y
		);

		reg [15:0]id_ir, ex_ir, mem_ir, wb_ir, reg_C, reg_C1, smdr, smdr1;
		reg [15:0]reg_A, reg_B, ALUo;
		reg [15:0]gr[7:0];
		reg state, next_state, zf, nf, cf;
		reg [7:0]pc;
		reg  dw;

		assign i_addr = pc;
		assign d_addr = reg_C;
		assign d_dataout = smdr1;
		assign y = gr[select_y[2:0]];

//************* CPU control *************//
always @(posedge clock)
	begin
		if (!reset)
			state <= `idle;
		else
			state <= next_state;
	end

always @(*)
	begin
		case (state)
			`idle :
				if ((enable == 1'b1) && (start == 1'b1))
					next_state <= `exec;
				else
					next_state <= `idle;
			`exec :
				if ((enable == 1'b0) || (wb_ir[15:11] == `HALT))
					next_state <= `idle;
				else
					next_state <= `exec;
		endcase
	end

//************* IF *************//
always @(posedge clock)
	begin
		if (!reset)
			begin
				id_ir <= 16'b0000_0000_0000_0000;
				pc <= 8'b0000_0000;
			end

		else if (state ==`exec)
			begin
				id_ir <= i_datain;
        if (`BRANCHJUMP) begin
            pc <= ALUo[7:0];
            id_ir <= 16'b0;
        end else if (id_ir[15:11] == `LOAD) begin
            pc <= pc;
            id_ir <= 16'b 0000_0000_0000_0000;
        end else
            pc <= pc + 1;
			end
  end


//************* ID *************//
always @(posedge clock)
begin
    if (!reset) begin
        ex_ir <= 16'b0000_0000_0000_0000; end
		else if (state == `exec)
		begin
      if (`BRANCHJUMP) begin
          ex_ir <=16'b0;
      end else begin
          ex_ir <= id_ir;
      end

      // reg_A
      if (`R1_V2V3 || id_ir[15:11] == `LDIH) begin
          if  (mem_ir[15:11] == `LOAD
                           && id_ir[10:8] == mem_ir[10:8]) begin
              reg_A <= d_datain;
          end  else begin
              reg_A <= gr[id_ir[10:8]];
          end
      end else if ((`R2_R3 || `R2_V3)) begin
          if  (mem_ir[15:11] == `LOAD
                          && id_ir[6:4] == mem_ir[10:8]) begin
              reg_A <= d_datain;
          end else begin
              reg_A <= gr[id_ir[6:4]];
          end
      end else if (id_ir[15:11] == `JUMP) begin
          reg_A <= 16'h0;
      end

      // reg_B
      if (`R1_V2V3 || id_ir[15:11] == `JUMP) begin
          reg_B <= {8'b0000_0000, id_ir[7:0]};
      end else if (id_ir[15:11] == `LDIH) begin
          reg_B <= {id_ir[7:0], 8'b0000_0000};
      end else if (`R2_R3) begin
          if (mem_ir[15:11] == `LOAD
                          && id_ir[2:0] == mem_ir[10:8]) begin
              reg_B <= d_datain;
          end  else begin
              reg_B <= gr[id_ir[2:0]];
          end
      end else if (`R2_V3) begin
          reg_B <= {12'b0000_0000_0000, id_ir[3:0]};
      end

      // smdr
      if  (mem_ir[15:11] == `LOAD
                      && id_ir[10:8] == mem_ir[10:8]) begin
          smdr <= d_datain;
      end  else begin
          smdr <= gr[id_ir[10:8]];
      end
		end
end


//************* EX *************//
reg cf_out; //carry flag, CF
always @(*) begin //ALU
    case(ex_ir[15:11])
        `ADDI:  {cf_out, ALUo} <= reg_A + reg_B;
         `ADDC:  {cf_out, ALUo} <= reg_A + reg_B + cf;
         `SUB:   {cf_out, ALUo} <= reg_A - reg_B;
         `SUBI:  {cf_out, ALUo} <= reg_A - reg_B;
         `SUBC:  {cf_out, ALUo} <= reg_A - reg_B - cf;
         `INC:    {cf_out, ALUo} <= reg_A + 16'b1;
         `DEC:    {cf_out, ALUo} <= reg_A - 16'b1;
         `CMP:   {cf_out, ALUo} <= reg_A - reg_B;
         `AND:   {cf_out, ALUo} <= reg_A & reg_B;
         `OR:    {cf_out, ALUo} <= reg_A | reg_B;
         `XOR:   {cf_out, ALUo} <= reg_A ^ reg_B;
         `NOT:   {cf_out, ALUo} <= ~reg_A;
         `NAND:   {cf_out, ALUo} <= ~(reg_A & reg_B);
         `INV:  {cf_out, ALUo} <= reg_A & 16'h8000;
         `SLL:   {cf_out, ALUo} <= reg_A << reg_B;
         `SRL:   {cf_out, ALUo} <= reg_A >> reg_B;
         `SLA:   {cf_out, ALUo} <= reg_A <<< reg_B;
         `SRA:   {cf_out, ALUo} <= $signed(reg_A) >>> reg_B;
         default:{cf_out, ALUo} <= reg_A + reg_B;
     endcase
end

always @(posedge clock) begin
    if (!reset) begin
        mem_ir <= 16'b0000_0000_0000_0000;
        cf <= 1'b0;
        zf <= 1'b0;
        nf <= 1'b0;
        reg_C <= 16'b0000_0000_0000_0000;
        dw <= 1'b0;
        smdr1 <= 16'b0000_0000_0000_0000;
    end
		else if (state == `exec)
			begin
          mem_ir <= ex_ir;
          reg_C <= ALUo;
          smdr1 <= smdr;
          dw <= ex_ir[15:11] == `STORE ? 1'b1 : 1'b0;

          if (`SETFLAG) begin
              zf <= ALUo == 16'h0000 ? 1'b1 : 1'b0;
              nf <= ALUo[15];
              cf <= cf_out;
          end
			end
end
assign  d_we = dw;

//************* MEM *************//
always @(posedge clock) begin
    if (!reset) begin
        wb_ir <= 16'b0000_0000_0000_0000;
        reg_C1 <= 16'b0000_0000_0000_0000; end
		else if (state == `exec)
			begin
				wb_ir <= mem_ir;

				if (mem_ir[15:11] == `LOAD)
					reg_C1 <= d_datain;
				else
					reg_C1 <= reg_C;
			end
end

//************* WB *************//
integer i;
always @(posedge clock) begin
    if (!reset) begin
      for (i=0; i<8; i=i+1)
            gr[i] <= 0; end
		else if (state == `exec)
			begin
				if (state == `exec && `WB_ENABLE)
					gr[wb_ir[10:8]] <= reg_C1;
			end
	end
endmodule  
