% A set of facts, rules, and sample queries about familial relationships in the British royal family

% possible queries:
% ?- father(albert, edward7).
% ?- son(edward7, albert).
% ?- mother(M, edward7).
% ?- daughter(D, P).
% ?- siblings(A, B).
% ?- descendent(alfred, A).
% ?- ancestor(A, alfred).

% facts: albert, edward7, alfred, george5, and charles are men
man(albert).
man(edward7).
man(alfred).
man(george5).
man(edward8).
man(george6).
man(phillip).
man(charles).
man(edward9).
man(william).
man(henry).

% facts
woman(victoria).
woman(victoria_a).
woman(alice).
woman(mary).
woman(elizabeth).
woman(elizabeth2).
woman(margaret).
woman(diana).

% facts
parent(albert, edward7).
parent(victoria_a, edward7).
parent(albert, victoria_a).
parent(victoria_a, victoria_a).
parent(albert, alfred).
parent(victoria, alfred).
parent(mary, george5).
parent(alfred, george5).
parent(george5, george6).
parent(mary, george6).
parent(george5, edward8).
parent(mary, edward8).
parent(george6, elizabeth2).
parent(elizabeth, elizabeth2).
parent(george6, margaret).
parent(elizabeth, margaret).
parent(elizabeth2, charles).
parent(phillip, charles).
parent(elizabeth2, edward9).
parent(phillip, edward9).
parent(albert, paul).
parent(victoria, paul).
parent(george5, adam).
parent(alice, adam).
parent(charles, william).
parent(diana, william).
parent(charles, henry).
parent(diana, henry).
parent(charles, victoria).
parent(dolores, victoria).

% F is the father of C if F is a man and F is the parent of C
father(F, C) :- man(F), parent(F, C).

% M is the mother of C if M is a woman and M is the parent of C
mother(M, C) :- woman(M), parent(M, C).

% S is the son of P if S is a man and P is the parent of S
son(S, P) :- man(S), parent(P, S).

% D is the daughter of P if D is a woman and P is the parent of D
daughter(D, P) :- woman(D), parent(P, D).

% A and B are siblings if they are distinct and have a parent in common
siblings(A, B) :- parent(P, A), parent(P, B), A \= B.

% U is the uncle of N if U is a man, U has a sibling P, and P is the
% parent of N
uncle(U, N) :- man(U), siblings(U, P), parent(P, N).

% A is the aunt of N if A is a woman, A has a sibling P, and P is the
% parent of N
aunt(A, N) :- woman(A), siblings(A, P), parent(P, N).

% H is human if H is a man or a woman
human(H) :- man(H).
human(H) :- woman(H).

% D is a descendent of A if A is a parent of D or if there is a person
% P such that P is a parent of D and P is a descendent of A
descendent(D, A) :- parent(A, D).
descendent(D, A) :- parent(P, D), descendent(P, A).

% A is an ancestor of D if D is a descendent of A
ancestor(A, D) :- descendent(D, A).
