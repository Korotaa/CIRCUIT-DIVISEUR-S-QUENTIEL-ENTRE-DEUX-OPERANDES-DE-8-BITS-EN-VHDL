--**********************************************************
-- ENSA FES 
-- Filière : 1ère Année GSEII
--**********************************************************
--Title : top_div_8bits_fsm_tb.vhd
--TP : Conception d'une serrure Electronique
--Block : partie commande
--
--*************************************************************
--File : top_div_8bits_fsm_tb.vhd
--Authors : COULIBALY Korota Arsène
--Created : 15/04/2020
--
--*************************************************************
--Description :  
--
--*************************************************************
--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.all;
    USE IEEE.STD_LOGIC_UNSIGNED.all;
    
--************************************************************
-- ENTITY Declaration
--************************************************************

ENTITY top_div_8bits_fsm_tb IS
END top_div_8bits_fsm_tb;

--*************************************************************
--         rtl Description
--*************************************************************

ARCHITECTURE rtl OF top_div_8bits_fsm_tb IS 
COMPONENT top_div_8bits_fsm PORT(
    n1: IN std_logic_vector(7 DOWNTO 0);
    n2: IN std_logic_vector(7 DOWNTO 0);
    RST: IN std_logic;
    CLK: IN std_logic;
    start: IN std_logic;
    rdy: OUT std_logic;
    r: OUT std_logic_vector(7 DOWNTO 0));
 END COMPONENT;
 
 SIGNAL n1: std_logic_vector(7 DOWNTO 0);
 SIGNAL n2: std_logic_vector(7 DOWNTO 0);
 SIGNAL r: std_logic_vector(7 DOWNTO 0);
 SIGNAL RST: std_logic;
 SIGNAL CLK: std_logic;
 SIGNAL start:std_logic;
 SIGNAL rdy: std_logic;
 BEGIN
     top0: top_div_8bits_fsm PORT MAP(
     n1 => n1,
     n2 => n2,
     CLK => CLK,
     RST => RST,
     start => start,
     rdy => rdy,
     r => r);
     n1<="11110001";
     n2<="00011110";
      PROCESS
          BEGIN
            CLK<='1';
            WAIT FOR 15 ns;
            CLK<='0';
            WAIT FOR 15 ns;
    END PROCESS;
    PROCESS
        BEGIN
        RST<='0';
        WAIT FOR 30 ns;
        RST<='1';
        WAIT FOR 5 ns;
    END PROCESS;
    PROCESS
        BEGIN
            start<='1';
            WAIT FOR 20 ns;
            start<='0';
            WAIT FOR 15 ns;
    END PROCESS;
END rtl;
    