////////////////////////////////////////
// Creator: Massimo "Bill" Zannoni
//
//
//           /|                   /|
//         _/ |___                ||
//       /__   ___ \         /|   ||
//          | |   \ \   /|   ||   ||
//         _| |___/ /   |/   ||   ||
//        /_   __  /         ||   ||
//          | |   \ \   /|   ||   ||
//    ______| |___/ /   ||   ||   ||
//  /_______   ____/    |/   |/   ||
//          | |                   |/
//          | /
//          |/
//
////////////////////////////////////////

`timescale 10ps/10ps

module tb_countones_tst(
    output logic [1:0] out_o  // size needs to be log2(InCnt) to store the index of which of the count elements is selected
);

    localparam InCnt = 4;  // number of inputs
    localparam InWdt = 8;  // width of each input
    localparam CntWdt = 16;

    logic [InWdt-1:0] count_in [InCnt-1:0];
    reg [CntWdt-1:0] count [InCnt-1:0];

    genvar k;
    generate
        for(k=0; k<InCnt; k=k+1) begin
            count_ones #(.Width(InWdt), .OutWidth(CntWdt)) count_ones_i (.in_i(count_in[k]), .out_o(count[k]));
        end
    endgenerate

    initial begin
        if ($test$plusargs("trace") != 0) begin
            $dumpfile("../output/out_w.vcd");
            $dumpvars();
        end

        // This example is specific for InCnt==4 and InWdt==8
        #10 begin
            count_in[0] = 8'b10101010;
            count_in[1] = 8'b00001111;
            count_in[2] = 8'b11111111;
            count_in[3] = 8'b00000000;
        end
        #210 begin
            count_in[0] = 8'b01010101;
            count_in[1] = 8'b11111111;
            count_in[2] = 8'b11111110;
            count_in[3] = 8'b01000000;
        end

        #220 $finish;
    end

    int max_cnt;
    int max_cnt_idx;
    // always@(count) begin  // this line seems to work only with Verilator, but apparently is illegal Verilog
    // FIXME: fix the code to correctly implement parametrization, but in legal Verilog code
    always@(count[0], count[1], count[2], count[3]) begin  // iverilog can't expand arrays in sensitivity lists, which is anyhow correct according to Verilog        max_cnt = 0;
        max_cnt_idx = 0;
        for (int i = 0; i<InCnt; i = i+1) begin
            // note the explicit width expansions
            if (($size(max_cnt))'(count[i]) > max_cnt) begin
                max_cnt_idx = i;
                max_cnt = $size(max_cnt)'(count[i]);
            end
        end
    end
    assign out_o = max_cnt_idx[1:0];

endmodule

module count_ones
    #(
        parameter Width = 8,
        parameter OutWidth = 16
    )
    (
        input logic [Width-1:0] in_i,
        output logic [OutWidth-1:0] out_o
    );

    always_comb begin
        out_o = 0;
        foreach(in_i[idx]) begin
            out_o += (in_i[idx] == 1) ? 1 : 0;
        end
    end
endmodule
