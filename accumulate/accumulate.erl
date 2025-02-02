%% Accumulate function or map.
-module(accumulate).
-export([accumulate/2]).

accumulate(_Fn, [], Acc) -> Acc;

accumulate(Fn, [ Head | Tail], Acc) -> accumulate(Fn, Tail, lists:append(Acc, [Fn(Head)])).

-spec accumulate(fun((A) -> B), list(A)) -> list(B).
accumulate(Fn, List) -> accumulate(Fn, List, []).
