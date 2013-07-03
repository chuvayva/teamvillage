Teamvillage::Application.routes.draw do

  devise_for :users
  resources :users, :except => [:new, :create]  do
    put 'block', :on => :member, :as => 'block'
  end

  resources :tasks do
    put 'close', :on => :member, :as => 'close'
  end

  resources :projects

  root :to => 'users#user_tasks'

  # match 'm/:action/:id' => 'mailer#:action'

end
