Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 商品一覧
  get '/',      to: 'list#index',  as: 'item_list'
  get '/items', to: 'list#index'
  # 商品詳細
  get '/items/:id', to: 'detail#index',  as: 'item_detail'
  # レビュー一覧
  get '/items/:id/reviews', to: 'review#index',  as: 'reviews'
  # レビュー投稿フォーム
  get '/items/:id/reviews/new', to: 'review#new',  as: 'review_new'
  # レビュー投稿
  post '/items/:id/review/create', to: 'review#create', as: 'review_create'
end
