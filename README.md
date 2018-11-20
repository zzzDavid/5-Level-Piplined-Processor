# 5-Level Piplined CPU
```
University: Sun Yat-sen University
Cousrse: Digital Integrated Circuit Design
Mid-term Project: Piplined Processor with Hazard
```
```
IDE: Vivado 2017.4
```

## Design Description: 
5-level piplined processor, with 8 general registers.32 operations are defined, of which 27 operations are tested by now.The other 5 is defined by me but not yet tested. Further explanation available in course slides and student report.

## File Description:
```
cpu_part: computation units of processor, main design file, work with data memory and instruction memory.

cpu_tb_part: simulation file for cpu_part. It performs value assignment operation for cpu_part, which in real life is the job of data memory and instruction memory. 

processor: top module of design file, with cpu_part, data_mem, instr_mem initiated in the module. It includes the whole processor system, where cpu work with data memory and instruction memory. 

t_processor: simulation file for processor.v. It provides a testbench for processor, and output file "dmem.mem.master", which contains the address and data in data memory. This output file serves as a verification of operation results. 

inst_test folder: contains files for complex instruction test.

data_mem: an implemetation of data memory. Data is initiated inside its definition. 

instr_mem: an implementation of instruction memory. Instructions are written inside. 

dmem.mem.master: output file of t_processor, which contains desired output of our processor. 

time.xdc: time constriction file of processor, used in timing analysis. Change the clock period inside to approach maximum clock frequency. 
```

## File Hierarchy:

A complete Vivado Project is contained in "pcpu" folder. With synthesis completed. File Hierarchy can be viewed inside. 
