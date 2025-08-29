module alu_4bit (
    input  logic [3:0] A, B,
    input  logic [2:0] ALU_Sel,
    output logic [3:0] ALU_Out,
    output logic CarryOut
);

always_comb begin
    unique case (ALU_Sel)
        3'b000: {CarryOut, ALU_Out} = A + B;     
        3'b001: {CarryOut, ALU_Out} = A - B;     
        3'b010: begin ALU_Out = A & B; CarryOut = 0; end 
        3'b011: begin ALU_Out = A | B; CarryOut = 0; end 
        3'b100: begin ALU_Out = A ^ B; CarryOut = 0; end 
        3'b101: begin ALU_Out = (A < B) ? 4'b0001 : 4'b0000; CarryOut = 0; end 
        default: begin ALU_Out = 4'b0000; CarryOut = 0; end
    endcase
end

endmodule
