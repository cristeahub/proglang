declare
fun {Length Xs}
case Xs of H|T then
1 + {Length T}
[] nil then
0
end
end

{Browse {Length 1|2|3|4|nil}}
{Browse {Length [1 2 3 4 5 6 7 8 9]}}
{Browse {Length [1 1 1 1 1 1 1 1 1]}}
{Browse {Length [1 1 1 1 3 2 3]}}