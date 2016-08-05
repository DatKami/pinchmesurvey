Rails.application.routes.draw do
	resources :surveys do
		resources :questions do
			resources :answers
		end
	end
	resources :questions do
		resources :answers
	end
	resources :answers
	root 'surveys#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
