# recursive function that builds sentences based on options at each branch
# will continue to run until a full sentence has been built
# continues adding sentences until all options are exhausted

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

# ==========================================
#           Original Solution
# ==========================================

# generate_paths(dict, string, original_paths = [])
# new_results = []
# original_paths.each do |item|
#   final_str = item + " "
#   remaining_str = string.sub(/#{item}/, "")

#   generate_paths(dict, remaining_str, second_paths = [])

#   second_paths.each do |path|
#     final_str += path + " "
#     new_str = remaining_str.sub(/#{path}/, "")
#     results.push(final_str)
#     final_str = item + " "

#     generate_paths(dict, new_str, third_paths = [])

#     third_paths.each do |y|
#       final_str =  item + " " + path + " " + y
#       new_new_str = new_str.sub(/#{y}/, "")
#       if new_new_str.length == 0
#         new_results.push(final_str)
#       end
#       final_str = item + " "

#       generate_paths(dict, new_new_str, fourth_paths = [])

#       fourth_paths.each do |z|
#         final_str = item + " " + path + " " + y + " " + z
#         new_results.push(final_str)
#         final_str = item + " "
#       end
#     end
#     results.replace(new_results)
#   end
# end
