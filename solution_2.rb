def is_valid(s)
  stack = []
  opening_brackets = ['(', '[', '{']
  s.each_char do |char|
    if opening_brackets.include?(char)
      stack.push(char)
    else
      return false if stack.empty?

      top = stack.pop
      return false if (top == '[' && char != ']') || (top == '(' && char != ')') || (top == '{' && char != '}')
    end
  end
  stack.empty?
end

puts is_valid('()[]{}')   # true
puts is_valid('(]')       # false
puts is_valid('([)]')     # false
puts is_valid(']')        # false
