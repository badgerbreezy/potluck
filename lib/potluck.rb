class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    result = []
    @dishes.find_all do |dish|
      if dish.category == category
        result << dish
      end
    end
    result
  end

  def dish_categories
    @dishes.map do |dish|
      dish.category
    end
  end

  def get_all_from_category_name(category)
    result = []
    @dishes.find_all do |dish|
      if dish.category == category
        result << dish.name
      end
    end
    result
  end

  def menu
    full_menu = Hash.new(0)
    @dishes.each do |dish|
      full_menu[dish.category] = get_all_from_category_name(dish.category).sort
    end
    full_menu[:appetizers] = full_menu.delete(:appetizer)
    full_menu[:entres] = full_menu.delete(:entre)
    full_menu[:desserts] = full_menu.delete(:dessert)
    full_menu
  end

  def ratio(category)
    ratio_category = @dishes.find_all do |dish|
      dish.category == category
    end

    (ratio_category.count.to_f / @dishes.count) * 100
  end
end
