Rails.application.routes.draw do
  
  namespace :v1 do
    resources  :stations do
      collection do
        delete 'delete_batch_or_selected'
      end
      collection do
        resources :transits
      end
    end

    resources  :trainlines do 
      collection do
        delete 'delete_batch_or_selected'
      end
      #resources  :stations

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
