`timescale 1ns / 1ps

module instruction_parser_tb;

reg [31:0] instruction;

wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;

instruction_parser dut(
    .instruction(instruction),

    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
);

initial
begin

    // Instruction from your IF stage simulation
    instruction = 32'h013989B3;

    #10;

    instruction = 32'h00898993;

    #10;

    instruction = 32'h02BE8663;

    #10;

    $finish;

end

initial
begin
    $monitor(
        "Time=%0t Instruction=%h Opcode=%b RD=%d RS1=%d RS2=%d Funct3=%b Funct7=%b",
        $time,
        instruction,
        opcode,
        rd,
        rs1,
        rs2,
        funct3,
        funct7
    );
end

endmodule