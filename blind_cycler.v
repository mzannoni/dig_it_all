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

module blind_cycler(
    input wire dir,
    input wire nxt,
    output reg [2:0] out_num
);

    reg [1:0] cur_st;

    always @(posedge nxt) begin
        case (cur_st)
            2'b00 :
                begin
                if (dir == 0)
                    cur_st <= 2'b01;
                else
                    cur_st <= 2'b11;
                end
            2'b01 :
                begin
                if (dir == 0)
                    cur_st <= 2'b10;
                else
                    cur_st <= 2'b00;
                end
            2'b10 :
                begin
                if (dir == 0)
                    cur_st <= 2'b11;
                else
                    cur_st <= 2'b01;
                end
            2'b11 :
                begin
                if (dir == 0)
                    cur_st <= 2'b00;
                else
                    cur_st <= 2'b10;
                end
            default : cur_st <= 2'b00; // at init cur_st is undefined, so it doesn't trigger any of the above
        endcase
    end

    always @(cur_st) begin
        case (cur_st)
            2'b00 : out_num <= 3'b000;
            2'b01 : out_num <= 3'b010;
            2'b10 : out_num <= 3'b101;
            2'b11 : out_num <= 3'b111;
            default : out_num <= 3'b000;
        endcase
    end
endmodule
