Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root                  'static_pages#home'
  get     'home'    =>  'static_pages#home'
  get     'about'   =>  'static_pages#about'
  get     'signup'  =>  'users#new'
  get     'login'   =>  'sessions#new'
  post    'login'   =>  'sessions#create'
  delete  'logout'  =>  'sessions#destroy'
  post    'sheet_change' => 'static_pages#sheet_change'
  get     'get_new_tab'  => 'static_pages#get_new_tab'
  post    'set_screen_size' => 'static_pages#set_screen_size'
  resources :users
  resources :tabs
  resources :sheets

end
