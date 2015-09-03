declare
fun {Append Xs Ys}
	case Xs of H|T then
		H | {Append T Ys}
	[] nil then
		case Ys of Hy|Ty then
			Hy | {Append nil Ty}
		[] nil then
			nil
		end
	end
end

{Browse {Append [4 5 6] nil}}
{Browse {Append nil [4 5 6]}}
{Browse {Append [3] [5 6]}}
{Browse {Append [4 5 6] [6 5 4]}}