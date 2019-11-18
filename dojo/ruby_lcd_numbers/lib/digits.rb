ALL_NUMBERS = <<-EO_ALL_NUMBERS
   --          --    --          --    --    --    --    --       
  |  |     |     |     |  |  |  |     |        |  |  |  |  |      
  |  |         --    --    --    --    --      |   --    --       
  |  |     |  |        |     |     |  |  |     |  |  |     |      
   --          --    --          --    --          --    --     . 
EO_ALL_NUMBERS

NUMBERS = Hash[
  (0..9).to_a.concat(["."])
    .each_with_index
    .map do |character, index|
    [
      character.to_s,
      ALL_NUMBERS
        .split("\n")
        .map do |line|
        line.slice(2 + index * (2 + 4), 4)
      end.join("\n"),
    ]
  end
]
