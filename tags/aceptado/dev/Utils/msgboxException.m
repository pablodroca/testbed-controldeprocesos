function msgboxException( msg, title, exception )
indexNewLine = strfind(exception, char(10));
if indexNewLine
    exceptionMsg = exception(indexNewLine+1:end);
else
    exceptionMsg = exception;
end

msgbox(sprintf('%s\n%s', msg, exceptionMsg), title, 'error');