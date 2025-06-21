// -----------------------------
// 4-Stage Pipelined Processor
// -----------------------------
module pipeline_processor (
    input clk,
    input reset
);

    reg [7:0] instr_mem [0:15];  // Instruction Memory
    reg [7:0] reg_file [0:7];    // Register File

    reg [7:0] IF_ID, ID_EX, EX_MEM, MEM_WB;

    integer i;

    // Initialize
    initial begin
        for (i = 0; i < 8; i = i + 1)
            reg_file[i] = i;

        instr_mem[0] = 8'b00000001; // ADD R0, R1
        instr_mem[1] = 8'b00010010; // SUB R0, R2
        instr_mem[2] = 8'b00100011; // LOAD R0, R3
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            IF_ID <= 0; ID_EX <= 0; EX_MEM <= 0; MEM_WB <= 0;
        end else begin
            // Stage 1: Instruction Fetch
            IF_ID <= instr_mem[IF_ID[3:0]];

            // Stage 2: Instruction Decode
            ID_EX <= IF_ID;

            // Stage 3: Execute
            case (ID_EX[7:6])
                2'b00: EX_MEM <= reg_file[ID_EX[3:2]] + reg_file[ID_EX[1:0]]; // ADD
                2'b01: EX_MEM <= reg_file[ID_EX[3:2]] - reg_file[ID_EX[1:0]]; // SUB
                2'b10: EX_MEM <= reg_file[ID_EX[3:0]]; // LOAD
            endcase

            // Stage 4: Write Back
            MEM_WB <= EX_MEM;
        end
    end

endmodule
