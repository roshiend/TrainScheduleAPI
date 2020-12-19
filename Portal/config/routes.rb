Rails.application.routes.draw do
    root "dashboard#index"
  	resources :stations do 
      collection {post :import} #path for csv upload
      collection do
        delete 'delete_batch_or_selected'
      end
  	end


    resources :trainlines do 
      collection {post :import} #path for csv upload
      collection do
        delete 'delete_batch_or_selected'
      end
      collection do
        patch 'inline_update'
      end


    end
  	
 
end
