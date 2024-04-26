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

module tb_main;

    reg nxt = 0;
    reg dir = 0;

    wire [2:0] out_num;

    initial begin
        $dumpfile("../output/outwv.vcd");
        $dumpvars(0,tb_main);

        #400 $finish;
    end

    blind_cycler uut (dir, nxt, out_num);

    always #20 nxt = !nxt;

    always #200 dir = 1'b1;

endmodule // tb_main
