`timescale 1ns / 1ps

module ifid_tb;

reg clk;
reg reset;

reg [31:0] pc_in;
reg [31:0] instruction_in;

wire [31:0] pc_out;
wire [31:0] instruction_out;

// Instantiate DUT
IFID dut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .instruction_in(instruction_in),
    .pc_out(pc_out),
    .instruction_out(instruction_out)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    pc_in = 0;
    instruction_in = 0;

    #10;
    reset = 0;

    // First instruction
    pc_in = 32'd0;
    instruction_in = 32'h00000913;

    #10;

    // Second instruction
    pc_in = 32'd4;
    instruction_in = 32'h00000433;

    #10;

    // Third instruction
    pc_in = 32'd8;
    instruction_in = 32'h04B40863;

    #20;

    $finish;
end

initial
begin
    $monitor(
        "Time=%0t pc_in=%d instr_in=%h | pc_out=%d instr_out=%h",
        $time,
        pc_in,
        instruction_in,
        pc_out,
        instruction_out
    );
end

endmodule