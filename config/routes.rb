Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :fibs do
    get '/fib_result/:user_input/:prime', to: 'fibs#fib_sequence'
    root 'fibs#index'
  end
end
