require 'byebug'

# Start with your code from last challenge.
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def add(number)
    new_node = Node.new(number)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def add_at(index, number)
    new_node = Node.new(number)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      if index.zero?
        new_node.next_node = @head
        @head = new_node
      else
        previous = @head
        (index - 1).times do
          previous = previous.next_node
        end
        current = previous.next_node
        new_node.next_node = current
        previous.next_node = new_node
      end
    end
  end

  def remove(index)
    if @head.nil?
      puts 'List already empty'
    else
      if index.zero?
        @head = @head.next_node
      else
        previous = @head
        (index - 1).times do
          previous = previous.next_node
        end
        current = previous.next_node
        previous.next_node = current.next_node
      end
    end
  end

  def get(index)
    return nil unless @head

    current = @head
    index.times do
      current = current.next_node
    end
    current.value
  end
end

class Stack
  def initialize
    @stack = LinkedList.new
  end

  def push(number)
    @stack.add_at(0, number)
  end

  def pop
    return nil unless @stack

    temp = @stack.get(0)
    @stack.remove(0)
    temp
  end

  def get
    return nil unless @stack

    temp = @stack.get(0)
  end
end

def is_valid(str)
  # create a stack
  # loop over the strig
  # check if char is an open brack add it to stack
  # check if char is closing brack and match the type of the brack we should pop to stack
  # if the char is different ignore it

  # check if stack is empty if it is the string is balanced
  open_bra = '([{'
  stack = Stack.new
  str.each_char do |ele|
    if open_bra.include?(ele)
      stack.push(ele)
    else
      return false if stack.get.nil?

      res = stack.get
      if res === '(' && ele === ')'
        stack.pop
      elsif res === '[' && ele === ']'
        stack.pop
      elsif res === '{' && ele === '}'
        stack.pop
      else
        return false
      end
    end
  end

  return true if stack.get.nil?

  false
end

puts is_valid('()[]{}')   # true
puts is_valid('(]')       # false
puts is_valid('([)]')     # false
puts is_valid(']')        # false
