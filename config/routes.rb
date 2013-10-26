AoCallendar::Application.routes.draw do
  get "task/index"
  get "task/new"
  get "task/create"
  get "task/edit"
  get "task/update"
  get "task/delete"
  get "task/destroy"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :events

  resources :group_calendars, except: :index
end
