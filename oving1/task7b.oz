declare
fun {Take Xs N}
if N==0 then
nil
else
case Xs of H|T then
H | {Take T N-1}
[] nil then
nil
end
end
end

{Browse {Take [1 2 3 4 5] 4}}
{Browse {Take [1 2 3 4 5] 10}}
{Browse {Take [1 2 3 4 5] 2}}
{Browse {Take [1 2 3 4 5] 4}}