function [sys,x0,str,ts]= discreto_sfcn(t,x,u,flag)
global dt T placa A Ts B C n 

switch flag
    case 0 % initialize
        placa = actxserver('RiacQXControl.RiacQX');
        placa.ComBaudRate=57600;
        placa.ComPort=3;
        placa.ComOpen=1;
        tic
        dt=0;
        
        Ts=T;
        %        A=1;
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
        %case 1 % derivatives
        %sys=A*x+B*u;
    case 2 % discrete
        %        sys=A*x+B*u;
        sys =[];
         tic
         dt=0;
         while dt<T
             dt=toc;
         end
         AnalogicOutput(placa, 1, u);
         %    tic;
         %    dt;
         %end
        %t(i)=toc;

    case 3 % output
        %        sys = C*x+randn;
        sys = AnalogicInput(placa, 1)/1000*3;
        if sys>200
            sys=200;
        end
    case {4 9} % 2:discrete
        % 4:calcTimeHit
        % 9:termination
        sys =[];
    otherwise
        error(['unhandled flag =',num2str(flag)]) ;
end
