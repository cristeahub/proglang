\insert 'List.oz'
declare

fun {SplitTrain Xs Y}
    Pos = {Position Xs Y}
    Hs = {Take Xs Pos-1}
    Ts = {Drop Xs Pos}
in
    Hs#Ts
end

fun {FewFind Xs Ys}
    case Ys of nil then nil
    [] Y | Yr then
       X | Xr = Xs in
        if Y==X then {FewFind Xr Yr}
        else
            Hs Ts in
            Hs#Ts = {SplitTrain Xs Y}
            trackA({Length Ts}+1) |
            trackB({Length Hs}) |
            trackA(~({Length Ts}+1)) |
            trackB(~({Length Hs})) |
            {FewFind {Append Ts Hs} Yr}
        end
    end
end

{Browse {FewFind [c a b] [c b a]}}
