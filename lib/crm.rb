class Crm

  def employees_of_companies
    employees_of_companies = []
    CRM[:companies].each do |company|
      employees_of_companies << {:name => company[:name], :employees => []}
    end
    CRM[:people].each do |person|
      person[:employments].each do |employment|
        listed_person = {:id => person[:id],
                         :first_name => person[:first_name],
                         :last_name => person[:last_name],
                         :title => employment[:title]}
        employees_of_companies[employment[:company_id]][:employees] << listed_person
      end
    end
    employees_of_companies
  end

  def employments
    employments = []
    CRM[:people].each do |person|
      person[:employments].each do |employment|
        listed_employment = {
          :company_id => employment[:company_id],
          :company_name => CRM[:companies][employment[:company_id]][:name],
          :person_id => person[:id],
          :person_first_name => person[:first_name],
          :person_last_name => person[:last_name],
          :title => employment[:title]}
        employments << listed_employment
      end
    end
    employments
  end

  def no_work_history
    no_work_history_list = []
    CRM[:people].each do |person|
      if person[:employments].empty?
        no_work_history_personal_data = {
          :id => person[:id],
          :first_name => person[:first_name],
          :last_name => person[:last_name], }
        no_work_history_list << no_work_history_personal_data
      end
    end
    no_work_history_list
  end

end
