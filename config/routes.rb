Battleships::Application.routes.draw do

  resources :games, :path => 'g' do
    resources :players, :path => 'p' do
      resources :ships, :path => 's'
      resources :messages, :path => 'm'
    end
  end
  
end
