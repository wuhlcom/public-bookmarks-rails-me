Rails.application.routes.draw do
   resources :public_bookmarks, except: [:edit, :update] do
       get :index_authenticated, on: :collection
    end
   root 'public_bookmarks#index'
 # resources :public_bookmarks,except:[:edit,:update]
 # get 'hello_world/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
