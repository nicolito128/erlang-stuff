-module(hhfuns).

-export([filter/2, fold/3, max/1, min/1]).

%% filter a list based on function F
filter(F, List) -> lists:reverse(filter(F, List, [])).

filter(_, [], Acc) -> Acc;

filter(F, [ H | T ], Acc) ->
    case F(H) of
        true -> filter(F, T, [H | Acc]);
        false -> filter(F, T, Acc)
    end.

fold(_, Start, []) -> Start;

fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).

%% find the maximum of a list
max([]) -> undefined;

max([H|T]) -> fold(fun(X, Cur) when X > Cur -> X; (_, Cur) -> Cur end, H, T).

%% find the minimum of a list
min([]) -> undefined;

min([H|T]) -> fold(fun(X, Cur) when X < Cur -> X; (_, Cur) -> Cur end, H, T).