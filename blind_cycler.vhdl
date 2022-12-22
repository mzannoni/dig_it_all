----------------------------------------
-- Creator: Massimo "Bill" Zannoni
--
--
--           /|                   /|
--         _/ |___                ||
--       /__   ___ \         /|   ||
--          | |   \ \   /|   ||   ||
--         _| |___/ /   |/   ||   ||
--        /_   __  /         ||   ||
--          | |   \ \   /|   ||   ||
--    ______| |___/ /   ||   ||   ||
--  /_______   ____/    |/   |/   ||
--          | |                   |/
--          | /
--          |/
--
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity blind_cycler is
    port(
        dir     : in std_logic;
        nxt     : in std_logic;
        out_num : out std_logic_vector (2 downto 0)
    );

end blind_cycler;

architecture Behavioral of blind_cycler is

type st_id is (A, B, C, D);
signal cur_st;

begin

process (nxt)
begin
    if(nxt'event and nxt = '1') then
        case (cur_st) is
            when A =>
                out_num <= "000";
                if (dir = '0') then
                    cur_st = B;
                else
                    cur_st = D;
                end if;

            when B =>
                out_num <= "010";
                if (dir = '0') then
                    cur_st = C;
                else
                    cur_st = A;
                end if;

            when C =>
                out_num <= "101";
                if (dir = '0') then
                    cur_st = D;
                else
                    cur_st = B;
                end if;

            when D =>
                out_num <= "111";
                if (dir = '0') then
                    cur_st = A;
                else
                    cur_st = C;
                end if;

            when others =>
                NULL;
        end case;

    else null;
    end if;

end process;
end Behavioral;
