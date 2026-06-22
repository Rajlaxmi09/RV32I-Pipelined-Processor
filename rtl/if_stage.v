module if_stage(
    input clk,
    input reset,
    input stall,

    output [31:0] pc_out,
    output [31:0] instruction
);

wire [31:0] next_pc;

pc PC(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .pc_in(next_pc),
    .pc_out(pc_out)
);

adder ADDER(
    .a(pc_out),
    .b(32'd4),
    .out(next_pc)
);

instruction_memory IMEM(
    .inst_address(pc_out),
    .instruction(instruction)
);

endmodule