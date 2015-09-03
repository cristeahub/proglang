declare

% Oppgave 3
% a
local Append in
    Append = proc {$ Xs Ys ?Zs}
        case Xs of nil then
            Zs = Ys
        else
            case Xs of '|'(X Xr) then
                local Zr in Zs = '|'(X Zr)
                    {Append Xr Ys Zr}
                end
            end
        end
end

{Browse {Append [1 2 3] [4 5 6]}}

% b

local Max in
    local NoCall in
        NoCall = proc {$ N M X ?S}
            local ZeroN in
                {Value.'==' N 0 ZeroN}
                if ZeroN then
                    {Number.'+' M X S}
                else
                    local ZeroM in
                        {Value.'==' M 0 ZeroM}
                        if ZeroM then
                            {Number.'+' N X S}
                        else
                            local NewM in
                                local NewM in
                                    local NewX in
                                        {Number.'-' N 1 NewN}
                                        {Number.'-' N 1 NewM}
                                        {Number.'+' X 1 NewX}
                                        {NoCall NewN NewM NewX S}
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    Max = proc {$ N M ?S}
            {NoCall N M 0 S}
          end
    end
end

{Browse {Max 1 2}}


