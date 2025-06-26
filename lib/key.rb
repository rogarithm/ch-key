class Key
  attr_reader :nm, :step, :sig

  def initialize(nm, step, sig = :natural)
    @nm, @step, @sig = nm, step, sig
  end
end
