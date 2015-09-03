declare

Keys = ["local" "in" "if" "then" "else" "end"]
Operators = ["+" "-" "/" "*" "=" "=="]

fun {Tokenize L}
  case L of Lexeme|Rest then
    if {Member Keys Lexeme} then

    %% Det er visst et problem at på noen systemer er det {Member element liste}
    %% mens hos andre er det {Member liste element}
    %% så kan være at det må endres =)

      key(Lexeme) | {Tokenize Rest}
    elseif {Member Operators Lexeme} then
      op(Lexeme) | {Tokenize Rest}
    else
      case Lexeme of Letter|_ then
        if Letter >= &a andthen Letter =< &z then
          atom(Lexeme) | {Tokenize Rest}
        elseif Letter >= &A andthen Letter =< &Z then
          id(Lexeme) | {Tokenize Rest}
        else
          "?" | {Tokenize Rest}
        end
      end
    end
  [] nil then
    nil
  end  
end

%% Husk å skru på sånn at du ser strenger og ikke bare tall =)
{Browse {Tokenize ["local" "X" "in" "if" "x" "end"]}}
{Browse {Tokenize ["in" "Xoli" "then" "if" "xoli" "end"]}}
{Browse {Tokenize ["=" "+" "-" "if" "x" "*"]}}
{Browse {Tokenize ["==" "X" "in" "/" "x" "***"]}}
{Browse {Tokenize ["==" "X" "in" "/" "x" "==/"]}}