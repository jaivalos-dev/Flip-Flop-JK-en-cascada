
-- Compuertas utilizadas 

-- Compuerta AND   

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CompAND2 is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end CompAND2;

architecture CompAND2 of CompAND2 is
begin
    Y <= A and B;
end CompAND2;

--------------------------------------------------------------------------

-- Compuerta OR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CompOR2 is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end CompOR2;

architecture CompOR2 of CompOR2 is
begin
    Y <= A or B;
end CompOR2;	  

--------------------------------------------------------------------------

-- Compuerta NOT
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CompNOT1 is
    Port (
        A : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end CompNOT1;

architecture CompNOT1 of CompNOT1 is
begin
    Y <= not A;
end CompNOT1;
