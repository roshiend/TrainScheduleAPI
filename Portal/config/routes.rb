Rails.application.routes.draw do
    root "dashboard#index"
  	resources :stations do 
      collection {post :import} #path for csv upload

  	end


    resources :trainlines do 
      collection {post :import} #path for csv upload
     

    end
  	
 
end
