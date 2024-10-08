--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : inc_gen.vhd
--TP : Conception d'une serrure Electronique
--Block : Partie operative
--
--*************************************************************
--File : inc_gen.vhd
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
    USE IEEE.STD_LOGIC_UNSIGNED.all;
    
--************************************************************
-- ENTITY Declaration
--************************************************************

ENTITY inc_gen IS 
GENERIC (N: INTEGER:=8);
PORT(
q_in: IN std_logic_vector(N-1 DOWNTO 0);
q_out: OUT std_logic_vector(N-1 DOWNTO 0));
END inc_gen;

--***********************************************************
-- RTL Description
--************************************************************

ARCHITECTURE rtl OF inc_gen IS
    SIGNAL sig: std_logic_vector(7 DOWNTO 0);
    BEGIN
       sig<= q_in + 1; 
       q_out<=sig;
END rtl;