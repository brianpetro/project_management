Aehalo::Application.routes.draw do
  resources :tasks


  resources :groups do
	  resources :members
	end

  resources :cities do
  	resources :reviewers
	  resources :seals
	end

  resources :coordinates


  resources :projects do
    resources :blueprints
    resources :notes do
			collection { post :sort }
		end
    resources :participants
  end



  mount StripeEvent::Engine => '/stripe'
	get 'tags/:tag', to: 'notes#index', as: :tag
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
end
