declare

fun {Recognize L}
    case L of nil then false
    [] H|T then
        if H==97 then
            {RecognizeB T}
        else
            false
        end
    end
end

fun {Recognize L}
    case L of nil then false
    [] H|T then
        if H==98 then
            {RecognizeB T}
        elseif H==97 then
            (RecognizeA T}
        else
            false
        end
    end
end

fun {RecognizeA L}
    case L of nil then
        true
    else
        false
    end
end

{Browse {Recognize "abbbbbba"}}
{Browse {Recognize "aaba"}}
{Browse {Recognize "aa"}}
{Browse {Recognize "baa"}}
{Browse {Recognize "aab"}}
