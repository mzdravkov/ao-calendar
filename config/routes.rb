AoCallendar::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :events

  resources :group_calendars, except: :index
end
