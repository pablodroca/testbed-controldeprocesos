function [sys,x0,str,ts]= RIAC(t,x,u,flag)
global dt T A Ts B C n conexion

switch flag
    case 0 % initialize
		
        tic
        dt=0;
        Ts=T;
        B=1;
        C=1;
        n=1;
        str=[] ;
        ts = [Ts 0] ;
        s = simsizes ;
        s.NumContStates = 0;
        s.NumDiscStates = n;
        s.NumOutputs = 1;
        s.NumInputs = 1;
        s.DirFeedthrough = 0 ;
        s.NumSampleTimes = 1 ;
        sys = simsizes(s) ;
        x0 = zeros(1,n) ;
    case 2 % discrete
        sys =[];
         tic
         dt=0;
         while dt<T
             dt=toc;
         end
         actuador = u;
         conexion = establecerValorActuador(conexion, u);
salida = 'not null';
    case 3 % output
		[conexion, nivel] = obtenerNivel(conexion);
        sys = nivel;
    case {4 9} % 2:discrete
        % 4:calcTimeHit
        % 9:termination
        sys =[];
    otherwise
        error(['unhandled flag =',num2str(flag)]) ;
end
