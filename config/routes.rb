Battleships::Application.routes.draw do

  resources :games, :path => 'g', :except => :destroy
  resources :players, :path => 'p', :except => [:index,:destroy] do
    resources :ships, :path => 's'
    resources :messages, :path => 'm'
  end
  match '/login' => 'application#login'
  
end
