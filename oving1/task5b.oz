declare fun {Max X Y}
if X == 0 then
Y
elseif Y == 0 then
X
else
1 + {Max X-1 Y-1}
end
end

{Browse {Max 2 3}}
{Browse {Max 4 10}}
{Browse {Max 7 3}}