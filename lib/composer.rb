require_relative 'init_sentences'
require_relative 'validate'

def composer(string)
  sentences = init_sentences(string)
  validated = validate(sentences)
  validated.map!(&:strip!).sort!
end

print "'abcc' --> "
print composer('abcc')
print "\n"
print "'abcdefg --> "
print composer('abcdefg')
print "\n"
print "'abcdefg' --> "
print composer('abcdef')
print "\n"
print "'abcdefq' --> "
print composer('abcdefq')
