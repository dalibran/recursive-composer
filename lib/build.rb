# builds sentence based on the specific cycle of the recursive function

def build(cycle, level, root, path, str)
  if cycle == 1 && level > 1
    str = root + ' ' + path + ' '
  elsif path == root
    str = root + ' '
  else
    str += path + ' '
  end
  str
end
