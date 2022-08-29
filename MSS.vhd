--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity MSS is
	port(
		Resetn,clk,Start,Ascendente,Descendente,M_Burbuja,M_Insercion,Fin_Rec,Tope0,Tope1,CambioAB,Mostrar_Ordenado,
		PasoCambio,S1,CambioBB,Tope2,Terminar: in std_logic;
		est: out std_logic_vector(4 downto 0);
		WR,Sel_Add0,Sel_Add1,En_Cont_P1,Ld_Cont_P1,En_Cont_P2,Ld_Cont_P2,En_Cont_Rec,Ld_Cont_Rec,En_Cont_Mos,Ld_Cont_Mos,
		En_Reg_T1,En_Reg_T2,F_Orden,En_Reg_Orden,Fin_Ordenamiento,Fin_Mostrar,Sel_Data0,Sel_Data1,Intercambio,En_Reg_Mos,
		Activar_Muestreo,En_Reg_MuestreoB,En_Reg_Metodo,F_Metodo,Select_Metodo,Select_Orden: out std_logic);
end MSS;

--Architecture
architecture solve of MSS is
	-- Signals,Constants,Variables,Components
	type estado is (A,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Z,ZA,ZD,ZE,ZF,ZG,ZH,ZI,ZJ,ZK,ZL,ZM,ZN,ZO,ZP,ZQ,ZR,ZS,
	ZT,ZU,ZV,ZW,ZX,ZY);
	signal y: estado;
	begin
	--Process #1: Next state decoder and state memory
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn = '0' then y<= A;
			elsif (clk'event and clk = '1') then
				case y is		  
					when A => 
							  if start='1' then y <= C;
							  else y <= A; end if;	
					when C => 
							  if Ascendente='1' and Descendente='0' then y<=E;
							  elsif Descendente='1' and Ascendente='0' then y<=D;
							  else y<=C; end if;
					when ZG => 
							  y <= F;
					when D => 
							  y <= ZG;
					when E => 
							  Y <= ZG;
					when F => 
							  if M_Burbuja='1' then y <= G;
							  elsif M_Insercion='1' then y<=H;
							  else y <= F; end if;
					when G => 
							  y <= I;
					when H => 
							  y <= ZH;
					when I => 
							  y <= J;
				   when J => 
							  y <= K;		  
					when K => 
							  if PasoCambio='1' then y <= L;
							  else y <= ZE; end if;
					when L => 
							  y <= M;	
					when M => 
							  if CambioAB='1' then y <= N;
							  else y <= R; end if;
					when ZE => 
							  y <= ZF;	
					when ZF => 
							  if CambioBB='1' then y <= N;
							  else y <= R; end if;		  	  
				   when N => 
							  y <= O;
			      when O => 
							  y <= P;
					when P => 
							  y <= Q;
					when Q => 
							  y <= ZD;
					when ZD => 
							  y <= R;
					when R => 
							  if Tope0='1' then y <= T;
							  else y <= S; end if;
					when S => 
							  y <= K;
					when T => 
							  if Fin_Rec='1' then y <= U;
							  else y <= J; end if;
					when U => 
							  if Mostrar_Ordenado='1' then y <= V;
							  else y <= U; end if;
					when V => 
							  y <= W;
					when W => 
							  if S1='1' then y <= X;
							  else y <= ZA; end if;
					when X => 
							  if Tope1='1' then y <= Z;
							  else y <= V; end if;
					when ZA=> 
							  y <= W;
					when Z=> 
							  if Terminar='1' then y <= A;
							  else y <= Z; end if;
					when ZH=> 
							  y <= ZI;
					when ZI=> 
							  y <= ZJ;
					when ZJ=> 
							  if PasoCambio='1' then y <= ZK;
							  else y <= ZM; end if;
					when ZK=> 
							  y <= ZL;
					when ZM=>
							  y <= ZN; 
					when ZN=> 
							  if CambioBB='1' then y <= ZO;
							  else y <= ZT; end if;
					when ZL=> 
							  if CambioAB='1' then y <= ZO;
							  else y <= ZT; end if;
					when ZO => 
							  y <= ZP;
			      when ZP => 
							  y <=ZQ;
					when ZQ => 
							  y <= ZR;
					when ZR => 
							  y <= ZS;
					when ZS => 
							  y <= ZT; 
					when ZT => 
							  if Tope1='1' then y <= ZW;
							  else y <= ZU; end if;
					when ZU => 
							  y <= ZV;
					when ZV => 
							  y <= ZJ; 		  
					when ZW => 
							  if Tope2='1' then y <= U;
							  else y <= ZX; end if;
					when ZX => 
							  y <= ZY;
					when ZY => 
							  y <= ZI; 	
				end case;
			end if;
	end process;
	--Process #2: Output decoder
	process(y)-- mealy ->(y,d,n)
	--Sequential programming
		begin
		WR<='0';
		Sel_Add0<='0';
		Sel_Add1<='0';
		En_Cont_P1<='0';
		Ld_Cont_P1<='0';
		En_Cont_P2<='0';
		Ld_Cont_P2<='0';
		En_Cont_Rec<='0';
		Ld_Cont_Rec<='0';
		En_Reg_T1<='0';
		En_Reg_T2<='0';
		F_Orden<='0';
		En_Reg_Orden<='0';
		Fin_Ordenamiento<='0';
		Fin_Mostrar<='0';
		Intercambio<='0';
		Sel_Data0<='0';
		Sel_Data1<='0';
		En_Cont_Mos<='0';
		Ld_Cont_Mos<='0';
		En_Reg_Mos<='0';
		Activar_Muestreo<='0';
		En_Reg_MuestreoB<='0';
		En_Reg_Metodo<='0';
		F_Metodo<='0';
		Select_Metodo<='0';
		Select_Orden<='0';
			case y is
				when A => est<="00000";
				when C => est<="00010";Select_Orden<='1';
				when D => est<="00011";
				when E => est<="00100";F_Orden<='1';En_Reg_Orden<='1';
				when F => est<="00101";Select_Metodo<='1';
				when G => est<="00110";Activar_Muestreo<='1';En_Reg_MuestreoB<='1';F_Metodo<='1';En_Reg_Metodo<='1';
				when H => est<="00111";Activar_Muestreo<='1';En_Reg_MuestreoB<='1';
				when I => est<="01000";Ld_Cont_Rec<='1';En_Cont_Rec<='1';F_Metodo<='1';En_Reg_Metodo<='1';
				when J => est<="01001";Ld_Cont_P1<='1';Ld_Cont_P2<='1';En_Cont_P1<='1';En_Cont_P2<='1';
				when K => est<="01010";
				when L => est<="01011";En_Reg_T2<='1';En_Reg_T1<='1';
				when M => est<="01100";
				when N => est<="01101";Intercambio<='1';Sel_Add0<='1';WR<='1';--
				when O => est<="01110";Intercambio<='1';Sel_Add0<='1';WR<='1';
				when P => est<="01111";Intercambio<='1';Sel_Data0<='1';WR<='1';--
				when Q => est<="10000";Intercambio<='1';Sel_Data0<='1';WR<='1';
				when R => est<="10001";En_Cont_P1<='1';En_Cont_P2<='1';
				when S => est<="10010";
				when T => est<="10011";En_Cont_Rec<='1';
				when U => est<="10100";Fin_Ordenamiento<='1';Ld_Cont_P1<='1';En_Cont_P1<='1';En_Reg_MuestreoB<='1';
				when V => est<="10101";
				when W => est<="10110";En_Reg_Mos<='1';
				when X => est<="10111";En_Cont_Mos<='1';Ld_Cont_Mos<='1';En_Cont_P1<='1';
				when ZD => est<="11001";
				when Z => est<="11010";Fin_Mostrar<='1';
				when ZA => est<="11011";En_Cont_Mos<='1';
				when ZE => est<="11100";En_Reg_T2<='1';En_Reg_T1<='1';
				when ZF => est<="11101";
				when ZG => est<="11110";
				when ZH => est<="11111";Ld_Cont_P2<='1';En_Cont_P2<='1';
				when ZI => est<="00000";Ld_Cont_P1<='1';En_Cont_P1<='1';
				when ZJ => est<="00001";
				when ZK => est<="00010";En_Reg_T2<='1';En_Reg_T1<='1';
				when ZL => est<="00011";
				when ZM => est<="00100";En_Reg_T2<='1';En_Reg_T1<='1';
				when ZN => est<="00101";
				when ZO => est<="00110";Intercambio<='1';Sel_Add0<='1';WR<='1';--
				when ZP => est<="00111";Intercambio<='1';Sel_Add0<='1';WR<='1';
				when ZQ => est<="01000";Intercambio<='1';Sel_Data0<='1';WR<='1';
				when ZR => est<="01001";Intercambio<='1';Sel_Data0<='1';WR<='1';
				when ZS => est<="01010";
				when ZT => est<="01011";
				when ZU => est<="01100";En_Cont_P1<='1';
				when ZV => est<="01101";
				when ZW => est<="01110";
				when ZX => est<="01111";En_Cont_P2<='1';
				when ZY => est<="10000";
			end case;
	end process;
	--Process #n... 
end solve;