\insert 'List.oz'
declare

fun {SplitTrain Xs Y}
    Pos = {Position Xs Y}
    Hs = {Take Xs Pos-1}
    Ts = {Drop Xs Pos}
in
    Hs#Ts
end

fun {FewerFind Ms Os Ts Ys}
    case Ys of nil then nil
    [] Y | Yr then
        if {Member Ms Y} then
            M | Mr = Ms in
                if Y == M then
                    {FewerFind Mr Os Ts Yr}
                else
                    Hs Bs in
                    Hs#Bs = {SplitTrain Ms Y}
                    trackA({Length Ts}+1) |
                    trackB({Length Hs}) |
                    trackA(~1) |
                    {FewerFind nil {Append Bs Os} {Append Hs Ts} Yr}
                end
        elseif {Member Os Y} then
            Hs Bs in
            Hs#Bs = {SplitTrain Os Y}
            trackA(~{Length Hs}) |
            trackB({Length Hs}) |
            trackA(~1) |
            {FewerFind nil Bs {Append Hs Ts} Yr}
        elseif {Member Ts Y} then
            Hs Bs in
            Hs#Bs = {SplitTrain Ts Y}
            trackB(~{Length Hs}) |
            trackA({Length Hs}) |
            trackB(~1) |
            {FewerFind nil {Append Hs Os} Bs Yr}

        end
    end
end

{Browse {FewerFind [a b] nil nil [b a]}}
