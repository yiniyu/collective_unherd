class BoardMembersController < ApplicationController
  before_action :current_user_must_be_board_member_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_board_member_user
    board_member = BoardMember.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == board_member.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @board_members = current_user.board_members.page(params[:page]).per(10)

    render("board_member_templates/index.html.erb")
  end

  def show
    @committee = Committee.new
    @response = Response.new
    @board_member = BoardMember.find(params.fetch("id_to_display"))

    render("board_member_templates/show.html.erb")
  end

  def new_form
    @board_member = BoardMember.new

    render("board_member_templates/new_form.html.erb")
  end

  def create_row
    @board_member = BoardMember.new

    @board_member.name = params.fetch("name")
    @board_member.committee_id = params.fetch("committee_id")
    @board_member.user_id = params.fetch("user_id")

    if @board_member.valid?
      @board_member.save

      redirect_back(:fallback_location => "/board_members", :notice => "Board member created successfully.")
    else
      render("board_member_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @board_member = BoardMember.find(params.fetch("prefill_with_id"))

    render("board_member_templates/edit_form.html.erb")
  end

  def update_row
    @board_member = BoardMember.find(params.fetch("id_to_modify"))

    @board_member.name = params.fetch("name")
    @board_member.committee_id = params.fetch("committee_id")
    

    if @board_member.valid?
      @board_member.save

      redirect_to("/board_members/#{@board_member.id}", :notice => "Board member updated successfully.")
    else
      render("board_member_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @board_member = BoardMember.find(params.fetch("id_to_remove"))

    @board_member.destroy

    redirect_to("/users/#{@board_member.user_id}", notice: "BoardMember deleted successfully.")
  end

  def destroy_row
    @board_member = BoardMember.find(params.fetch("id_to_remove"))

    @board_member.destroy

    redirect_to("/board_members", :notice => "Board member deleted successfully.")
  end
end
