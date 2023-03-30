defmodule Bayes do
  @moduledoc """
  Implementation of Bayes' Theorem
  """

  @doc """
  Calculate the probability of a hypothesis being true, given that some event has happened.

  The inputs `x, y, z` are equal to prior probability (the possibility of the hypothesis being true before evaluating any evidence), the possibility of the event happening conditional upon the hypothesis being true and the possibility of the event happening conditional upon the hypothesis being false.

  ## Examples

      iex> Bayes.main(4, 50, 5)
      0.29411764705882354

  """
  def main(x, y, z) do
    assign_true_values(x, y, z)
    |> calculate_posterior_probability
  end

  @doc """
  Calculate the probability of a hypothesis being true, given that some event has happened.

  Same as the `main/3` implementation but with an `output_type`. If value is "text" a readable string is returned, otherwise a float to 2 decimal places with a `%` suffixed.

  ## Examples

      iex> Bayes.main(4, 50, 5, "text")
      "Low chance"

      iex> Bayes.main(4, 50, 5, "number")
      "29.41%"

      iex> Bayes.main(4, 50, 5, "jeff")
      "29.41%"

  """
  def main(x, y, z, output_type) do
    assign_true_values(x, y, z)
    |> calculate_posterior_probability
    |> get_readable_value(output_type)
  end

  def assign_true_values(x, y, z) do
    %Bayes.Values{
      prior: x / 100,
      possibility_if_false: y / 100,
      possibility_if_true: z / 100
    }
  end

  def calculate_posterior_probability(%Bayes.Values{prior: x, possibility_if_false: y, possibility_if_true: z}) do
    x * y / (x * y + z * (1 - x))
  end

  def get_readable_value(probability, output_type) when output_type == "text" do
    case probability * 100 do
      p when p < 20 -> "Very low chance"
      p when p < 40 -> "Low chance"
      p when p < 60 -> "Fair chance"
      p when p < 80 -> "Fairly high chance"
      p when p < 95 -> "High chance"
      true -> "Very high chance"
    end
  end

  def get_readable_value(probability, _output_type) do
    output = Float.round(probability * 100, 2)
    "#{output}%"
  end
end
