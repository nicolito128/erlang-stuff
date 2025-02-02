%%
%% Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, 
%% multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. 
%% The conjecture states that no matter which number you start with, you will always reach 1 eventually.
%%
-module(collatz_conjecture).

-export([steps/1]).

steps(1, Acc) -> Acc;

steps(N, _Acc) when N =< 0 -> erlang:error(badarg);

steps(N, Acc) when (N band 1) =:= 0 -> steps(N div 2, Acc + 1);

steps(N, Acc) -> steps(3*N + 1, Acc + 1).

steps(N) -> steps(N, 0).
