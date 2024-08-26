--*********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : comp_gen.vhd
--TP : Conception d'une serrure Electronique
--Block : Partie operative
--
--*************************************************************
--File : comp_gen.vhd
--Authors : COULIBALY Korota Ars�ne
--Created : 15/04/2020
--
--*************************************************************
--Description : si A>B alors sup=1 sinon '0';
-- si A=B alors ega=1 sinon '0'
--si A<B alors inf=1 sinon '0';
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

ENTITY comp_gen IS 
GENERIC(N: INTEGER:=8);
PORT(
A: IN std_logic_vector(N-1 DOWNTO 0);
B: IN std_logic_vector(N-1 DOWNTO 0);
sup: OUT std_logic;
ega: OUT std_logic);
END comp_gen;

--***********************************************************
-- RTL Description
--***********************************************************

ARCHITECTURE RTL OF comp_gen IS 
COMPONENT comp_4bits PORT(
A: IN std_logic_vector(3 DOWNTO 0);
B: IN std_logic_vector(3 DOWNTO 0);
sup: OUT std_logic;
ega: OUT std_logic);
END COMPONENT;

SIGNAL sig_1: std_logic;
SIGNAL sig_2: std_logic;
SIGNAL sig_3: std_logic;
SIGNAL sig_4: std_logic;
SIGNAL sig_5: std_logic;

BEGIN
    compare1: comp_4bits PORT MAP(
             A =>A(7 DOWNTO 4),
             B =>B(7 DOWNTO 4),
             sup=>sig_1,
             ega=>sig_2);
    
    compare2: comp_4bits PORT MAP(
             A =>A(3 DOWNTO 0),
             B =>B(3 DOWNTO 0),
             sup=>sig_3,
             ega=>sig_4);
    
    sup<= sig_2 AND sig_4;
    sig_5<= sig_2 AND sig_3;
    ega<=sig_1 OR sig_5;
END RTL;