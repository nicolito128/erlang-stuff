-module(hello).
-import(io, [put_chars/1]).
-export([factorial/1, mult/2, division/2, hi/0, convert_length/1]).

factorial(0) -> 1;
factorial(N) when N >= 1 -> N * factorial(N - 1).

mult(X, Y) -> X * Y.

division(_, 0) -> {error, 0};
division(N, D) -> {ok, N/D}.

convert_length({centimeter, X}) ->
    {inch, X / 2.54};

convert_length({inch, Y}) ->
    {centimeter, Y * 2.54}.

% This is a comment.
hi() -> put_chars("Hello, Erlang\n").