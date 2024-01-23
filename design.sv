module full_adder_4bit (
  input clk,
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output reg [4:0] Sum,
  output reg [4:0]Cout
);

  integer i; 
  
  always@ (posedge clk)
	begin
//       for (i = 0; i <=4 ; i = i + 1)
//         Sum[i] <=0;
                 
      Cout[0]<=Cin;
            
      for (i = 0; i <= 3; i = i + 1)
        begin
          Sum[i] <= A[i] ^ B[i] ^ Cout[i];
          Cout[i+1] <= (((A[i] ^ B[i]) & Cout[i]) || (A[i] & B[i]));
//           Cin <=Cout;
        end
      if (Cout[4]==1)
        Sum[4]<=1;
      else Sum[4]<=0;
		
end

endmodule
