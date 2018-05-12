class Key
  attr_reader  :key

  def initialize
    @key = key
  end
  def generate_key
    key = ""
    5.times do
      key << rand(0..9).to_s
    end
    return key
  end
end
