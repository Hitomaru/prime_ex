defmodule Prime do

  @spec nth(non_neg_integer()) :: non_neg_integer()
  def nth(n) when n > 0 and n |> is_integer(), do: n |> list_to_nth() |> List.last()

  @spec list_to_nth(non_neg_integer()) :: [non_neg_integer(), ...]
  def list_to_nth(n) when n > 0 and n |> is_integer do
    1..n
    |> Enum.reduce([], fn (_, current_primes) -> current_primes |> with_subsequent() end)
  end

  @spec with_subsequent([non_neg_integer(), ...]) :: [non_neg_integer(), ...]
  defp with_subsequent([]), do: [2]
  defp with_subsequent([2]), do: [2, 3]
  defp with_subsequent(primes) when primes |> is_list() do
    new_prime = primes
    |> Enum.max()
    |> Stream.iterate(&(&1 + 2))
    |> Stream.filter(&(primes |> all_disjoint?(&1)))
    |> Stream.take(1)
    |> Enum.to_list()
    primes ++ new_prime
  end

  @spec all_disjoint?([non_neg_integer(), ...], non_neg_integer()) :: boolean()
  defp all_disjoint?(primes, number) when primes |> is_list() and number |> is_integer() and number > 0 do
    primes
    |> Enum.all?(&(rem(number, &1) != 0))
  end
end
