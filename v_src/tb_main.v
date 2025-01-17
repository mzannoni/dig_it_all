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

// not used here to prevent a warning from Verilator
// `timescale 10ps/10ps

module tb_main;

    reg nxt = 0;
    reg dir = 0;

    wire [2:0] out_num;

    initial begin
        $dumpfile("../output/outwv.vcd");
        $dumpvars();

        #400 $finish;  // this means 400 times the time unit, defined with `timescale
    end

    blind_cycler uut (dir, nxt, out_num);

    always #20 nxt = !nxt;

    always #210 dir = 1'b1;

endmodule // tb_main
