function number = isinteger(strNum)
  number = isNumber(strNum);
  if not(number)
      return
  end
  [f c] = size(strfind(strNum,'.'));
  if not(f==0 && c==0)
    number=false;
  end
  return
end
