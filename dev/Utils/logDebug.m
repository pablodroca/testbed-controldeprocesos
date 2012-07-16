function logDebug( mensaje )
global testbedContexto;
%archivo = strcat(testbedContexto.directorioInicio, '\log.txt');
%logFile = fopen(archivo, 'w+');
%if logFile > 0
%    fprintf(logFile, mensaje);
%    fclose(logFile);
%end
%fprintf(mensaje);