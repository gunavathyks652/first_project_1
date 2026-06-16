module testbench;

    reg  [7:0] a;
    reg  [7:0] b;
    reg  [2:0] sel;
    wire [7:0] c;

    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .c(c)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);

        a = 8'd10;       b = 8'd5;   sel = 3'b000;  #10;
        a = 8'd10;       b = 8'd5;   sel = 3'b001;  #10;
        a = 8'd6;        b = 8'd4;   sel = 3'b010;  #10;
        a = 8'hAA;       b = 8'h55;  sel = 3'b011;  #10;
        a = 8'hAA;       b = 8'h55;  sel = 3'b100;  #10;
        a = 8'hFF;       b = 8'h0F;  sel = 3'b101;  #10;
        a = 8'hFF;       b = 8'd0;   sel = 3'b110;  #10;
        a = 8'b10101010; b = 8'd0;   sel = 3'b111;  #10;

        $finish;
    end

endmodule