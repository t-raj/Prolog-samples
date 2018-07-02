% A farmer must bring a wolf, a goat, and a cabbage across a river.
% His boat only has room to take one at a time.
% How can he bring all three across the river without the goat eating the cabbage or the wolf eating the goat?

%state changes. 
%The farmer, wolf, goat, and cabbage are each represented by a character
%n if they're on the north side of the river
%s if they're on the south side
%If location isn't specified for the state change, W, G, and C are used for wolf, goat, and cabbage
%The farmer's state is always sepcified since he moves every time
%Each state change takes in 8 arguments: 
%the starting and ending states of the farmer, wolf, goat, and cabbage
change_state(s,W,G,C,n,W,G,C).
change_state(n,W,G,C,s,W,G,C).
change_state(s,s,G,C,n,n,G,C).
change_state(n,n,G,C,s,s,G,C).
change_state(s,W,s,C,n,W,n,C).
change_state(n,W,n,C,s,W,s,C).
change_state(s,W,G,s,n,W,G,n).
change_state(n,W,G,n,s,W,G,s).

%illegal combinations of states
%goat cannot be on same side as wolf or cabbage
%blanks are used when the state is illegal regardless of that variable's value
illegal(s,n,n,_).
illegal(n,s,s,_).
illegal(s,_,n,n).
illegal(n,_,s,s).



% Solves for the stepwise path 
% from all 4 being on the north side to all 4 being on the south side.
% Outputs a list of steps.
% Each step consists of the locations of all 4
%use "?- solve([(n,n,n,n)],L)." to get the path with states

solve([(s,s,s,s)|L],Path) :- reverse([(s,s,s,s)|L],Path).
solve([(B,W,G,C)|L],Path) :-
    change_state(B,W,G,C,B1,W1,G1,C1),
    \+ illegal(B1,W1,G1,C1),
    \+ member((B1,W1,G1,C1),L),
    solve([(B1,W1,G1,C1),(B,W,G,C)|L],Path).
