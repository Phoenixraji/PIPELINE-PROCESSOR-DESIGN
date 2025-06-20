# PIPELINE-PROCESSOR-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: RAJALAKSHMI C  

*INTERN ID*: CT4MVRK

*DOMAIN*: VLSI

*DURATION*: 4 MONTHS

*MENTOR*: NEELA SANTHOSH

**DESCRIPTION**:

Description of 4-Stage Pipelined Processor Design and Simulation

As part of the VLSI Internship Program at CodTech, the third task required the design and simulation of a 4-stage pipelined processor. This task aims to give practical understanding of how pipelining improves processor performance by overlapping multiple instruction stages.

🧠 Design Overview
The processor implements a 4-stage pipeline, which includes:
Instruction Fetch (IF)
Instruction Decode (ID)
Execute (EX)
Write Back (WB)
Internally, the processor contains:
Instruction memory (instr_mem[0:15]): Holds 8-bit encoded instructions.
Register file (reg_file[0:7]): Stores 8-bit values used in arithmetic and load operations.
Pipeline registers (IF_ID, ID_EX, EX_MEM, MEM_WB): Pass instruction and data values through each stage of the pipeline.

🧾 Instruction Encoding
Each 8-bit instruction is divided as follows:
Bits [7:6]: Operation code
00 → ADD
01 → SUB
10 → LOAD
Bits [3:2] and [1:0]: Register indices used for source and destination.
Example Instructions:

verilog
Copy
Edit
instr_mem[0] = 8'b00000001; // ADD R0, R1
instr_mem[1] = 8'b00010010; // SUB R0, R2
instr_mem[2] = 8'b00100011; // LOAD R0, R3

🧪 Simulation and Testbench
The simulation is handled by a testbench named tb_pipeline_processor. It includes:
A clock generator with a 10ns period.
A reset signal to initialize pipeline registers.
A 100ns simulation window to allow multiple clock cycles to execute instructions.
The $dumpfile("pipeline.vcd") and $dumpvars system tasks generate a VCD file that allows waveform visualization using tools like EPWave or GTKWave.

🛠 EDA Playground Environment
The design was tested using EDA Playground, an online Verilog simulator that:
Supports Icarus Verilog for compiling and running Verilog code.
Provides a built-in waveform viewer EPWave.
Enables testing and visualization of pipelined data propagation and register updates.
Using this tool, the processor's internal data flow across the four stages was successfully observed and validated.

✅ Conclusion
This task deepened understanding of pipelined architecture, a fundamental concept in modern processors. By dividing execution into stages and using registers between stages, instructions were able to execute in parallel, improving throughput. The hands-on simulation and waveform analysis helped visualize instruction flow and reinforced the importance of pipeline control and timing in digital system design.

**OUTPUT**
![Image](https://github.com/user-attachments/assets/453e3711-09c8-41ae-8f80-9f36e00a9030)[](url)
