Rails.application.routes.draw do
  get 'static_pages/index'
  root "static_pages#index"

  scope :api do 
  	scope :v1 do
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
