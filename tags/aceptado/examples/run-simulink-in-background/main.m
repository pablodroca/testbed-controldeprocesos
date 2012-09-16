timer1 = timer('TimerFcn', 'runSystem', 'StartDelay',1);

timer2 = timer('TimerFcn', 'stopSystem', 'StartDelay',5);
start(timer2);
start(timer1);

fprintf('Timers already fired...\n');

%both timers should be deleted after they are used.... this example does not include that operation
%delete(timer1);
%delete(timer2);