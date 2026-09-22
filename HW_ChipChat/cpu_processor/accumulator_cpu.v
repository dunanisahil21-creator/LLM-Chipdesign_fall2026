module accumulator_cpu(input clk,input rst_n,output reg [7:0] accumulator,output reg halted);
reg [3:0] PC; reg [7:0] instruction;
reg [7:0] program_memory [0:15]; reg [7:0] data_memory [0:15];
reg [1:0] state; integer j;
parameter FETCH=2'b00, DECODE=2'b01, EXECUTE=2'b10;
initial begin
  program_memory[0]=8'h25; program_memory[1]=8'h10; program_memory[2]=8'h23;
  program_memory[3]=8'h30; program_memory[4]=8'h11; program_memory[5]=8'hA0;
  for(j=6;j<16;j=j+1) program_memory[j]=8'h00;
  for(j=0;j<16;j=j+1) data_memory[j]=8'h00;
end
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin PC<=0; accumulator<=0; halted<=0; state<=FETCH; end
  else if(!halted) case(state)
    FETCH: begin instruction<=program_memory[PC]; PC<=PC+1; state<=DECODE; end
    DECODE: state<=EXECUTE;
    EXECUTE: begin
      case(instruction[7:4])
        4'h0: accumulator<=data_memory[instruction[3:0]];
        4'h1: data_memory[instruction[3:0]]<=accumulator;
        4'h2: accumulator<={4'h0,instruction[3:0]};
        4'h3: accumulator<=accumulator+data_memory[instruction[3:0]];
        4'h4: accumulator<=accumulator-data_memory[instruction[3:0]];
        4'h5: accumulator<=accumulator&data_memory[instruction[3:0]];
        4'h6: accumulator<=accumulator|data_memory[instruction[3:0]];
        4'h7: accumulator<=accumulator^data_memory[instruction[3:0]];
        4'h8: PC<=instruction[3:0];
        4'h9: if(accumulator==0) PC<=instruction[3:0];
        4'hA: halted<=1;
      endcase
      state<=FETCH;
    end
  endcase
end
endmodule