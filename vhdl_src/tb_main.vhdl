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

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is

    component blind_cycler
    port (
        dir     : in std_logic;
        nxt     : in std_logic;
        out_num : out std_logic_vector (2 downto 0)
    );
    end component;

    -- inputs
    signal nxt      : std_logic := '0';
    signal dir      : std_logic := '0';

    --output
    signal out_num  : std_logic_vector (2 downto 0) := (others => '0');

    -- period of the nxt signal
    constant nxt_prd : time := 1 us;

begin

    -- instantiate the cycler block
    uut: blind_cycler port map (
        dir     => dir,
        nxt     => nxt,
        out_num => out_num
    );

    -- nxt signal process
    nxt_process: process
    begin
        nxt <= '0';
        wait for nxt_prd/2;
        nxt <= '1';
        wait for nxt_prd/2;
    end process;

    -- invert direction of sequence after 8 nxt periods, during the low level
    dir_process: process
    begin
        dir <= '0';
        wait for nxt_prd/2 + 8*nxt_prd + 3*nxt_prd/4;
        dir <= '1';
        wait;
    end process;

end Behavioral;
