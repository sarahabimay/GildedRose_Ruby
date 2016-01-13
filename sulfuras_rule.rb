require_relative "rules_base.rb"

class SulfurasRule < RulesBase
  def applicable_to?(item)
    "Sulfuras, Hand of Ragnaros".eql?(item.name)
  end
end
