require 'prime'

# the Fib class allows us to package together all of the logic required to retrieve the desired sequence, offering the option of using baseline recursion or recursion with a dynamic programming approach (where we save/update the results of prior runs in a map and use these results to save computation efforts in other iterations). Dynamic programming is an effort to optimize sequence retrieval, since we see that recursion can become extremely inefficient for larger inputs. This is where we may want to use the iterative method.
# all methods can be consolidated into a single method with flags (for example, one fib method that uses a prime flag) but it was separated out for simplicity and readability.
# todo: store our val_map in a database and load it into Fib class when it is initialized in order to take advantage of saving the results of prior runs.

class Fib

  @val_map = Hash.new

  # wrapper method to return list of prime values in the sequence with length n
  def self.fib_prime(n)
    sequence = Array.new
    i = 1
    while sequence.length() < n
      next_element = fib_recursive_dynamic(i)
      if Prime.prime?(next_element) == true || next_element == 1
        puts sequence.length()
        sequence.push(next_element)
      end
        i = i + 1
      end
        return sequence
  end

  #  wrapper method to return list of values in the sequence with length n
  def self.fib(n)
    sequence = Array.new
    for i in (1..n) do
      sequence.push(fib_recursive(i))
    end
    return sequence
  end

  # recursively get nth value in the sequence
  def self.fib_recursive(n)
    if n <= 2
      return 1
    else
      return fib_recursive(n - 1) + fib_recursive(n - 2)
    end
  end

  # a dynamic programming approach that uses a hash to map nth value to its value in the sequence (if it was previously calculated) to avoid recalculating when the same work was done prior
  def self.fib_recursive_dynamic(n)
    if n <= 2
      return 1
    end

    # check to see if we have gotten both values prior, in which case we can just get them from the map of values
    if @val_map[n - 1] == nil || @val_map[n - 2] == nil
      update_val_map(n)
    end

    return @val_map[n - 1] + @val_map[n - 2]
  end

  # helper method to update value map of prior iterations
  def self.update_val_map(n)
    @val_map[n - 1] = @val_map[n - 1] || fib_recursive_dynamic(n - 1)
    @val_map[n - 2] = @val_map[n - 2] || fib_recursive_dynamic(n - 2)
  end

  # obtain the sequence iteratively
  def self.fib_iterative(n)
    sequence = Array.new

    if n == 0
      return sequence
    elsif n == 1
      sequence.push(1)
      return sequence
    end

    val1 = 0
    val2 = 1

    for i in (0..n)
      next_element = val1.to_i + val2.to_i
      sequence.push(next_element)
      val1 = val2
      val2 = next_element
    end

    return sequence
  end
end
