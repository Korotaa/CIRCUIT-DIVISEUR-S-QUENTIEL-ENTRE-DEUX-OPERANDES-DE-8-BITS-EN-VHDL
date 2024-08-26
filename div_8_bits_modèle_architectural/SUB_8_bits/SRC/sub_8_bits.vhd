--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : sub_8_bits.vhd
--TP : Conception d'une serrure Electronique
--Block : M�moire
--
--*************************************************************
--File : sub_1bits.vhd
--Authors : COULIBALY Korota Ars�ne
--Created : 15/04/2020
--
--*************************************************************
--Description : on utilise 8 soustracteurs 1 bits interconnect�s
-- les uns aux autres 
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

ENTITY sub_8_bits IS PORT(
A: IN std_logic_vector(7 DOWNTO 0);
B: IN std_logic_vector(7 DOWNTO 0);
cin: IN  std_logic;
s: OUT std_logic_vector(7 DOWNTO 0);
cout: OUT std_logic);
END sub_8_bits;

--***********************************************************
-- RTL Description
--************************************************************
ARCHITECTURE rtl OF sub_8_bits IS 
COMPONENT sub_1_bit PORT(
    A: IN std_logic;
    B: IN std_logic;
    cin: IN  std_logic;
    s: OUT std_logic;
    cout: OUT std_logic);
END COMPONENT;

SIGNAL sig_1: std_logic;
SIGNAL sig_2: std_logic;
SIGNAL sig_3: std_logic;
SIGNAL sig_4: std_logic;
SIGNAL sig_5: std_logic;
SIGNAL sig_6: std_logic;
SIGNAL sig_7: std_logic;
BEGIN
    s0: sub_1_bit PORT MAP(
       A => A(0),
       B => B(0),
       cin => cin,
       cout => sig_1,
       s => s(0));
    s1: sub_1_bit PORT MAP(
       A => A(1),
       B => B(1),
       cin => sig_1,
       cout => sig_2,
       s => s(1));
    s2: sub_1_bit PORT MAP(
       A => A(2),
       B => B(2),
       cin => sig_2,
       cout => sig_3,
       s => s(2));
    s3: sub_1_bit PORT MAP(
       A => A(3),
       B => B(3),
       cin => sig_3,
       cout => sig_4,
       s => s(3));
    s4: sub_1_bit PORT MAP(
       A => A(4),
       B => B(4),
       cin => sig_4,
       cout => sig_5,
       s => s(4));
    s5: sub_1_bit PORT MAP(
       A => A(5),
       B => B(5),
       cin => sig_5,
       cout => sig_6,
       s => s(5));
    s6: sub_1_bit PORT MAP(
       A => A(6),
       B => B(6),
       cin => sig_6,
       cout => sig_7,
       s => s(6));
    s7: sub_1_bit PORT MAP(
       A => A(7),
       B => B(7),
       cin => sig_7,
       cout => cout,
       s => s(7));
END rtl;