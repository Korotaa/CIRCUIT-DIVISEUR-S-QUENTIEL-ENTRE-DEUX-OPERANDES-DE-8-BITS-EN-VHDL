--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : Reg_gen.vhd
--TP : Conception d'une serrure Electronique
--Block : M�moire
--
--*************************************************************
--File : Reg_gen.vhd
--Authors : COULIBALY Korota Ars�ne
--Created : 15/04/2020
--
--*************************************************************
--Description : si Enable=1 la sortie q recopie l'entr�e D sinon 
--Q=0.
--*************************************************************
--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.all;
    
--************************************************************
-- ENTITY Declaration
--************************************************************

ENTITY Reg_gen IS 
GENERIC (N: INTEGER:=8);
PORT(
D: IN std_logic_vector(N-1 DOWNTO 0);
enable: IN std_logic;
Q: OUT std_logic_vector(N-1 DOWNTO 0));
END Reg_gen;

--***********************************************************
-- RTL Description
--************************************************************

ARCHITECTURE RTL OF Reg_gen IS 
 BEGIN
     Q<=D WHEN enable='1' ELSE (OTHERS=>'0');
END RTL;