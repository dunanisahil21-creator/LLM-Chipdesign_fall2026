`timescale 1ns/1ps
module tb_cpu();
reg clk, rst_n; wire [7:0] accumulator; wire halted;
accumulator_cpu dut(.clk(clk),.rst_n(rst_n),.accumulator(accumulator),.halted(halted));
initial clk=0; always #5 clk=~clk;
initial begin
  rst_n=0; #12 rst_n=1;
  wait(halted); #20;
  $display("Final accumulator = %d (expected 8)", accumulator);
  $display("data_memory[0] = %d (expected 5)", dut.data_memory[0]);
  $display("data_memory[1] = %d (expected 8)", dut.data_memory[1]);
  $display("halted = %b (expected 1)", halted);
  if(accumulator==8 && dut.data_memory[0]==5 && dut.data_memory[1]==8 && halted)
    $display(">>> CPU TEST PASSED");
  else $display(">>> CPU TEST FAILED");
  $finish;
end
endmodule