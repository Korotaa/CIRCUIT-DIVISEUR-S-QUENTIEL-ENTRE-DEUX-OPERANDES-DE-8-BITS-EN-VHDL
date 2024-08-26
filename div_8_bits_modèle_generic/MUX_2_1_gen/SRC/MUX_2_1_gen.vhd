--*********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : MUX_2_1_gen.vhd
--TP : Conception d'une serrure Electronique
--Block : Partie operative
--
--*************************************************************
--File : MUX_2_1_gen.vhd
--Authors : COULIBALY Korota Ars�ne
--Created : 15/04/2020
--
--*************************************************************
--Description : si sel=1=>s=a sinon s=B 
--*************************************************************
--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.all;
    
--************************************************************
-- ENTITY Declaration
--************************************************************

ENTITY MUX_2_1_gen IS 
GENERIC (N: INTEGER:=8);
PORT(
A: IN std_logic_vector(N-1 DOWNTO 0);
B: IN std_logic_vector(N-1 DOWNTO 0);
sel: IN std_logic;
S: OUT std_logic_vector(N-1 DOWNTO 0));
END MUX_2_1_gen;

--***********************************************************
-- RTL Description
--***********************************************************

ARCHITECTURE rtl OF MUX_2_1_gen IS 
BEGIN
    S<=A WHEN sel='1'ELSE
       B WHEN sel='0';
END rtl;