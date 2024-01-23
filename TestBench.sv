// Here a testbench vor the file design.sv
// You can run this and design.sv program in verilog to see the result
// You can run it via https://www.edaplayground.com/ website
module tb_full_adder_4bit;

  // Inputs
  reg CLK;
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;

  // Outputs
  wire [4:0] Sum;
  wire [4:0] Cout;

  // Instantiate the full adder module
  full_adder_4bit uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout),
    .clk(CLK)
  );
  
initial
begin
	CLK = 0;
//   #700;
	forever
	#20 CLK = ~CLK;	
end

  // Initial block for testbench stimulus
  initial begin
    // Test case 1: A = 1101, B = 0101, Cin = 0
    A = 4'b1101;
    B = 4'b0101;
    Cin = 0;
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
#1000 
    // Apply inputs and display the results
    #1000 $display("Test Case 1: A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
@(posedge CLK);
//     @(posedge CLK);
    // Test case 2: A = 1010, B = 0110, Cin = 1
    A = 4'b1010;
    B = 4'b0110;
    Cin = 1;
@(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    
    // Apply inputs and display the results
    #1000 $display("Test Case 2: A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
    
     // Test case 3: A = 1111, B = 1111, Cin = 1
    A = 4'b1111;
    B = 4'b1111;
    Cin = 1;
@(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    
    // Apply inputs and display the results
    #1000 $display("Test Case 2: A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);

    // Add more test cases as needed

    // Terminate simulation
    #10 $finish;
  end

// endmodule
   initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
   end
endmodule
