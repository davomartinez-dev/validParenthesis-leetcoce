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
    raise 'Stack is empty' unless @stack

    temp = @stack.get(0)
    @stack.remove(0)
    temp
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3
