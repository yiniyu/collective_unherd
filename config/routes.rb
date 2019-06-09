Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "board_members#index"
  # Routes for the Committee resource:

  # CREATE
  get("/committees/new", { :controller => "committees", :action => "new_form" })
  post("/create_committee", { :controller => "committees", :action => "create_row" })

  # READ
  get("/committees", { :controller => "committees", :action => "index" })
  get("/committees/:id_to_display", { :controller => "committees", :action => "show" })

  # UPDATE
  get("/committees/:prefill_with_id/edit", { :controller => "committees", :action => "edit_form" })
  post("/update_committee/:id_to_modify", { :controller => "committees", :action => "update_row" })

  # DELETE
  get("/delete_committee/:id_to_remove", { :controller => "committees", :action => "destroy_row" })
  get("/delete_committee_from_user/:id_to_remove", { :controller => "committees", :action => "destroy_row_from_user" })
  get("/delete_committee_from_board_members/:id_to_remove", { :controller => "committees", :action => "destroy_row_from_board_members" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Response resource:

  # CREATE
  get("/responses/new", { :controller => "responses", :action => "new_form" })
  post("/create_response", { :controller => "responses", :action => "create_row" })

  # READ
  get("/responses", { :controller => "responses", :action => "index" })
  get("/responses/:id_to_display", { :controller => "responses", :action => "show" })

  # UPDATE
  get("/responses/:prefill_with_id/edit", { :controller => "responses", :action => "edit_form" })
  post("/update_response/:id_to_modify", { :controller => "responses", :action => "update_row" })

  # DELETE
  get("/delete_response/:id_to_remove", { :controller => "responses", :action => "destroy_row" })
  get("/delete_response_from_question/:id_to_remove", { :controller => "responses", :action => "destroy_row_from_question" })
  get("/delete_response_from_board_members/:id_to_remove", { :controller => "responses", :action => "destroy_row_from_board_members" })

  #------------------------------

  # Routes for the My question resource:

  # CREATE
  get("/my_questions/new", { :controller => "my_questions", :action => "new_form" })
  post("/create_my_question", { :controller => "my_questions", :action => "create_row" })

  # READ
  get("/my_questions", { :controller => "my_questions", :action => "index" })
  get("/my_questions/:id_to_display", { :controller => "my_questions", :action => "show" })

  # UPDATE
  get("/my_questions/:prefill_with_id/edit", { :controller => "my_questions", :action => "edit_form" })
  post("/update_my_question/:id_to_modify", { :controller => "my_questions", :action => "update_row" })

  # DELETE
  get("/delete_my_question/:id_to_remove", { :controller => "my_questions", :action => "destroy_row" })
  get("/delete_my_question_from_user/:id_to_remove", { :controller => "my_questions", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Board member resource:

  # CREATE
  get("/board_members/new", { :controller => "board_members", :action => "new_form" })
  post("/create_board_member", { :controller => "board_members", :action => "create_row" })

  # READ
  get("/board_members", { :controller => "board_members", :action => "index" })
  get("/board_members/:id_to_display", { :controller => "board_members", :action => "show" })

  # UPDATE
  get("/board_members/:prefill_with_id/edit", { :controller => "board_members", :action => "edit_form" })
  post("/update_board_member/:id_to_modify", { :controller => "board_members", :action => "update_row" })

  # DELETE
  get("/delete_board_member/:id_to_remove", { :controller => "board_members", :action => "destroy_row" })
  get("/delete_board_member_from_user/:id_to_remove", { :controller => "board_members", :action => "destroy_row_from_user" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
