class CommitteesController < ApplicationController
  before_action :current_user_must_be_committee_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_committee_user
    committee = Committee.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == committee.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @committees = current_user.committees.page(params[:page]).per(10)

    render("committee_templates/index.html.erb")
  end

  def show
    @committee = Committee.find(params.fetch("id_to_display"))

    render("committee_templates/show.html.erb")
  end

  def new_form
    @committee = Committee.new

    render("committee_templates/new_form.html.erb")
  end

  def create_row
    @committee = Committee.new

    @committee.name = params.fetch("name")
    @committee.board_members_id = params.fetch("board_members_id")
    @committee.user_id = params.fetch("user_id")

    if @committee.valid?
      @committee.save

      redirect_back(:fallback_location => "/committees", :notice => "Committee created successfully.")
    else
      render("committee_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_board_member
    @committee = Committee.new

    @committee.name = params.fetch("name")
    @committee.board_members_id = params.fetch("board_members_id")
    @committee.user_id = params.fetch("user_id")

    if @committee.valid?
      @committee.save

      redirect_to("/board_members/#{@committee.board_members_id}", notice: "Committee created successfully.")
    else
      render("committee_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @committee = Committee.find(params.fetch("prefill_with_id"))

    render("committee_templates/edit_form.html.erb")
  end

  def update_row
    @committee = Committee.find(params.fetch("id_to_modify"))

    @committee.name = params.fetch("name")
    @committee.board_members_id = params.fetch("board_members_id")
    

    if @committee.valid?
      @committee.save

      redirect_to("/committees/#{@committee.id}", :notice => "Committee updated successfully.")
    else
      render("committee_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_board_members
    @committee = Committee.find(params.fetch("id_to_remove"))

    @committee.destroy

    redirect_to("/board_members/#{@committee.board_members_id}", notice: "Committee deleted successfully.")
  end

  def destroy_row_from_user
    @committee = Committee.find(params.fetch("id_to_remove"))

    @committee.destroy

    redirect_to("/users/#{@committee.user_id}", notice: "Committee deleted successfully.")
  end

  def destroy_row
    @committee = Committee.find(params.fetch("id_to_remove"))

    @committee.destroy

    redirect_to("/committees", :notice => "Committee deleted successfully.")
  end
end
