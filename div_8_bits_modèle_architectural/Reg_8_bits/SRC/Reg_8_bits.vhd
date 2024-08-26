--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : Reg_8_bits.vhd
--TP : Conception d'une serrure Electronique
--Block : M�moire
--
--*************************************************************
--File : Reg_4bits.vhd
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

ENTITY Reg_8_bits IS PORT(
D: IN std_logic_vector(7 DOWNTO 0);
enable: IN std_logic;
Q: OUT std_logic_vector(7 DOWNTO 0));
END Reg_8_bits;

--***********************************************************
-- RTL Description
--************************************************************

ARCHITECTURE RTL OF Reg_8_bits IS 
 BEGIN
     Q<=D WHEN enable='1' ELSE (OTHERS=>'0');
END RTL;