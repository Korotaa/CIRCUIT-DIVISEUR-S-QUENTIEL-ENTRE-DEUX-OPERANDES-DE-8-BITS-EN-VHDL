--**********************************************************--
-- ENSA FES 
-- Filière : 1 ère Année GSEII
--**********************************************************--
--Title : div_8_bits_rtl.vhd
--TP : Conception d'un circuit diviseur séquentiel.
--Block : spécification
--*************************************************************--
--File : vhdl
--Authors : COULIBALY Korota Arsène
--Created : 9/04/2020
--*************************************************************--
--Description : il s'agit de faire une description rtl
--du diviseur.On utilisera pas de process.
--*************************************************************--

--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.all;
    USE IEEE.STD_LOGIC_UNSIGNED.all;
    USE IEEE. STD_LOGIC_ARITH.all;
    
--************************************************************--
-- ENTITY Declaration
--************************************************************
ENTITY div_8_bits_rtl IS PORT(
n1: IN std_logic_vector(7 DOWNTO 0);
n2: IN std_logic_vector(7 DOWNTO 0);
start: IN std_logic;
rdy: OUT std_logic;
CLK: IN std_logic;
RST: IN std_logic;
R: OUT std_logic_vector(15 DOWNTO 0));
END div_8_bits_rtl;

--************************************************************
-- RTL Description
--************************************************************

ARCHITECTURE rtl OF div_8_bits_rtl IS
SIGNAL a: std_logic_vector(7 DOWNTO 0);
SIGNAL b: std_logic_vector(7 DOWNTO 0);
SIGNAL q: std_logic_vector(7 DOWNTO 0):=(OTHERS=>'0');
BEGIN
rdy<='1';
PROCESS(start,n1,n2)
BEGIN
IF(start='1') THEN
    a<=n1;
    b<=n2;
    WHILE((a-b)>=0) LOOP
     a<=(a-b);
     q<=q+1;
    END LOOP;
END IF;
END PROCESS;
rdy<='0';
R<=q;
END rtl;