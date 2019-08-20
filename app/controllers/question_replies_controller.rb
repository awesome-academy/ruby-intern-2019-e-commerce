class QuestionRepliesController < ApplicationController
  before_action :get_question, only: %i(open_form_replies reply_for_other_reply)
  def create_question
    @question = Question.new question_params
    if @question.save
      respond_to(&:js)
    else
      flash[:danger] = t "flash.error"
      redirect_to product_detail_path(product_id: question_params[:product_id])
    end
  end

  def create_reply
    @reply = ReplyQuestion.new reply_params
    if @reply.save
      respond_to(&:js)
    else
      flash[:danger] = t "flash.error"
      redirect_to product_detail_path(product_id: question_params[:product_id])
    end
  end

  def open_form_replies
    respond_to(&:js)
  end

  def reply_for_other_reply
    respond_to(&:js)
  end

  def like_question
    @question = Question.find_by id: params[:question_id]
    @question.num_like += 1
    if @question.save
      respond_to(&:js)
    else
      flash[:danger] = t "flash.error"
      redirect_to product_detail_path(product_id: params[:product_id])
    end
  end

  def like_replies
    @reply = ReplyQuestion.find_by id: params[:reply_id]
    @reply.num_like += 1
    if @reply.save
      respond_to(&:js)
    else
      flash[:danger] = t "flash.error"
      redirect_to product_detail_path(product_id: params[:product_id])
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :content, :product_id)
  end

  def reply_params
    params.require(:reply_question).permit(:question_id, :user_id, :content)
  end

  def get_question
    @reply = ReplyQuestion.new
    @content = params[:content]
    @question = Question.find_by id: params[:question_id]
  end
end