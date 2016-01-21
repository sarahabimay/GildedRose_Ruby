require_relative "rule_base.rb"

class SulfurasRule < RuleBase
  def applicable_to?(item)
    "Sulfuras, Hand of Ragnaros".eql?(item.name)
  end
end
