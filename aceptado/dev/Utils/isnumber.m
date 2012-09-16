function number = isnumber(strNum)
  number = false;
  num = str2num(strNum);
  if num == 0
      number = true;
  else
      [f c] = size(num);
      if not(f==1 && c==1)
          return
      end
      number=true;
  end
end