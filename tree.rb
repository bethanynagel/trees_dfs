class Node
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def add_child(value)
    n = Node.new(value)
    @children << n
    n
  end

  def dfs(value)
    # if the given value is the same as this node - return self
    if @value == value
      return self
    # Otherwise call dfs on each child and see if they found it
    # if the child found it, return the result,  # otherwise move on to the next child
    else
      if @children.any?
        @children.each do |child|
          x = child.dfs(value)
          return x if x
        end
    # If no child can find it, return nil  
      end
    return nil
  end
   
    
  end

  def bfs(value, queue = [])
    # if the given value is the same as this node return self
    if @value = value
      return self
    # Otherwise add all of this nodes children to the queue
    # of nodes needed to be searched
    else
      queue << @children
       # While the queue is not empty
      while queue.length > 0
        # grab the first element in the queue (and remove it)
        # run bfs on that node with the proper argument and get the result
        queue.shift.bfs(value, queue)
      end
    end
    
    # if that node found what you're looking for, return the resulting node
    # Otherwise, move on to the next node
    #
    # If the queue is empty and you haven't found it yet, return nil
  end
end
