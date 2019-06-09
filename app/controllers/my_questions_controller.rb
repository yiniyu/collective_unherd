class MyQuestionsController < ApplicationController
  def index
    @my_questions = MyQuestion.all

    render("my_question_templates/index.html.erb")
  end

  def show
    @my_question = MyQuestion.find(params.fetch("id_to_display"))

    render("my_question_templates/show.html.erb")
  end

  def new_form
    @my_question = MyQuestion.new

    render("my_question_templates/new_form.html.erb")
  end

  def create_row
    @my_question = MyQuestion.new

    @my_question.committee_id = params.fetch("committee_id")
    @my_question.question_details = params.fetch("question_details")
    @my_question.notes = params.fetch("notes")
    @my_question.user_id = params.fetch("user_id")

    if @my_question.valid?
      @my_question.save

      redirect_back(:fallback_location => "/my_questions", :notice => "My question created successfully.")
    else
      render("my_question_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @my_question = MyQuestion.find(params.fetch("prefill_with_id"))

    render("my_question_templates/edit_form.html.erb")
  end

  def update_row
    @my_question = MyQuestion.find(params.fetch("id_to_modify"))

    @my_question.committee_id = params.fetch("committee_id")
    @my_question.question_details = params.fetch("question_details")
    @my_question.notes = params.fetch("notes")
    @my_question.user_id = params.fetch("user_id")

    if @my_question.valid?
      @my_question.save

      redirect_to("/my_questions/#{@my_question.id}", :notice => "My question updated successfully.")
    else
      render("my_question_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @my_question = MyQuestion.find(params.fetch("id_to_remove"))

    @my_question.destroy

    redirect_to("/my_questions", :notice => "My question deleted successfully.")
  end
end
