# validate_words() counts type of each word or nonword
# validate_structure() returns a boolean if sentence is valid
# validate() returns an array of validated results

WORDS = /^abcd$|^cde$|^c$|^def$|$h^|$ij^|^bc$|^fg$|^g$|^hij$|^bcd$|^a$|^ac$|^e$/

def validate(results)
  results.select { |result| validate_words(result) }
end

def validate_words(result)
  nouns = articles = verbs = nonwords = 0
  result.split(' ').each do |word|
    word.strip
    nonwords += 1 if nonword(word)
    nouns += 1 if word =~ /^abcd$|^cde$|^c$|^def$|$h^|$ij^/
    verbs += 1 if word =~ /^bc$|^fg$|^g$|^hij$|^bcd$/
    articles += 1 if word =~ /^a$|^ac$|^e$/
  end
  validate_sentence(nonwords, verbs, nouns, articles)
end

def validate_sentence(nonwords, verbs, nouns, articles)
  verbs > 0 && (nouns > 0 || articles > 1) && nonwords.zero?
end

def nonword(word)
  (word =~ WORDS).nil? || word =~ /[^a-j]/
end
