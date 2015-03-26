module ApplicationHelper



  def graphCategory
    @category = Priority.select(:title)

    @userlist = @category.map do |u|
        [u.title]
    end

    @userlist



  end

  def graphData


    @category = Priority.all
    @userlist = @category.map do |u|
      {:name => u.title, :data => u.dimentions.weigth, :pointPlacement =>"on"}
    end





    @userlist.to_json



  end




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
