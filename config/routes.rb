Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root to: "home#index"
  # get 'home/index'

  post "/graphql", to: "public/graphql#execute"
  post "/todo/graphql", to: "todo/graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql", as: :public_graphiql
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/todo/graphiql", graphql_path: "/todo/graphql", as: :todo_graphiql
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
