%% List operations.
-module(xlists).

-export([rem_duplicates/2, fill/2, reverse/1]).

%% rem_duplicates/2 removes all copies of an item from a list except the first occurrence.
rem_duplicates(List, Elem) when is_list(List) -> rem_duplicates(List, Elem, false).

rem_duplicates([], _, _) -> [];

rem_duplicates([ Same | T ], Same, false) -> [ Same | rem_duplicates(T, Same, true) ];

rem_duplicates([ Same | T ], Same, true) -> rem_duplicates(T, Same, true);

rem_duplicates([ Head | T ], Elem, FirstOccur) -> [ Head | rem_duplicates(T, Elem, FirstOccur) ].

%% fill/2 creates a new list with the given Len filled with elements N.
fill(Len, _) when Len =< 0 -> [];

fill(Len, N) when is_integer(Len) -> fill(Len, N, []).

fill(0, _, Acc) -> Acc;

fill(Len, N, Acc) ->  fill(Len - 1, N, [ N | Acc]).

%% reverse
reverse(List) when is_list(List) -> reverse(List, []).

reverse([], Acc) -> Acc;

reverse([ Head | T ], Acc) -> reverse(T, [ Head | Acc ]).