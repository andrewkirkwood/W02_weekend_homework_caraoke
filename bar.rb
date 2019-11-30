class Bar

  attr_reader :bar_name, :bar_till

  def initialize(bar_name, bar_till = 0)
    @bar_name = bar_name
    @bar_tabs = []
    @drinks = []
    @bar_till = bar_till
  end

  def get_bar_tabs
    return @bar_tabs
  end

  def get_drinks
    return @drinks
  end

  def add_drink_to_bar(drink)
    @drinks << drink
  end

  def create_bar_tab(customer)
    @bar_tabs << customer
  end

  
end
