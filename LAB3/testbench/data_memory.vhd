library IEEE;
use IEEE.std_logic_1164.all; 
use work.myTypes;

entity data_memory is
    generic (
        N_ADDRESS: integer := 10;
        N_DATA: integer := 32;
        MEMORY_SIZE: integer := 1024
    )
    port (
        RST      :    IN std_logic;
        CLK      :    IN std_logic;
        Address  :    IN std_logic_vector(N_ADDRESS-1 downto 0);
        Data_in  :    IN std_logic_vector(N_DATA-1 downto 0);
        Data_out :    OUT std_logic_vector(N_DATA-1 downto 0);
        WriteMem :    IN std_logic;
        ReadMem  :    IN std_logic
    );
end data_memory;


architecture Arch of data_memory is
    type mem_array is array (0 to 9) of std_logic_vector (N_ADDRESS - 1 downto 0); 
	signal memory : mem_array;  
begin
    
    process (CLK) is
    begin 
        if (CLK = '1') then 	
            if (RST = '1') then 
                memory <= (
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000",
                    "00000000000000000000000000000000"); 
            else
                if (ReadMem = '1') then 
                    memory(conv_integer(unsigned(Address(N_DATA - 1 downto 2)))) <= Data_in; 
                if (WriteMem = '1') then
                    Data_out <= memory(conv_integer(unsigned(Address(N_DATA - 1 downto 2))));
                end if;
            end if;
        end if; 
end process; 
    
    
end architecture Arch;