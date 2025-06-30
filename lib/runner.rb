require_relative "./key_changer"

class Runner
  attr_reader :key_changer

  def initialize
    @key_changer = KeyChanger.new
  end

  def run(txt_sheet, from, to)
    result=[]
    txt_sheet.split("\n").each do |l|
      result << l and next if lyrics? l
      result << key_changer.transpose(l, from, to)
    end
    result.join("\n")
  end

  def lyrics? l
    parsed = l.scan(/([A-G][#b]?[^\s]*)(\s*)/)
    parsed.size == 0
  end
end
