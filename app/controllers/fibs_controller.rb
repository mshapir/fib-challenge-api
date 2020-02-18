class FibsController < ApplicationController

  def fib_sequence
    input = params[:user_input].to_i
    prime = params[:prime] == "true" ? true : false
    if prime
      result = Fib.fib_prime(input)
    else
      result = Fib.fib(input)
    end


    render json: {result: result}
  end

end
