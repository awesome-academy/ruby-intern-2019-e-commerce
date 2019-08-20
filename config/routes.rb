Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users, controllers: {
      registrations: "registrations"
    }
    get "/my-account", to: "accounts#index"
    get "/info-account", to: "accounts#manage_account"
    get "/info-address-account", to: "accounts#manage_address"
    get "/product-detail", to: "products#index"
    get "/product-in-category", to: "categories#index"
    get "/quick-show-product", to: "products#show"
    post "/add-product-to-cart", to: "line_items#create"
    delete "/remove-item-cart", to: "carts#destroy"
    get "/detail-cart", to: "line_items#index"
    post "/change-quantity-product", to: "line_items#change_quantity_product"
    post "/buy-product-now", to: "line_items#show"
    post "/payment", to: "line_items#payment"
    get "/history-bill", to: "accounts#manage_order"
    get "/bill-not-transport", to: "shippers#index"
    post "/receive-bill", to: "shippers#receive_bill"
    delete "/cancel-bill", to: "shippers#cancel_bill"
    get "/show-detail-bill", to: "shippers#show"
    get "/bill-transport", to: "delivers#index"
    get "/modal-change-status-bill", to: "delivers#open_modal_change"
    post "/change-status-bill", to: "delivers#change_status_bill"
    post "/create-question-product", to: "question_replies#create_question"
    post "/create-reply-product", to: "question_replies#create_reply"
    get "/open-form-replies", to: "question_replies#open_form_replies"
    post "/reply-for-other-reply", to: "question_replies#reply_for_other_reply"
    post "/like-question-product", to: "question_replies#like_question"
    post "/like-reply-product", to: "question_replies#like_replies"
  end
end
