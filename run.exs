{nth, _} = System.argv()
|> List.first()
|> Integer.parse()

"#{nth}th prime number: #{nth |> Prime.nth()}"
|> IO.puts()
