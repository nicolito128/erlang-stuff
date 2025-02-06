%% List operations.
-module(xlists).

-export([rm_duplicates/1]).

rm_duplicates([]) -> [];

rm_duplicates([ First | T ]) -> [ First | rm_duplicates(T, First)].

rm_duplicates([], _) -> [];

rm_duplicates([ Same | T ], Same) -> rm_duplicates(T, Same);

rm_duplicates([ Next | T ], _) -> [ Next | rm_duplicates(T, Next) ].
