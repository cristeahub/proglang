\insert 'List.oz'

declare

fun {ApplyMoves S Ms}
    case Ms of nil then [S]
    [] M|Mr then
        NextS = case M of trackA(N) then
            if N>0 then
                NewA = {Append {Drop S.main {Length S.main}-N} S.trackA}
                NewM = {Take S.main {Length S.main}-N}
                    in
                    state(main:NewM trackA:NewA trackB:S.trackB)
            elseif N<0 then
                NewM = {Append S.main {Take S.trackA ~N}}
                NewA = {Drop S.trackA ~N}
                    in
                    state(main:NewM trackA:NewA trackB:S.trackB)
            else S end
        [] trackB(N) then
            if N>0 then
                NewB = {Append {Drop S.main {Length S.main}-N} S.trackB}
                NewM = {Take S.main {Length S.main}-N}
                    in
                    state(main:NewM trackA:S.trackA trackB:NewB)
            elseif N<0 then
                NewM = {Append S.main {Take S.trackA ~N}}
                NewB = {Drop S.trackB ~N}
                    in
                    state(main:NewM trackA:S.trackA trackB:NewB)
            else S end
        end
    in
        S | {ApplyMoves NextS Mr}
    end
end


{Browse {ApplyMoves state(main:[a b] trackA:nil trackB:nil) [trackA(1) trackB(1) trackA(~1)]}}
