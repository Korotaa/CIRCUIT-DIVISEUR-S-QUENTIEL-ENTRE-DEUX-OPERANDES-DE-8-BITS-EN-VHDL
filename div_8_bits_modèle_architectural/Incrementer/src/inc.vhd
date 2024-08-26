--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : inc.vhd
--TP : Conception d'une serrure Electronique
--Block : M�moire
--
--*************************************************************
--File : inc.vhd
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

ENTITY inc IS PORT(
q_in: IN std_logic_vector(7 DOWNTO 0);
q_out: OUT std_logic_vector(7 DOWNTO 0));
END inc;

--***********************************************************
-- RTL Description
--************************************************************

ARCHITECTURE rtl OF inc IS
    SIGNAL sig: std_logic_vector(7 DOWNTO 0);
    BEGIN
       sig<= q_in + 1; 
       q_out<=sig;
END rtl;