--**********************************************************
-- ENSA FES 
-- Fili�re : 1�re Ann�e GSEII
--**********************************************************
--Title : top_div_8bits_fsm.vhd
--TP : Conception d'une serrure Electronique
--Block : partie commande
--
--*************************************************************
--File : top_div_8bits_fsm.vhd
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

ENTITY top_div_8bits_fsm IS PORT(
n1: IN std_logic_vector(7 DOWNTO 0);
n2: IN std_logic_vector(7 DOWNTO 0);
RST: IN std_logic;
CLK: IN std_logic;
start: IN std_logic;
rdy: OUT std_logic;
r: OUT std_logic_vector(7 DOWNTO 0));
END top_div_8bits_fsm;

--*************************************************************
--         rtl Description
--*************************************************************

ARCHITECTURE rtl OF top_div_8bits_fsm IS 
 COMPONENT po PORT(
     n1: IN std_logic_vector(7 DOWNTO 0);
     n2: IN std_logic_vector(7 DOWNTO 0);
     En_a: IN std_logic;
     En_b: IN std_logic;
     sel_a: IN std_logic;
     En_r: IN std_logic;
     sel_q: IN std_logic;
     En_q: IN std_logic;
    comp: OUT std_logic;
    r: OUT std_logic_vector(7 DOWNTO 0));
END COMPONENT;
TYPE T_ETAT IS(s0, s1, s2, s3);
SIGNAL NEXT_STATE: T_ETAT;
SIGNAL C_STATE: T_ETAT;
SIGNAL En_a: std_logic;
SIGNAL En_b: std_logic;
SIGNAL sel_a: std_logic;
SIGNAL En_q: std_logic;
SIGNAL En_r: std_logic;
SIGNAL sel_q: std_logic;
SIGNAL comp: std_logic;

BEGIN
p0: po PORT MAP(
En_a => En_a,
En_b => En_b,
En_q => En_q,
En_r => En_r,
sel_a => sel_a,
sel_q => sel_q,
comp => comp,
n1 => n1,
n2 => n2,
r => r);
PROCESS(CLK,RST)
    BEGIN
     IF(RST='1') THEN
       C_STATE<=s0;
     ELSIF CLK'event AND CLK='1' THEN
     C_STATE<=NEXT_STATE;
 END IF;
 END PROCESS;
 PROCESS(n1,n2,start,C_STATE)
 BEGIN
 C_STATE<=s0;
 CASE C_STATE IS
 WHEN s0 =>
       rdy<='1';
       sel_a<='1';
       sel_q<='1';
       En_r<='1';
       En_a<='0';
       En_b<='0';
       En_q<='0';
       IF start='1' THEN
           NEXT_STATE<=s1;
        ELSE 
           NEXT_STATE<=s0;
       END IF;
    WHEN s1 =>
       rdy<='0';
       sel_a<='1';
       sel_q<='1';
       En_r<='0';
       En_a<='1';
       En_b<='1';
       En_q<='1';
       NEXT_STATE<=s2;
    WHEN s2 =>
       rdy<='0';
       sel_a<='0';
       sel_q<='0';
       En_r<='0';
       En_a<='1';
       En_b<='1';
       En_q<='1';
       IF comp='0' THEN
           NEXT_STATE<=s3;
        ELSE 
           NEXT_STATE<=s2;
       END IF;
    WHEN s3 =>
       rdy<='0';
       sel_a<='0';
       sel_q<='0';
       En_r<='0';
       En_a<='0';
       En_b<='0';
       En_q<='0';
       NEXT_STATE<=s0;
    WHEN OTHERS=>
       rdy<='1';
       sel_a<='1';
       sel_q<='1';
       En_r<='1';
       En_a<='0';
       En_b<='0';
       En_q<='0';
       NEXT_STATE<=s0;
END CASE;
END PROCESS;
END rtl;