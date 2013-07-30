class String
  def indent(spaces)
    num = (" " * spaces)
    gsub(/^/, num)
  end
  def remove_all_whitespaces
    gsub(/\s+/, "")
  end
end