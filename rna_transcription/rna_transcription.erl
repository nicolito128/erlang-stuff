%%
%% Your task is determine the RNA complement of a given DNA sequence.
%%
%% Both DNA and RNA strands are a sequence of nucleotides.
%% The four nucleotides found in DNA are adenine (A), cytosine (C), guanine (G) and thymine (T).
%% The four nucleotides found in RNA are adenine (A), cytosine (C), guanine (G) and uracil (U).
%%
%% Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:
%%    G -> C
%%    C -> G
%%    T -> A
%%    A -> U
%%
-module(rna_transcription).

-export([to_rna/1]).

convert(C) ->
    case C of
        "G" -> "C";
        "C" -> "G";
        "T" -> "A";
        "A" -> "U";
        _ -> ""
    end.

to_rna(Strand) -> to_rna(Strand, []).

to_rna([], Acc) -> Acc;

to_rna([ Head | T ], Acc) -> to_rna(T, Acc ++ convert([Head])).
