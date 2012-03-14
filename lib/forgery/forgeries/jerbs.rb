class Forgery::Jerbs < Forgery

  def self.technology
    dictionaries[:technologies].random.unextend
  end

  def self.nor_last_name
    dictionaries[:nor_last_names].random.unextend
  end

  def self.nor_first_name
    Forgery::Extend(dictionaries[:nor_male_first_names] + dictionaries[:nor_female_first_names]).random.unextend
  end

  def self.nor_full_name
    "#{self.nor_first_name} #{self.nor_last_name}"
  end

  def self.nor_male_first_name
    dictionaries[:nor_male_first_names].random.unextend
  end

  def self.nor_female_first_name
    dictionaries[:nor_female_first_names].random.unextend
  end
end

