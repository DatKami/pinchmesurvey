Rails.application.routes.draw do
	resources :surveys do
		resources :questions
	end
	resources :questions do
		member do
			get 'shift_up'
			get 'shift_down'
		end
		resources :answers

	end
	resources :answers
	resources :submissions do
		resources :surveys
		resources :responses
	end
	resources :responses do
		resources :questions
	end
	root 'surveys#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
