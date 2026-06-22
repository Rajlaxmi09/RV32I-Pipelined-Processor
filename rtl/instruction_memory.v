module instruction_memory(
    input [31:0] inst_address,
    output reg [31:0] instruction
);

reg [7:0] inst_mem [0:255];

initial begin

    // Instruction 1
    {inst_mem[3],inst_mem[2],inst_mem[1],inst_mem[0]}
        = 32'h00000913;

    // Instruction 2
    {inst_mem[7],inst_mem[6],inst_mem[5],inst_mem[4]}
        = 32'h00000433;

end

always @(*) begin
    instruction[7:0]   = inst_mem[inst_address];
    instruction[15:8]  = inst_mem[inst_address+1];
    instruction[23:16] = inst_mem[inst_address+2];
    instruction[31:24] = inst_mem[inst_address+3];
end

endmodule