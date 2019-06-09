Rails.application.routes.draw do
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

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
