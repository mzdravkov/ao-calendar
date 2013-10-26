AoCallendar::Application.routes.draw do
  resources :events
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
<<<<<<< HEAD
=======
  resources :group_calendars, except: :index
>>>>>>> d984998599f9ca95b2f5c75d3a027310c4ab6f7c
end
