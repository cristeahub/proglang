declare

% stream generator from simgraph.oz
fun lazy {Ones}
    1|{Ones}
end

fun lazy {OnesAsFloat}
    1.0|{OnesAsFloat}
end

fun lazy {IncNumStream}
    fun lazy {INS X} X|{INS X+1.0} end
in
    {INS 1.0}
end

% task 2
fun lazy {StreamMap S F}
    case S of nil then
        nil
    [] Shead|Srest then
        {F Shead}|{StreamMap Srest F}
    end
end

% task 3
fun lazy {StreamZip S1 S2 F}
    case S1#S2 of nil then nil
    [] (S1head|S1rest)#(S2head|S2rest) then
        {F S1head S2head}|{StreamZip S1rest S2rest F}
    end
end

% task 4
fun lazy {StreamScale SF Factor}
    case SF of nil then nil
    [] SFhead|SFrest then
        local fun {Scale X} X*Factor end
        in
            {Scale SFhead}|{StreamScale SFrest Factor}
        end
    end
end

% task 5
fun lazy {StreamAdd SF1 SF2}
    case SF1#SF1 of nil then nil
    [] (SF1head|SF1rest)#(SF2head|SF2rest) then
        local fun {Add X Y} X+Y end
        in
            {Add SF1head SF2head}|{StreamAdd SF1rest SF2rest}
        end
    end
end

% task 6
fun lazy {StreamIntegrate SF InitValue Dt}
    case SF of nil then nil
    [] SFhead|SFrest then
        InitValue | {StreamIntegrate SFrest InitValue+SFhead*Dt Dt}
    end
end

% task 7
fun lazy {MakeRC R C Dt}
    local fun {RC SF V0}
        {StreamAdd {StreamIntegrate {StreamScale SF 1.0/C} V0 Dt} {StreamScale SF R}}
    end in
        RC
    end
end

% tests
local
    fun {MultiplyByFive X} X*5 end
    fun {Multiply X Y} X*Y end
    Streams = "task 2"#{StreamMap {Ones} MultiplyByFive}|
              "task 3"#{StreamZip {IncNumStream} {IncNumStream} Multiply}|
              "task 4"#{StreamScale {IncNumStream} 0.3}|
              "task 5"#{StreamAdd {OnesAsFloat} {IncNumStream}}|
              "task 6"#{StreamIntegrate {IncNumStream} 5.0 3.0}|
              "task 7"#{{MakeRC 5.0 1.0 0.2} {OnesAsFloat} 2.0}|
              nil
in
    {ForAll Streams proc {$ Str}
        case Str of Name#Stream then
            {Browse Name} % ascii ftw
            {Nth Stream 5 _}
            {Browse Stream} % had to put this here, because of some binding stuff
        [] nil then
            skip
        end
    end}
    skip
end
