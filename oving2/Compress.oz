declare

fun {Compress Ms}
    Ns={ApplyRules Ms}
in
    if Ns==Ms then Ms else {Compress Ns} end
end

fun {ApplyRules Ms}
    case Ms of nil then nil
    [] trackA(N) | trackA(M) | Rest then
        trackA(N+M) | {ApplyRules Rest}
    [] trackB(N) | trackB(M) | Rest then
        trackB(N+M) | {ApplyRules Rest}
    [] trackA(0) | Rest then
        {ApplyRules Rest}
    [] trackB(0) | Rest then
        {ApplyRules Rest}
    [] H | Rest then
        H | {ApplyRules Rest}
    end
end

{Browse {Compress [trackB(~1) trackA(1) trackA(~1) trackB(1)]}}
