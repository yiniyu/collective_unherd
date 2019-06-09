class ResponsesController < ApplicationController
  def index
    @responses = Response.all

    render("response_templates/index.html.erb")
  end

  def show
    @response = Response.find(params.fetch("id_to_display"))

    render("response_templates/show.html.erb")
  end

  def new_form
    @response = Response.new

    render("response_templates/new_form.html.erb")
  end

  def create_row
    @response = Response.new

    @response.user_id = params.fetch("user_id")
    @response.my_questions_id = params.fetch("my_questions_id")
    @response.response = params.fetch("response")
    @response.board_members_id = params.fetch("board_members_id")

    if @response.valid?
      @response.save

      redirect_back(:fallback_location => "/responses", :notice => "Response created successfully.")
    else
      render("response_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @response = Response.find(params.fetch("prefill_with_id"))

    render("response_templates/edit_form.html.erb")
  end

  def update_row
    @response = Response.find(params.fetch("id_to_modify"))

    @response.user_id = params.fetch("user_id")
    @response.my_questions_id = params.fetch("my_questions_id")
    @response.response = params.fetch("response")
    @response.board_members_id = params.fetch("board_members_id")

    if @response.valid?
      @response.save

      redirect_to("/responses/#{@response.id}", :notice => "Response updated successfully.")
    else
      render("response_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @response = Response.find(params.fetch("id_to_remove"))

    @response.destroy

    redirect_to("/responses", :notice => "Response deleted successfully.")
  end
end
