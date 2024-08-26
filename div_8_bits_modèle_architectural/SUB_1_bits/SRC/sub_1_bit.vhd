--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : sub_1_bit.vhd
--TP : Conception d'une serrure Electronique
--Block : M�moire
--
--*************************************************************
--File : sub_1bit.vhd
--Authors : COULIBALY Korota Ars�ne
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
    
--************************************************************
-- ENTITY Declaration
--************************************************************

ENTITY sub_1_bit IS PORT(
A: IN std_logic;
B: IN std_logic;
cin: IN  std_logic;
s: OUT std_logic;
cout: OUT std_logic);
END sub_1_bit;

--***********************************************************
-- RTL Description
--************************************************************
ARCHITECTURE rtl OF sub_1_bit IS 
BEGIN
    s<=A XOR B XOR cin;
    cout<=(NOT(B) AND A) OR (NOT(B) AND cin) OR (A AND cin);
END rtl;