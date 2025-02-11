-module(calc).

-export([pn/1, rpn/1]).

to_number(X) ->
    case string:to_float(X) of
        {F, []} -> F;
        {error, no_float} ->
            case string:to_integer(X) of
                {error, _} -> error(badarith);
                {In, _} -> In
            end
    end.

%% reverse polish notation
rpn(S) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(S, " ")),
    Res.

rpn("+", [N1,N2|S]) -> [N2+N1|S];
rpn("-", [N1,N2|S]) -> [N2-N1|S];
rpn("*", [N1,N2|S]) -> [N2*N1|S];
rpn("/", [N1,N2|S]) -> [N2/N1|S];
rpn("^", [N1,N2|S]) -> [math:pow(N2,N1)|S];
rpn("ln", [N|S])    -> [math:log(N)|S];
rpn("log10", [N|S]) -> [math:log10(N)|S];
rpn("sum", Stack) -> [lists:sum(Stack)|[]];
rpn(X, Stack) -> [to_number(X)|Stack].

%% polish notation
pn(S) -> rpn(string:reverse(S)).