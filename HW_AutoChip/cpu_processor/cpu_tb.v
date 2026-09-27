module tb_cpu;

    reg clk;
    reg rst_n;
    wire [7:0] accumulator;
    wire halted;
    wire [7:0] data_memory [0:15]; // Hierarchical reference to data memory

    // Instantiate the accumulator_cpu
    accumulator_cpu dut (
        .clk(clk),
        .rst_n(rst_n),
        .accumulator(accumulator),
        .halted(halted)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test procedure
    initial begin
        // Initialize reset
        rst_n = 0; // Assert reset
        #10; // Wait for a few clock cycles
        rst_n = 1; // Deassert reset

        // Wait for halted signal
        wait (halted == 1'b1);
        
        // Check results
        if (accumulator == 8'h08 && dut.data_memory[0] == 8'h05 && dut.data_memory[1] == 8'h08) begin
            $display("PASS: Accumulator = %d, data_memory[0] = %d, data_memory[1] = %d", 
                     accumulator, dut.data_memory[0], dut.data_memory[1]);
        end else begin
            $display("FAIL: Accumulator = %d, data_memory[0] = %d, data_memory[1] = %d", 
                     accumulator, dut.data_memory[0], dut.data_memory[1]);
        end
        
        $finish; // End simulation
    end

endmodule