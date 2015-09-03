declare
fun {Drop Xs N}
  case Xs of H|T then
    if N == 0 then
      H|T
    else
      {Drop T N-1}
    end
  [] nil then
    nil
  end
end

{Browse {Drop [1 2 3 4 5] 4}}
{Browse {Drop [1 2 3 4 5] 10}}
{Browse {Drop [1 2 3 4 5] 2}}
{Browse {Drop [1 2 3 4 5] 3}}
{Browse {Drop [1 2 3 4 5] 1}}