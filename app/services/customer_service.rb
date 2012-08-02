class CustomerService
  class << self
    def create_invites_from_params(invites,company_id)
      count = 0
      errors = []
      company = Company.find(company_id)
      invites.each_with_index do |invite,idx|
        invite = invite.with_indifferent_access
        if (invite[:first_name].blank? || invite[:last_name].blank? || invite[:email].blank?)
          errors << "Please enter first_name, last_name, email for entry ##{idx + 1}"
        else
          begin
            company.customers.create(invite)
            count = count + 1
          rescue Exception => e
            errors << e.message
          end                  
        end        
      end
      
      response = {}
      if errors.present?
        response[:status] = "error"
      else
        response[:status] = "success"
      end  
      response[:errors] = errors
      response[:new_contacts] = count
      
      return response
    end
  end
end