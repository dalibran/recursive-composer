<img src="https://orig06.deviantart.net/9941/f/2013/261/a/f/ruby_minimal_logo_by_oscarito201094-d6mvh10.png" alt="ruby" width="64px" height="64px"> <img src="http://rspec.info/images/logo.png" alt="rspec" width="64px" height="64px"> <img src="https://cdn.worldvectorlogo.com/logos/rubocop.svg" alt="rubocop" width="64px" height="64px">

<h1>Recursive Composer</h1>

This is my solution to a recent coding challenge I completed. I developed a solution primarily based on recursion, where I created an algorithm that builds valid sentences based on all branching possibilities. This algorithm was built using Ruby and I wrote tests using Rspec.

<h3>The Problem</h3>

I was tasked with developing a function that took a string as input and returned an array containing all of the possible sentence combinations given the letters in the string. The caveat being that this language has a unique dictionary and grammar, which are detailed below:

Dictionary:
- Nouns: "abcd", "c", "def", "h", "ij", "cde"
- Verbs: "bc", "fg", "g", "hij", "bcd"
- Articles: "a", "ac", "e"

Grammar:
- all of a sentence's words must be present in the dictionary.
- a sentence must have a verb.
- a sentence must have a noun or have at least two articles.

Given the string "abcdefg", the algorithm should return:

`["a bc def g", "a bcd e fg", "abcd e fg"]`

<h3>The Solution</h3>

My solution is broken down into several smaller functions, but the core is in `init_sentences()`

```ruby
require_relative 'generate_paths'
require_relative 'build'

DICT = %w[abcd cde c def h ij bc fg g hij bcd a ac e].freeze

def init_sentences(input, cycle = 0, level = 0, results = [], **args)
  level += 1
  results.push(args[:str]) if input.empty?
  generate_paths(DICT, input, paths = [])
  paths.each do |path|
    break if path.empty?
    cycle += 1
    args[:root] = path if level == 1
    chars = input.sub(/#{path}/, '')
    str = build(args[:cycle], level, args[:root], path, args[:str])
    init_sentences(chars, cycle, level, results, str: str, root: args[:root])
    cycle = 0
  end
  results
end
```

In this function, I generate a set of potential paths based on the first characters in my input string. There could be more than one branch/path at any given point when building a sentence, so I make sure to save those branches in my `paths` array. This way I can iterate through each path until all options are exhausted, regardless of where I am in constructing a sentence.

Once I start building my sentence via `str`, I remove my used characters from the input string and call `init_sentences` again to generate new paths now that my input string is slightly smaller. The algorithm recursively builds a sentence until the input string is empty, and the completed sentence is then pushed to a `results` array.

I use `level` and `cycle` to keep track of how deep I'm traveling down a specific branch, so I know which characters to build a new sentence around. Lastly, I implemented a guard clause `break if path.empty?` to stop the algorithm once all paths are exhausted.


<h3>Development</h3>

If you'd like to play around with the algorithm...

1. Clone the repo on your local machine

```zsh
git clone git@github.com:dalibran/recursive-composer.git
```

2. Navigate to the project directory and install relevant gems

```zsh
bundle install
```

3. Run the program by typing the following into your terminal. If you'd like to test other inputs, make edits to the `composer` function.

```zsh
ruby lib/composer.rb
```

4. Run tests with rake
```zsh
rake
```
