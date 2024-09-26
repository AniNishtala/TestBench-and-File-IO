`timescale 1ns/1ps
/*`include "inputA"
`include "inputB" */
module tb_testbench;
reg [3:0] A;
reg [3:0] B;
wire [3:0] sum;
reg clk;
integer fileA; // first input 
integer fileB; // second input file
integer fileC; //output file
integer statusA;
integer statusB;
integer i;



//instantiate module
adder dut (

	.A(A),
	.B(B),
	.clk(clk),
	.sum(sum)
);

// Clock generation
always #5 clk = ~clk; // 10 time units clock period

initial begin
	clk = 0;
        // Open the input files for reading
        fileA = $fopen("inputA.txt", "r");
	#10 
        fileB = $fopen("inputB.txt", "r");
	#10
        // Open the output file for writing
        fileC = $fopen("outputC.txt", "w");
	#10
        // Loop through and read 10 numbers from input files
        for (i = 0; i < 10; i = i + 1) 
	begin
            // Read a line from each input file
            statusA = $fscanf(fileA, "%h\n", A);
	#10
            statusB = $fscanf(fileB, "%h\n", B);
	#10
            // Wait for one clock cycle to capture the sum
            @(posedge clk); // fix this here
            
            // Write the result to the output file in hexadecimal format
            $fwrite(fileC, "%h\n", sum);
	end
        // Close the files
        $fclose(fileA);
        $fclose(fileB);
        $fclose(fileC);
        // End sim
        $stop;
    end
endmodule