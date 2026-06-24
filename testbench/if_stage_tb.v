`timescale 1ns/1ps

module if_stage_tb;

reg clk;
reg reset;
reg stall;

wire [31:0] pc_out;
wire [31:0] instruction;

if_stage DUT(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .pc_out(pc_out),
    .instruction(instruction)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    reset = 1;
    stall = 0;

    #10;
    reset = 0;

    #250;

    $finish;
end

initial begin
    $monitor(
        "Time=%0t PC=%d Instruction=%h",
        $time,
        pc_out,
        instruction
    );
end

endmodule