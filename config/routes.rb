AoCallendar::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :events, except: :index
  resources :groups, only: [:index, :show, :new, :create] # TODO: implement index of groups with search bar
  resources :tasks, only: [:create] # TODO: implement destroy of tasks (after vote)
  resources :polls, only: [:new, :create, :update]
  post 'groups/:id/join', to: 'groups#join'
  post 'polls/vote_for', to: 'polls#vote_for'
  post 'polls/vote_against', to: 'polls#vote_against'
end
