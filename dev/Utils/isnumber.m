function number = isnumber(strNum)
  number = false;
  num = str2num(strNum);
  [f c] = size(num);
  if not(f==1 && c==1)
    return
  end
  if (num<=0)
    return
  end
  number=true;
end