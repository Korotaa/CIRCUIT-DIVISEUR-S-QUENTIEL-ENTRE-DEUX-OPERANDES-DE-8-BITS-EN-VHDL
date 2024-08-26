--**********************************************************
-- ENSA FES 
-- Filière : 1ère Année GSEII
--**********************************************************
--Title : po.vhd
--TP : Conception d'une serrure Electronique
--Block : Mémoire
--
--*************************************************************
--File : po.vhd
--Authors : COULIBALY Korota Arsène
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

ENTITY po IS PORT(
n1: IN std_logic_vector(7 DOWNTO 0);
n2: IN std_logic_vector(7 DOWNTO 0);
En_a: IN std_logic;
En_b: IN std_logic;
En_r: IN std_logic;
sel_a: IN std_logic;
sel_q: IN std_logic;
En_q: IN std_logic;
comp: OUT std_logic;
r: OUT std_logic_vector(7 DOWNTO 0));
END po;

--*************************************************************
--         rtl Description
--*************************************************************
ARCHITECTURE rtl OF po IS
    
 COMPONENT MUX_2_1 PORT(
      A: IN std_logic_vector(7 DOWNTO 0);
      B: IN std_logic_vector(7 DOWNTO 0);
      sel: IN std_logic;
      S: OUT std_logic_vector(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT Reg_8_bits PORT(
      D: IN std_logic_vector(7 DOWNTO 0);
      enable: IN std_logic;
      Q: OUT std_logic_vector(7 DOWNTO 0));
      END COMPONENT;
      
  COMPONENT comp_8_bits PORT(
        A: IN std_logic_vector(7 DOWNTO 0);
        B: IN std_logic_vector(7 DOWNTO 0);
        sup: OUT std_logic;
        ega: OUT std_logic);
  END COMPONENT;
 
  COMPONENT sub_8_bits PORT(
        A: IN std_logic_vector(7 DOWNTO 0);
        B: IN std_logic_vector(7 DOWNTO 0);
        cin: IN  std_logic;
        s: OUT std_logic_vector(7 DOWNTO 0);
        cout: OUT std_logic);
   END COMPONENT;
   
   COMPONENT inc PORT(
      q_in: IN std_logic_vector(7 DOWNTO 0);
      q_out: OUT std_logic_vector(7 DOWNTO 0));
   END COMPONENT;
   
   SIGNAL sig_0: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_1: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_2: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_3: std_logic_vector(7 DOWNTO 0):=(OTHERS =>'0');
   SIGNAL sig_4: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_5: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_6: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_7: std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_8: std_logic:='0';
   SIGNAL sig_9: std_logic;
   SIGNAL sig_10: std_logic;
   SIGNAL sig_11: std_logic;
BEGIN
 mux1: MUX_2_1 PORT MAP(
       A => n1,
       B  => sig_0,
       sel => sel_a,
       s  => sig_1);
       
mux2: MUX_2_1 PORT MAP(
       A => sig_2,
       B  => sig_3,
       sel => sel_q,
       s  => sig_4);
       
Reg_a: Reg_8_bits PORT MAP(
       D  => sig_1,
       enable  => En_a,
       Q  => sig_5);
Reg_b: Reg_8_bits PORT MAP(
       D  => n2,
       enable  => En_a,
       Q  => sig_6);
Reg_q: Reg_8_bits PORT MAP(
       D  => sig_4,
       enable  => En_q,
       Q  => sig_7);
Reg_r: Reg_8_bits PORT MAP(
       D  => sig_7,
       enable  => En_r,
       Q  => r);
Inc1: inc PORT MAP(
    q_in  => sig_7,
    q_out  => sig_2);
sub: sub_8_bits PORT MAP(
    A  => sig_5,
    B  => sig_6,
    cin  => sig_8,
    cout  => sig_9,
    s  => sig_0);
comp1: comp_8_bits PORT MAP(
    A  => sig_5,
    B  => sig_6,
    sup  => sig_10,
    ega  => sig_11);

comp<=sig_10 OR sig_11;
END rtl;