class QuestionService
  class << self
    # params is a hash
    # params[:review]
    # params[:question] = {"first_name"=>"", "last_name"=>"", "email"=>"", "question"=>""}    
    def create_from_params(params)
      review = params[:review]      
      question_params = params[:question]
      company = review.company
      customer_data = question_data.slice(:first_name,:last_name,:email)
      customer = company.customers.create(customer_data)
      question_data = question_params.slice(:question)
      review.questions.create(question_data.merge({:customer => customer}))
    end
  end
end