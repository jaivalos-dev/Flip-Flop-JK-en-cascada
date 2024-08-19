
-- Creación del Flip Flop

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlopJK is
    Port (
        J : in STD_LOGIC;
        K : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end FlipFlopJK;

architecture FlipFlopJK of FlipFlopJK is
    signal J_and_clk, K_and_clk, Q_internal, Qn_internal : STD_LOGIC;

    -- Obtenemos los componentes de las compuertas lógicas
    component compand2
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component compor2
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component compnot1
        Port (
            A : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin
    -- Compuerta AND para J y clk
    AND1: compand2 Port map (
        A => J,
        B => clk,
        Y => J_and_clk
    );

    -- Compuerta AND para K y clk
    AND2: compand2 Port map (
        A => K,
        B => clk,
        Y => K_and_clk
    );

    -- Compuerta NOT para Q interno (Qn_internal)
    NOT1: compnot1 Port map (
        A => Q_internal,
        Y => Qn_internal
    );

    -- Implementación del Flip-Flop JK usando las compuertas definidas
    process (reset, J_and_clk, K_and_clk)
    begin
        if reset = '1' then
            Q_internal <= '0';
        elsif J_and_clk = '1' and K_and_clk = '0' then
            Q_internal <= '1';
        elsif J_and_clk = '0' and K_and_clk = '1' then
            Q_internal <= '0';
        elsif J_and_clk = '1' and K_and_clk = '1' then
            Q_internal <= Qn_internal;
        end if;
    end process;

    Q <= Q_internal;

end FlipFlopJK;
