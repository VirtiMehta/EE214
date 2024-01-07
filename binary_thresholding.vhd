library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binary_thresholding is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        pixel_in : in STD_LOGIC_VECTOR(7 downto 0);
        threshold : in STD_LOGIC_VECTOR(7 downto 0);
        pixel_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end binary_thresholding;

architecture beh of binary_thresholding is
begin
    process(clk, rst)
    begin
        if rst = '1' then
            pixel_out <= "00000000";
        elsif rising_edge(clk) then
            if pixel_in > threshold then
                pixel_out <= "11111111"; -- Pixel intensity is above or equal to threshold
            else
                pixel_out <= "00000000"; -- Pixel intensity is below threshold
            end if;
        end if;
    end process;
end beh;

