class QuestionsController < ApplicationController
  def new
    @review = Review.find(params[:review_id])
    @question = @review.questions.new
    
  end
  
  def create
    review = Review.find(params[:review_id])    
    QuestionService.create_from_params(params.merge(:review => review))
    # render :text => "Ok"
    
    render :text => "Ok"
  end
end
