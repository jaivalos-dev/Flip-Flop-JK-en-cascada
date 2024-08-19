
-- Tarea 5, 3 flip flop en cascada

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tarea5 is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        QC : out STD_LOGIC
    );
end tarea5;

architecture tarea5 of tarea5 is

    -- Señales internas para conectar los flip-flops
    signal QA, QB : STD_LOGIC;

    -- Declarar el componente del flip-flop JK
    component flipflopjk
        Port (
            J : in STD_LOGIC;
            K : in STD_LOGIC;
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

begin
    -- Instancia del Flip-Flop A
    FF_A: flipflopjk Port map (
        J => '1',
        K => '1',
        clk => clk,   -- El Flip-Flop A usa el reloj principal
        reset => reset,
        Q => QA
    );

    -- Instancia del Flip-Flop B
    FF_B: flipflopjk Port map (
        J => '1',
        K => '1',
        clk => QA,    -- El Flip-Flop B usa QA como su reloj
        reset => reset,
        Q => QB
    );

    -- Instancia del Flip-Flop C
    FF_C: flipflopjk Port map (
        J => '1',
        K => '1',
        clk => QB,    -- El Flip-Flop C usa QB como su reloj
        reset => reset,
        Q => QC       -- La salida QC es la salida del Flip-Flop C
    );

end tarea5;
