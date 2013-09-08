class String
  def indent(spaces)
    num = (" " * spaces)
    gsub(/^/, num)
  end
  def unindent 
    gsub(/^#{scan(/^\s*/).min_by{|l|l.length}}/, "")
  end
  def remove_all_whitespaces
    gsub(/\s+/, "")
  end
end