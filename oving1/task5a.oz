declare
fun {SumTo From To}
	if From==To then
		From
	else
		To + {SumTo From To-1}
	end
end

{Browse {SumTo 0 2}}
{Browse {SumTo 3 5}}
{Browse {SumTo 1 10}}
