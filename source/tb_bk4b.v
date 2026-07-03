`timescale 1ns/1ps

module tb_bk4b;

    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    integer i, j, k;
    reg [4:0] expected;

    bk4b dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $display("Starting exhaustive test...");

        for (k = 0; k < 2; k = k + 1) begin
            Cin = k;

            for (i = 0; i < 16; i = i + 1) begin
                A = i;

                for (j = 0; j < 16; j = j + 1) begin
                    B = j;

                    #1; // Wait for combinational logic

                    expected = A + B + Cin;

                    if ({Cout, Sum} !== expected) begin
                        $display("ERROR:");
                        $display("A=%b B=%b Cin=%b", A, B, Cin);
                        $display("Expected = %b", expected);
                        $display("Got      = %b%b", Cout, Sum);
                        $finish;
                    end
                end
            end
        end

        $display("==================================");
        $display("All 512 test cases PASSED!");
        $display("==================================");
        $finish;
    end
endmodule