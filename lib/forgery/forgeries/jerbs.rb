class Forgery::Jerbs < Forgery

  def self.technology
    dictionaries[:technologies].random.unextend
  end

  def self.nor_cities
    dictionaries[:nor_cities].random.unextend
  end

end

