declare
fun {Position Xs Y}
case Xs of H|T then
if H==Y then
1
else
1 + {Position T Y}
end
end
end

{Browse {Position [1 2 3] 3}}
{Browse {Position [1 10 3] 10}}
{Browse {Position [12 2 3] 12}}
{Browse {Position [1 2 3 4 5 6 7 8 9] 9}}