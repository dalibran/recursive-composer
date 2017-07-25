# generates potential sentence options given the first word in a string
# when used in init_sentences, generates new options for every recursive cycle

def generate_paths(dict, string, paths = [])
  dict.each do |word|
    next if string.index(word).nil?
    paths.push(word) if string.index(word).zero?
  end
end
