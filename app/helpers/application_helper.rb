module ApplicationHelper
  def factorsCount
    Factor.count
  end

  def companiesCount
    Company.count
  end

  def technologiesCount
    Technology.count
  end

  def prioritiesCount
    Priority.count  
  end
end
