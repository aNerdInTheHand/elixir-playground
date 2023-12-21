defmodule BayesTest do
  use ExUnit.Case
  doctest Bayes

  test "Returns the full value for main/3" do
    assert Bayes.main(4, 50, 5) == 0.29411764705882354
  end

  test "Returns the rounded value for main/4" do
    assert Bayes.main(4, 50, 5, "number") == "29.41%"
  end

  test "Returns the rounded value for main/4 with nonsense 4th arg" do
    assert Bayes.main(4, 50, 5, "jeff") == "29.41%"
  end

  test "Returns the readable text value for main/4 with \"text\" 4th arg" do
    assert Bayes.main(4, 50, 5, "text") == "Low chance"
  end
end
