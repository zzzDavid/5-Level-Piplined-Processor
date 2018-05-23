`timescale 1ns / 1ps

module instr_mem(i_addr,i_datain);
input [8:0] i_addr;
output [15:0] i_datain;
reg [15:0] i_mem [255:0];

assign i_datain = i_mem[i_addr];
always @(*)
	   case(i_addr)
       //   tinit_test
       0: i_mem[i_addr]={`ADDI,`gr7,4'd1,4'd0};//gr7<=16'h10forstorei_address
       1: i_mem[i_addr]={`LDIH,`gr1,4'b1011,4'b0110};//LDIH  gr1<="16'hb600"
       2: i_mem[i_addr]=16'h0000 ;
       3: i_mem[i_addr]=16'h0000 ;
       4: i_mem[i_addr]=16'h0000 ;
       5: i_mem[i_addr]={`STORE,`gr1,1'b0,`gr7,4'h0};//storetomem10
       6: i_mem[i_addr]=16'h0000 ;
       7: i_mem[i_addr]={`LOAD,`gr1,1'b0,`gr0,4'h0};//gr1<=fffd
       8: i_mem[i_addr]={`LOAD,`gr2,1'b0,`gr0,4'h1};//gr2<=4
       9: i_mem[i_addr]=16'h0000 ;
       10: i_mem[i_addr]=16'h0000 ;
       11: i_mem[i_addr]=16'h0000 ;
       12: i_mem[i_addr]={`ADDC,`gr3,1'b0,`gr1,1'b0,`gr2};//gr3<=fffd+4+cf(=0)=1,cf<=1
       13: i_mem[i_addr]=16'h0000 ;
       14: i_mem[i_addr]=16'h0000 ;
       15: i_mem[i_addr]=16'h0000 ;
       16: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h1};//storetomem11
       17: i_mem[i_addr]={`ADDC,`gr3,1'b0,`gr0,1'b0,`gr2};//gr3<=0+4+cf(=1)=5,cf<=0
       18: i_mem[i_addr]=16'h0000 ;
       19: i_mem[i_addr]=16'h0000 ;
       20: i_mem[i_addr]=16'h0000 ;
       21: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h2};//storetomem12
       22: i_mem[i_addr]={`LOAD,`gr1,1'b0,`gr0,4'h2};//gr1<=5
       23: i_mem[i_addr]=16'h0000 ;
       24: i_mem[i_addr]=16'h0000 ;
       25: i_mem[i_addr]=16'h0000 ;
       26: i_mem[i_addr]={`SUBC,`gr3,1'b0,`gr1,1'b0,`gr2};//gr3<=5-4+cf(=0)=1,cf<=0
       27: i_mem[i_addr]=16'h0000 ;
       28: i_mem[i_addr]=16'h0000 ;
       29: i_mem[i_addr]=16'h0000 ;
       30: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h3};//storetomem13
       31: i_mem[i_addr]={`SUB,`gr3,1'b0,`gr2,1'b0,`gr1};//gr3<=4-5=-1,cf<=1
       32: i_mem[i_addr]=16'h0000 ;
       33: i_mem[i_addr]=16'h0000 ;
       34: i_mem[i_addr]=16'h0000 ;
       35: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h4};//storetomem14
       36: i_mem[i_addr]={`SUBC,`gr3,1'b0,`gr2,1'b0,`gr1};//gr3<=5-4-cf(=1)=2,cf<=0
       37: i_mem[i_addr]=16'h0000 ;
       38: i_mem[i_addr]=16'h0000 ;
       39: i_mem[i_addr]=16'h0000 ;
       40: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h5};//storetomem15
       41: i_mem[i_addr]={`LOAD,`gr1,1'b0,`gr0,4'h3};//gr1<=c369
       42: i_mem[i_addr]={`LOAD,`gr2,1'b0,`gr0,4'h4};//gr2<=69c3
       43: i_mem[i_addr]=16'h0000 ;
       44: i_mem[i_addr]=16'h0000 ;
       45: i_mem[i_addr]=16'h0000 ;
       46: i_mem[i_addr]={`AND,`gr3,1'b0,`gr1,1'b0,`gr2};//gr3<=gr1&gr2=4141
       47: i_mem[i_addr]=16'h0000 ;
       48: i_mem[i_addr]=16'h0000 ;
       49: i_mem[i_addr]=16'h0000 ;
       50: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h6};//storetomem16
       51: i_mem[i_addr]={`OR,`gr3,1'b0,`gr1,1'b0,`gr2};//gr3<=gr1|gr2=ebeb
       52: i_mem[i_addr]=16'h0000 ;
       53: i_mem[i_addr]=16'h0000 ;
       54: i_mem[i_addr]=16'h0000 ;
       55: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h7};//storetomem17
       56: i_mem[i_addr]={`XOR,`gr3,1'b0,`gr1,1'b0,`gr2};//gr3<=gr1^gr2=aaaa
       57: i_mem[i_addr]=16'h0000 ;
       58: i_mem[i_addr]=16'h0000 ;
       59: i_mem[i_addr]=16'h0000 ;
       60: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h8};//storetomem18
       61: i_mem[i_addr]={`SLL,`gr3,1'b0,`gr1,4'h0};//gr3<=gr1<0
       62: i_mem[i_addr]=16'h0000 ;
       63: i_mem[i_addr]=16'h0000 ;
       64: i_mem[i_addr]=16'h0000 ;
       65: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h9};//storetomem19
       66: i_mem[i_addr]={`SLL,`gr3,1'b0,`gr1,4'h1};//gr3<=gr1<1
       67: i_mem[i_addr]=16'h0000 ;
       68: i_mem[i_addr]=16'h0000 ;
       69: i_mem[i_addr]=16'h0000 ;
       70: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'ha};//storetomem1a
       71: i_mem[i_addr]={`SLL,`gr3,1'b0,`gr1,4'h4};//gr3<=gr1<8
       72: i_mem[i_addr]=16'h0000 ;
       73: i_mem[i_addr]=16'h0000 ;
       74: i_mem[i_addr]=16'h0000 ;
       75: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hb};//storetomem1b
       76: i_mem[i_addr]={`SLL,`gr3,1'b0,`gr1,4'hf};//gr3<=gr1<15
       77: i_mem[i_addr]=16'h0000 ;
       78: i_mem[i_addr]=16'h0000 ;
       79: i_mem[i_addr]=16'h0000 ;
       80: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hc};//storetomem1c
       81: i_mem[i_addr]={`SRL,`gr3,1'b0,`gr1,4'h0};//gr3<=gr1>0
       82: i_mem[i_addr]=16'h0000 ;
       83: i_mem[i_addr]=16'h0000 ;
       84: i_mem[i_addr]=16'h0000 ;
       85: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hd};//storetomem1d
       86: i_mem[i_addr]={`SRL,`gr3,1'b0,`gr1,4'h1};//gr3<=gr1>1
       87: i_mem[i_addr]=16'h0000 ;
       88: i_mem[i_addr]=16'h0000 ;
       89: i_mem[i_addr]=16'h0000 ;
       90: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'he};//storetomem1e
       91: i_mem[i_addr]={`SRL,`gr3,1'b0,`gr1,4'h8};//gr3<=gr1>8
       92: i_mem[i_addr]=16'h0000 ;
       93: i_mem[i_addr]=16'h0000 ;
       94: i_mem[i_addr]=16'h0000 ;
       95: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hf};//storetomem1f
       96: i_mem[i_addr]={`SRL,`gr3,1'b0,`gr1,4'hf};//gr3<=gr1>15
       97: i_mem[i_addr]={`ADDI,`gr7,4'd1,4'd0};//gr7<=16'h20forstorei_address
       98: i_mem[i_addr]=16'h0000 ;
       99: i_mem[i_addr]=16'h0000 ;
       100: i_mem[i_addr]=16'h0000 ;
       101: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h0};//storetomem20
       102: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr1,4'h0};//gr3<=gr1<0
       103: i_mem[i_addr]=16'h0000 ;
       104: i_mem[i_addr]=16'h0000 ;
       105: i_mem[i_addr]=16'h0000 ;
       106: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h1};//storetomem21
       107: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr1,4'h1};//gr3<=gr1<1
       108: i_mem[i_addr]=16'h0000 ;
       109: i_mem[i_addr]=16'h0000 ;
       110: i_mem[i_addr]=16'h0000 ;
       111: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h2};//storetomem22
       112: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr1,4'h8};//gr3<=gr1<8                                         //ISSUE  // CORRECTED
       113: i_mem[i_addr]=16'h0000 ;
       114: i_mem[i_addr]=16'h0000 ;
       115: i_mem[i_addr]=16'h0000 ;
       116: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h3};//storetomem23
       117: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr1,4'hf};//gr3<=gr1<15
       118: i_mem[i_addr]=16'h0000 ;
       119: i_mem[i_addr]=16'h0000 ;
       120: i_mem[i_addr]=16'h0000 ;
       121: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h4};//storetomem24
       122: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr2,4'h0};//gr3<=gr1<0
       123: i_mem[i_addr]=16'h0000 ;
       124: i_mem[i_addr]=16'h0000 ;
       125: i_mem[i_addr]=16'h0000 ;
       126: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h5};//storetomem25
       127: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr2,4'h1};//gr3<=gr1<1                                             //ISSUE  //CORRECTED
       128: i_mem[i_addr]=16'h0000 ;
       129: i_mem[i_addr]=16'h0000 ;
       130: i_mem[i_addr]=16'h0000 ;
       131: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h6};//storetomem26
       132: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr2,4'h8};//gr3<=gr1<8                                              //ISSUE  //CORRECTED
       133: i_mem[i_addr]=16'h0000 ;
       134: i_mem[i_addr]=16'h0000 ;
       135: i_mem[i_addr]=16'h0000 ;
       136: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h7};//storetomem27
       137: i_mem[i_addr]={`SLA,`gr3,1'b0,`gr2,4'hf};//gr3<=gr1<15                                            //ISSUE  //CORRECTED
       138: i_mem[i_addr]=16'h0000 ;
       139: i_mem[i_addr]=16'h0000 ;
       140: i_mem[i_addr]=16'h0000 ;
       141: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h8};//storetomem28
       142: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr1,4'h0};//gr3<=gr1>0
       143: i_mem[i_addr]=16'h0000 ;
       144: i_mem[i_addr]=16'h0000 ;
       145: i_mem[i_addr]=16'h0000 ;
       146: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h9};//storetomem29
       147: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr1,4'h1};//gr3<=gr1>1
       148: i_mem[i_addr]=16'h0000 ;
       149: i_mem[i_addr]=16'h0000 ;
       150: i_mem[i_addr]=16'h0000 ;
       151: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'ha};//storetomem2a
       152: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr1,4'h8};//gr3<=gr1>8
       153: i_mem[i_addr]=16'h0000 ;
       154: i_mem[i_addr]=16'h0000 ;
       155: i_mem[i_addr]=16'h0000 ;
       156: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hb};//storetomem2b
       157: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr1,4'hf};//gr3<=gr1>15
       158: i_mem[i_addr]=16'h0000 ;
       159: i_mem[i_addr]=16'h0000 ;
       160: i_mem[i_addr]=16'h0000 ;
       161: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hc};//storetomem2c
       162: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr2,4'h0};//gr3<=gr1>0
       163: i_mem[i_addr]=16'h0000 ;
       164: i_mem[i_addr]=16'h0000 ;
       165: i_mem[i_addr]=16'h0000 ;
       166: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hd};//storetomem2d
       167: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr2,4'h1};//gr3<=gr1>1
       168: i_mem[i_addr]=16'h0000 ;
       169: i_mem[i_addr]=16'h0000 ;
       170: i_mem[i_addr]=16'h0000 ;
       171: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'he};//storetomem2e
       172: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr2,4'h8};//gr3<=gr1>8
       173: i_mem[i_addr]=16'h0000 ;
       174: i_mem[i_addr]=16'h0000 ;
       175: i_mem[i_addr]=16'h0000 ;
       176: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'hf};//storetomem2f
       177: i_mem[i_addr]={`ADDI,`gr7,4'd1,4'd0};//gr7<=16'h30forstorei_address
       178: i_mem[i_addr]={`SRA,`gr3,1'b0,`gr2,4'hf};//gr3<=gr1>15
       179: i_mem[i_addr]=16'h0000 ;
       180: i_mem[i_addr]=16'h0000 ;
       181: i_mem[i_addr]=16'h0000 ;
       182: i_mem[i_addr]={`STORE,`gr3,1'b0,`gr7,4'h0};//storetomem30
       183: i_mem[i_addr]={`LOAD,`gr1,1'b0,`gr0,4'h5};//gr1<=41
       184: i_mem[i_addr]={`LOAD,`gr2,1'b0,`gr0,4'h6};//gr2<=ffff
       185: i_mem[i_addr]={`LOAD,`gr3,1'b0,`gr0,4'h7};//gr3<=1
       186: i_mem[i_addr]=16'h0000 ;
       187: i_mem[i_addr]=16'h0000 ;
       188: i_mem[i_addr]=16'h0000 ;
       189: i_mem[i_addr]={`STORE,`gr7,1'b0,`gr7,4'h8};//storetomem38        //68    
       190: i_mem[i_addr]=16'h0800;//69{`HALT,11'd0};//STOP

  

	default: i_mem[i_addr] <= {`HALT, 11'b000_0000_0000};
	endcase
endmodule

	//------------------------------------TA---------------------------------------//
	
	        //gca
           
           /*0: i_mem[i_addr]<={`LOAD,`gr1,1'b0,`gr0,4'b0001};
           1: i_mem[i_addr]=16'h0000 ;
           2: i_mem[i_addr]=16'h0000 ;
           3: i_mem[i_addr]=16'h0000 ;
           4: i_mem[i_addr]<={`LOAD,`gr2,1'b0,`gr0,4'b0010};
           5: i_mem[i_addr]=16'h0000 ;
           6: i_mem[i_addr]=16'h0000 ;
           7: i_mem[i_addr]=16'h0000 ;
           8: i_mem[i_addr]<={`ADD,`gr3,1'b0,`gr0,1'b0,`gr1};//(1)
           9: i_mem[i_addr]=16'h0000 ;
           10: i_mem[i_addr]=16'h0000 ;
           11: i_mem[i_addr]=16'h0000 ;
           12: i_mem[i_addr]<={`SUB,`gr1,1'b0,`gr1,1'b0,`gr2};
           13: i_mem[i_addr]=16'h0000 ;
           14: i_mem[i_addr]=16'h0000 ;
           15: i_mem[i_addr]=16'h0000 ;
           16: i_mem[i_addr]<={`BZ,`gr0,8'b0000_1001};//jumpto(2)
           17: i_mem[i_addr]=16'h0000 ;
           18: i_mem[i_addr]=16'h0000 ;
           19: i_mem[i_addr]=16'h0000 ;
           20: i_mem[i_addr]<={`BNN,`gr0,8'b0000_0010};//jumpto(1)
           21: i_mem[i_addr]=16'h0000 ;
           22: i_mem[i_addr]=16'h0000 ;
           23: i_mem[i_addr]=16'h0000 ;
           24: i_mem[i_addr]<={`ADD,`gr1,1'b0,`gr0,1'b0,`gr2};
           25: i_mem[i_addr]=16'h0000 ;
           26: i_mem[i_addr]=16'h0000 ;
           27: i_mem[i_addr]=16'h0000 ;
           28: i_mem[i_addr]<={`ADD,`gr2,1'b0,`gr0,1'b0,`gr3};
           29: i_mem[i_addr]=16'h0000 ;
           30: i_mem[i_addr]=16'h0000 ;
           31: i_mem[i_addr]=16'h0000 ;
           32: i_mem[i_addr]<={`JUMP,11'b000_0000_0010};//jumpto(1)
           33: i_mem[i_addr]=16'h0000 ;
           34: i_mem[i_addr]=16'h0000 ;
           35: i_mem[i_addr]=16'h0000 ;
           36: i_mem[i_addr]<={`STORE,`gr2,1'b0,`gr0,4'b0011};//(2)
           37: i_mem[i_addr]=16'h0000 ;
           38: i_mem[i_addr]=16'h0000 ;
           39: i_mem[i_addr]=16'h0000 ;
           40: i_mem[i_addr]<={`LOAD,`gr1,1'b0,`gr0,4'b0001};
           41: i_mem[i_addr]=16'h0000 ;
           42: i_mem[i_addr]=16'h0000 ;
           43: i_mem[i_addr]=16'h0000 ;
           44: i_mem[i_addr]<={`LOAD,`gr2,1'b0,`gr0,4'b0010};
           45: i_mem[i_addr]=16'h0000 ;
           46: i_mem[i_addr]=16'h0000 ;
           47: i_mem[i_addr]=16'h0000 ;
           48: i_mem[i_addr]<={`ADDI,`gr4,8'h1};//(3)
           49: i_mem[i_addr]=16'h0000 ;
           50: i_mem[i_addr]=16'h0000 ;
           51: i_mem[i_addr]=16'h0000 ;
           52: i_mem[i_addr]<={`SUB,`gr2,1'b0,`gr2,1'b0,`gr3};
           53: i_mem[i_addr]=16'h0000 ;
           54: i_mem[i_addr]=16'h0000 ;
           55: i_mem[i_addr]=16'h0000 ;
           56: i_mem[i_addr]<={`BZ,`gr0,8'b0001_0000};//jumpto(4)
           57: i_mem[i_addr]=16'h0000 ;
           58: i_mem[i_addr]=16'h0000 ;
           59: i_mem[i_addr]=16'h0000 ;
           60: i_mem[i_addr]<={`JUMP,11'b000_0000_1100};//jumpto(3)
           61: i_mem[i_addr]=16'h0000 ;
           62: i_mem[i_addr]=16'h0000 ;
           63: i_mem[i_addr]=16'h0000 ;
           64: i_mem[i_addr]<={`SUBI,`gr4,8'h1};//(4)
           65: i_mem[i_addr]=16'h0000 ;
           66: i_mem[i_addr]=16'h0000 ;
           67: i_mem[i_addr]=16'h0000 ;
           68: i_mem[i_addr]<={`BN,`gr0,8'b0001_0100};//jumpto(5)
           69: i_mem[i_addr]=16'h0000 ;
           70: i_mem[i_addr]=16'h0000 ;
           71: i_mem[i_addr]=16'h0000 ;
           72: i_mem[i_addr]<={`ADD,`gr5,1'b0,`gr5,1'b0,`gr1};
           73: i_mem[i_addr]=16'h0000 ;
           74: i_mem[i_addr]=16'h0000 ;
           75: i_mem[i_addr]=16'h0000 ;
           76: i_mem[i_addr]<={`JUMP,11'b000_0001_0000};//jumpto(4)
           77: i_mem[i_addr]=16'h0000 ;
           78: i_mem[i_addr]=16'h0000 ;
           79: i_mem[i_addr]=16'h0000 ;
           80: i_mem[i_addr]<={`STORE,`gr5,1'b0,`gr0,4'b0100};//(5)
           81: i_mem[i_addr]=16'h0000 ;
           82: i_mem[i_addr]=16'h0000 ;
           83: i_mem[i_addr]=16'h0000 ;
           84: i_mem[i_addr]<={`LOAD,`gr1,1'b0,`gr0,4'b0011};//最大公因数
           85: i_mem[i_addr]=16'h0000 ;
           86: i_mem[i_addr]=16'h0000 ;
           87: i_mem[i_addr]=16'h0000 ;
           88: i_mem[i_addr]<={`LOAD,`gr2,1'b0,`gr0,4'b0100};//最小公倍数
           89: i_mem[i_addr]=16'h0000 ;
           90: i_mem[i_addr]=16'h0000 ;
           91: i_mem[i_addr]=16'h0000 ;
           92: i_mem[i_addr]<={`HALT,11'b000_0000_0000};
           93: i_mem[i_addr]=16'h0000 ;
           94: i_mem[i_addr]=16'h0000 ;
           95: i_mem[i_addr]=16'h0000 ;*/
	
	
	//bubble
	/*0: i_mem[i_addr]<={`LOAD,`gr3,1'b0,`gr0,4'b0000};
    1: i_mem[i_addr]=16'h0000 ;
    2: i_mem[i_addr]=16'h0000 ;
    3: i_mem[i_addr]=16'h0000 ;
    4: i_mem[i_addr]<={`SUBI,`gr3,4'd0,4'd2};
    5: i_mem[i_addr]=16'h0000 ;
    6: i_mem[i_addr]=16'h0000 ;
    7: i_mem[i_addr]=16'h0000 ;
    8: i_mem[i_addr]<={`ADD,`gr1,1'b0,`gr0,1'b0,`gr0};
    9: i_mem[i_addr]=16'h0000 ;
    10: i_mem[i_addr]=16'h0000 ;
    11: i_mem[i_addr]=16'h0000 ;
    12: i_mem[i_addr]<={`ADD,`gr2,1'b0,`gr3,1'b0,`gr0};//loop1
    13: i_mem[i_addr]=16'h0000 ;
    14: i_mem[i_addr]=16'h0000 ;
    15: i_mem[i_addr]=16'h0000 ;
    16: i_mem[i_addr]<={`LOAD,`gr4,1'b0,`gr2,4'd1};//loop2
    17: i_mem[i_addr]=16'h0000 ;
    18: i_mem[i_addr]=16'h0000 ;
    19: i_mem[i_addr]=16'h0000 ;
    20: i_mem[i_addr]<={`LOAD,`gr5,1'b0,`gr2,4'd2};
    21: i_mem[i_addr]=16'h0000 ;
    22: i_mem[i_addr]=16'h0000 ;
    23: i_mem[i_addr]=16'h0000 ;
    24: i_mem[i_addr]<={`CMP,3'd0,1'b0,`gr5,1'b0,`gr4};
    25: i_mem[i_addr]=16'h0000 ;
    26: i_mem[i_addr]=16'h0000 ;
    27: i_mem[i_addr]=16'h0000 ;
    28: i_mem[i_addr]<={`BN,`gr0,4'b0000,4'b1010};
    29: i_mem[i_addr]=16'h0000 ;
    30: i_mem[i_addr]=16'h0000 ;
    31: i_mem[i_addr]=16'h0000 ;
    32: i_mem[i_addr]<={`STORE,`gr4,1'b0,`gr2,4'd2};
    33: i_mem[i_addr]=16'h0000 ;
    34: i_mem[i_addr]=16'h0000 ;
    35: i_mem[i_addr]=16'h0000 ;
    36: i_mem[i_addr]<={`STORE,`gr5,1'b0,`gr2,4'd1};
    37: i_mem[i_addr]=16'h0000 ;
    38: i_mem[i_addr]=16'h0000 ;
    39: i_mem[i_addr]=16'h0000 ;
    40: i_mem[i_addr]<={`SUBI,`gr2,4'd0,4'd1};
    41: i_mem[i_addr]=16'h0000 ;
    42: i_mem[i_addr]=16'h0000 ;
    43: i_mem[i_addr]=16'h0000 ;
    44: i_mem[i_addr]<={`CMP,3'd0,1'b0,`gr2,1'b0,`gr1};
    45: i_mem[i_addr]=16'h0000 ;
    46: i_mem[i_addr]=16'h0000 ;
    47: i_mem[i_addr]=16'h0000 ;
    48: i_mem[i_addr]<={`BNN,`gr0,4'h0,4'b0100};
    49: i_mem[i_addr]=16'h0000 ;
    50: i_mem[i_addr]=16'h0000 ;
    51: i_mem[i_addr]=16'h0000 ;
    52: i_mem[i_addr]<={`ADDI,`gr1,4'd0,4'd1};
    53: i_mem[i_addr]=16'h0000 ;
    54: i_mem[i_addr]=16'h0000 ;
    55: i_mem[i_addr]=16'h0000 ;
    56: i_mem[i_addr]<={`CMP,3'd0,1'b0,`gr3,1'b0,`gr1};
    57: i_mem[i_addr]=16'h0000 ;
    58: i_mem[i_addr]=16'h0000 ;
    59: i_mem[i_addr]=16'h0000 ;
    60: i_mem[i_addr]<={`BNN,`gr0,4'h0,4'b0011};
    61: i_mem[i_addr]=16'h0000 ;
    62: i_mem[i_addr]=16'h0000 ;
    63: i_mem[i_addr]=16'h0000 ;
    64: i_mem[i_addr]<={`HALT,11'd0};
    65: i_mem[i_addr]=16'h0000 ;
    66: i_mem[i_addr]=16'h0000 ;
    67: i_mem[i_addr]=16'h0000 ;*/

             
   

	//sort
	/*0: i_mem[i_addr]<={`ADDI,`gr1,4'b0000,4'b1001};
    1: i_mem[i_addr]=16'h0000 ;
    2: i_mem[i_addr]=16'h0000 ;
    3: i_mem[i_addr]=16'h0000 ;
    4: i_mem[i_addr]<={`ADDI,`gr2,4'b0000,4'b1001};
    5: i_mem[i_addr]=16'h0000 ;
    6: i_mem[i_addr]=16'h0000 ;
    7: i_mem[i_addr]=16'h0000 ;
    8: i_mem[i_addr]<={`JUMP,11'b000_0000_0101};//jumptostart
    9: i_mem[i_addr]=16'h0000 ;
    10: i_mem[i_addr]=16'h0000 ;
    11: i_mem[i_addr]=16'h0000 ;
    12: i_mem[i_addr]<={`SUBI,`gr1,4'd0,4'd1};//new_round
    13: i_mem[i_addr]=16'h0000 ;
    14: i_mem[i_addr]=16'h0000 ;
    15: i_mem[i_addr]=16'h0000 ;
    16: i_mem[i_addr]<={`BZ,`gr7,4'b0001,4'b0010};//jumptoend
    17: i_mem[i_addr]=16'h0000 ;
    18: i_mem[i_addr]=16'h0000 ;
    19: i_mem[i_addr]=16'h0000 ;
    20: i_mem[i_addr]<={`LOAD,`gr3,1'b0,`gr0,4'd0};//start
    21: i_mem[i_addr]=16'h0000 ;
    22: i_mem[i_addr]=16'h0000 ;
    23: i_mem[i_addr]=16'h0000 ;
    24: i_mem[i_addr]<={`LOAD,`gr4,1'b0,`gr0,4'd1};
    25: i_mem[i_addr]=16'h0000 ;
    26: i_mem[i_addr]=16'h0000 ;
    27: i_mem[i_addr]=16'h0000 ;
    28: i_mem[i_addr]<={`CMP,3'd0,1'b0,`gr3,1'b0,`gr4};
    29: i_mem[i_addr]=16'h0000 ;
    30: i_mem[i_addr]=16'h0000 ;
    31: i_mem[i_addr]=16'h0000 ;
    32: i_mem[i_addr]<={`BN,`gr7,4'h0,4'b1011};//jumptoNO_OP
    33: i_mem[i_addr]=16'h0000 ;
    34: i_mem[i_addr]=16'h0000 ;
    35: i_mem[i_addr]=16'h0000 ;
    36: i_mem[i_addr]<={`STORE,`gr3,1'b0,`gr0,4'd1};
    37: i_mem[i_addr]=16'h0000 ;
    38: i_mem[i_addr]=16'h0000 ;
    39: i_mem[i_addr]=16'h0000 ;
    40: i_mem[i_addr]<={`STORE,`gr4,1'b0,`gr0,4'd0};
    41: i_mem[i_addr]=16'h0000 ;
    42: i_mem[i_addr]=16'h0000 ;
    43: i_mem[i_addr]=16'h0000 ;
    44: i_mem[i_addr]<={`ADDI,`gr0,4'b0000,4'b0001};//NO_OP
    45: i_mem[i_addr]=16'h0000 ;
    46: i_mem[i_addr]=16'h0000 ;
    47: i_mem[i_addr]=16'h0000 ;
    48: i_mem[i_addr]<={`CMP,3'd0,1'b0,`gr0,1'b0,`gr2};
    49: i_mem[i_addr]=16'h0000 ;
    50: i_mem[i_addr]=16'h0000 ;
    51: i_mem[i_addr]=16'h0000 ;
    52: i_mem[i_addr]<={`BN,`gr7,4'b0001,4'b0001};//jumptocontinue
    53: i_mem[i_addr]=16'h0000 ;
    54: i_mem[i_addr]=16'h0000 ;
    55: i_mem[i_addr]=16'h0000 ;
    56: i_mem[i_addr]<={`SUBI,`gr2,4'd0,4'd1};
    57: i_mem[i_addr]=16'h0000 ;
    58: i_mem[i_addr]=16'h0000 ;
    59: i_mem[i_addr]=16'h0000 ;
    60: i_mem[i_addr]<={`SUB,`gr0,1'b0,`gr0,1'b0,`gr0};
    61: i_mem[i_addr]=16'h0000 ;
    62: i_mem[i_addr]=16'h0000 ;
    63: i_mem[i_addr]=16'h0000 ;
    64: i_mem[i_addr]<={`JUMP,11'b000_0000_0011};//jumptonewround
    65: i_mem[i_addr]=16'h0000 ;
    66: i_mem[i_addr]=16'h0000 ;
    67: i_mem[i_addr]=16'h0000 ;
    68: i_mem[i_addr]<={`JUMP,11'b000_0000_0101};//jumptostart,continue
    69: i_mem[i_addr]=16'h0000 ;
    70: i_mem[i_addr]=16'h0000 ;
    71: i_mem[i_addr]=16'h0000 ;
    72: i_mem[i_addr]<={`HALT,11'd0};
    73: i_mem[i_addr]=16'h0000 ;
    74: i_mem[i_addr]=16'h0000 ;
    75: i_mem[i_addr]=16'h0000 ;*/
    
    		//64-bit adder
/*0: i_mem[i_addr]=16'h4c04;
1: i_mem[i_addr]=16'h0000 ;
2: i_mem[i_addr]=16'h0000 ;
3: i_mem[i_addr]=16'h0000 ;
4: i_mem[i_addr]=16'h1100;
5: i_mem[i_addr]=16'h0000 ;
6: i_mem[i_addr]=16'h0000 ;
7: i_mem[i_addr]=16'h0000 ;
8: i_mem[i_addr]=16'h1204;
9: i_mem[i_addr]=16'h0000 ;
10: i_mem[i_addr]=16'h0000 ;
11: i_mem[i_addr]=16'h0000 ;
12: i_mem[i_addr]=16'h4312;
13: i_mem[i_addr]=16'h0000 ;
14: i_mem[i_addr]=16'h0000 ;
15: i_mem[i_addr]=16'h0000 ;
16: i_mem[i_addr]=16'hfd06;//bncto6
17: i_mem[i_addr]=16'h0000 ;
18: i_mem[i_addr]=16'h0000 ;
19: i_mem[i_addr]=16'h0000 ;
20: i_mem[i_addr]=16'h4e01;
21: i_mem[i_addr]=16'h0000 ;
22: i_mem[i_addr]=16'h0000 ;
23: i_mem[i_addr]=16'h0000 ;
24: i_mem[i_addr]=16'h4337;
25: i_mem[i_addr]=16'h0000 ;
26: i_mem[i_addr]=16'h0000 ;
27: i_mem[i_addr]=16'h0000 ;
28: i_mem[i_addr]=16'hfd0b;//bncto11
29: i_mem[i_addr]=16'h0000 ;
30: i_mem[i_addr]=16'h0000 ;
31: i_mem[i_addr]=16'h0000 ;
32: i_mem[i_addr]=16'h5e00;
33: i_mem[i_addr]=16'h0000 ;
34: i_mem[i_addr]=16'h0000 ;
35: i_mem[i_addr]=16'h0000 ;
36: i_mem[i_addr]=16'hdd0b;//bnzto11
37: i_mem[i_addr]=16'h0000 ;
38: i_mem[i_addr]=16'h0000 ;
39: i_mem[i_addr]=16'h0000 ;
40: i_mem[i_addr]=16'h4e01;
41: i_mem[i_addr]=16'h0000 ;
42: i_mem[i_addr]=16'h0000 ;
43: i_mem[i_addr]=16'h0000 ;
44: i_mem[i_addr]=16'h5777;
45: i_mem[i_addr]=16'h0000 ;
46: i_mem[i_addr]=16'h0000 ;
47: i_mem[i_addr]=16'h0000 ;
48: i_mem[i_addr]=16'h4776;
49: i_mem[i_addr]=16'h0000 ;
50: i_mem[i_addr]=16'h0000 ;
51: i_mem[i_addr]=16'h0000 ;
52: i_mem[i_addr]=16'h5666;
53: i_mem[i_addr]=16'h0000 ;
54: i_mem[i_addr]=16'h0000 ;
55: i_mem[i_addr]=16'h0000 ;
56: i_mem[i_addr]=16'h1b08;
57: i_mem[i_addr]=16'h0000 ;
58: i_mem[i_addr]=16'h0000 ;
59: i_mem[i_addr]=16'h0000 ;
60: i_mem[i_addr]=16'h4801;
61: i_mem[i_addr]=16'h0000 ;
62: i_mem[i_addr]=16'h0000 ;
63: i_mem[i_addr]=16'h0000 ;
64: i_mem[i_addr]=16'h6004;
65: i_mem[i_addr]=16'h0000 ;
66: i_mem[i_addr]=16'h0000 ;
67: i_mem[i_addr]=16'h0000 ;
68: i_mem[i_addr]=16'he501;//bnto1
69: i_mem[i_addr]=16'h0000 ;
70: i_mem[i_addr]=16'h0000 ;
71: i_mem[i_addr]=16'h0000 ;
72: i_mem[i_addr]=16'h0800;
73: i_mem[i_addr]=16'h0000 ;
74: i_mem[i_addr]=16'h0000 ;
75: i_mem[i_addr]=16'h0000 ;*/