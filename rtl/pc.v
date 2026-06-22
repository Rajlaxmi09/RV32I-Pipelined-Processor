module pc(
    input clk,
    input reset,
    input stall,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc_out <= 32'd0;
    else if(!stall)
        pc_out <= pc_in;
end

endmodule