#Exercise 3.6: Animal Shelter
My solution reuses the Queue class written earlier. Instead of passing a literal as the value, 
I pass a hash object. This hash object has keys type and order {:type => , :order => }. They key type 
stores whether the animal is a dog or a cat. The key order maintains the insertion order

require './queue'
class AnimalShelter
  def initialize(dq, cq)
    @dog_queue = dq || Queue.new
    @cat_queue = cq || Queue.new
    @order = 0
  end

  def adopt(type="")
    if type == "dog"
      dequeueDog
    elsif type == "cat"
      dequeueCat
    else
      dequeueAny
    end
  end

  def enqueue(options={})
    queue_to_use = options[:type] == "dog" ? @dog_queue : @cat_queue
    options[:order] = @order
    @order += 1
    queue_to_use.add(options)
  end

  def dequeueDog
    a = @dog_queue.pop
    return nil if a.nil?
    return a.value
  end

  def dequeueCat
    a = @cat_queue.pop
    return nil if a.nil?
    return a.value
  end

  def dequeueAny
    dog = @dog_queue.peek
    cat = @cat_queue.peek
    if (dog && cat)
      oldest = dog.value[:order] < cat.value[:order] ? dog.value : cat.value
    elsif dog
      oldest = dog
    elsif cat
      oldest = cat
    else
      oldest = "No animals in shelter"
    end
    return oldest
  end

end

dogs = Queue.new
dogs.add({:name => "Fluffy", :type => "dog"})

as = AnimalShelter.new()
as.enqueue({:name => "Fluffy", :type => "dog"})
as.enqueue({:name => "Pommy", :type => "dog"})
as.enqueue({:name => "Jaggi", :type => "dog"})
as.enqueue({:name => "Chocky", :type => "dog"})

as.enqueue({:name => "C1", :type => "cat"})
as.enqueue({:name => "C2", :type => "cat"})
as.enqueue({:name => "C3", :type => "cat"})
as.enqueue({:name => "C4", :type => "cat"})
as.enqueue({:name => "C5", :type => "cat"})

