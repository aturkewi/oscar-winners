class BudgetServiceObject

  attr_accessor :unformatted_budget

  def initialize(unformatted_budget)
    @unformatted_budget = unformatted_budget
  end

  # NO BUDGET: 1929, 1937, 1944, 1949, 1952
  # 1981 uses £
  def budget
    if unformatted_budget
      budget_in_words = unformatted_budget.gsub(/ *\[[^)]*\] */, "").
        gsub(/ *\([^)]*\) */, "").gsub("US","")
      # convert_to_int()
    else
      "NO BUDGET NO BUDGET NO BUDGET NO BUDGET NO BUDGET NO BUDGET "
    end
  end

end
