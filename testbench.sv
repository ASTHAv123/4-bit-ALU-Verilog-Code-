`timescale 1ns/1ps

module tb_alu_4bit;

    // Testbench signals
    logic [3:0] A, B;
    logic [2:0] ALU_Sel;
    logic [3:0] ALU_Out;
    logic CarryOut;

    // Instantiate DUT (Design Under Test)
    alu_4bit uut (
        .A(A), .B(B), .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out), .CarryOut(CarryOut)
    );

    initial begin
        // Dump waveforms for GTKWave
        $dumpfile("alu_wave.vcd");   // VCD = Value Change Dump
        $dumpvars(0, tb_alu_4bit);

        // Stimulus
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b000; #10; // ADD
        ALU_Sel = 3'b001; #10; // SUB
        ALU_Sel = 3'b010; #10; // AND
        ALU_Sel = 3'b011; #10; // OR
        ALU_Sel = 3'b100; #10; // XOR

        // SLT cases
        A = 4'b0010; B = 4'b0110; ALU_Sel = 3'b101; #10;
        A = 4'b1110; B = 4'b0110; ALU_Sel = 3'b101; #10;

        $finish;
    end

endmodule
