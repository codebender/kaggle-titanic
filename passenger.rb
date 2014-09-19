class Passenger
  attr_accessor :id, :survived, :ship_class, :name, :sex, :age, :sib_spouse_num,
    :parent_child_num, :ticket_number, :fare, :cabin, :ebarked_from

  def initialize(args)
    args.each { |k,v| instance_variable_set("@#{k}", v) }
  end

  def survived?
    survived
  end

  def died?
    !survived
  end

  def male?
    sex == 'male'
  end

  def female?
    sex == 'female'
  end
end
