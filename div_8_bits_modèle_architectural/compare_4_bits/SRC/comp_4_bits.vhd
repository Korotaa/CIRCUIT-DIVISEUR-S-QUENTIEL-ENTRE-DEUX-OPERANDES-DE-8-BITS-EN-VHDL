--*********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : comp_4_bits.vhd
--TP : Conception d'une serrure Electronique
--Block : Partie operative
--
--*************************************************************
--File : comp_4_bits.vhd
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

ENTITY comp_4_bits IS PORT(
A: IN std_logic_vector(3 DOWNTO 0);
B: IN std_logic_vector(3 DOWNTO 0);
sup: OUT std_logic;
ega: OUT std_logic);

END comp_4_bits;

--***********************************************************
-- RTL Description
--***********************************************************

ARCHITECTURE RTL OF comp_4_bits IS 
BEGIN
    sup<='1' WHEN A>B ELSE '0';
    ega<='1' WHEN A=B ELSE '0';
END RTL;