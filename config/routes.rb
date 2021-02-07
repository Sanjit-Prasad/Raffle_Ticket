Rails.application.routes.draw do
  devise_for :users
  namespace 'api' do
    namespace 'v1' do
      resources :rewards
      resources :tickets
      resources :users do
        collection do
          get 'generate_raffle_ticket/:id', :to => "users#generate_raffle_ticket"
        end
      end
      resources :winners do
        collection do
          get 'search_last_week_winners', :to => "winners#search_last_week_winners"
          get 'find_winner', :to => "winners#find_winner"
        end
      end
    end
  end
end