module accumulator_cpu(
    input clk,
    input rst_n,
    output reg [7:0] accumulator,
    output reg halted
);
    reg [3:0] PC;
    reg [7:0] instruction;
    reg [7:0] program_memory [0:15];
    reg [7:0] data_memory [0:15];
    reg [1:0] state;
    integer j;

    parameter FETCH = 2'b00, DECODE = 2'b01, EXECUTE = 2'b10;

    initial begin
        program_memory[0] = 8'h25; // LDI 0x5
        program_memory[1] = 8'h10; // STA 0x0
        program_memory[2] = 8'h23; // LDA 0x3
        program_memory[3] = 8'h30; // ADD 0x0
        program_memory[4] = 8'h11; // STA 0x1
        program_memory[5] = 8'hA0; // HLT
        for (j = 6; j < 16; j = j + 1) begin
            program_memory[j] = 8'h00; // Zero the rest of program memory
        end
        for (j = 0; j < 16; j = j + 1) begin
            data_memory[j] = 8'h00; // Zero data memory
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            PC <= 0;
            accumulator <= 0;
            halted <= 0;
            state <= FETCH;
        end else if (!halted) begin
            case(state)
                FETCH: begin
                    instruction <= program_memory[PC];
                    PC <= PC + 1;
                    state <= DECODE;
                end
                DECODE: begin
                    state <= EXECUTE;
                end
                EXECUTE: begin
                    case(instruction[7:4])
                        4'h0: accumulator <= data_memory[instruction[3:0]]; // LDA
                        4'h1: data_memory[instruction[3:0]] <= accumulator; // STA
                        4'h2: accumulator <= {4'h0, instruction[3:0]}; // LDI
                        4'h3: accumulator <= accumulator + data_memory[instruction[3:0]]; // ADD
                        4'h4: accumulator <= accumulator - data_memory[instruction[3:0]]; // SUB
                        4'h5: accumulator <= accumulator & data_memory[instruction[3:0]]; // AND
                        4'h6: accumulator <= accumulator | data_memory[instruction[3:0]]; // OR
                        4'h7: accumulator <= accumulator ^ data_memory[instruction[3:0]]; // XOR
                        4'h8: PC <= instruction[3:0]; // JMP
                        4'h9: if (accumulator == 0) PC <= instruction[3:0]; // JZ
                        4'hA: halted <= 1; // HLT
                        default: ; // No operation for undefined opcodes
                    endcase
                    state <= FETCH;
                end
            endcase
        end
    end
endmodule