/*
    Relational Infence Rules — rules.pl
    -------------------------
    This file defines the core relational inference rules for the Prolog-based
    family relationship inference engine. It includes:

    -- Core Inference Rules --
    - father(X,Y): male/1 + parent/2
    - mother(X,Y): female/1 + parent/2
    - child(X,Y): inverse of parent/2
    - sibling(X,Y): shared parent/2
    - spouse(X,Y): married/2 (with symmetry)

    -- Extended Kinship Rules --
    - uncle(X,Y): male/1 + sibling of parent
    - aunt(X,Y): female/1 + sibling of parent
    - cousin(X,Y): child of parent's sibling

    -- Temporal & Recursive Rules -- 
    Temporal & Recursive
    - older_than(X,Y): born/2 comparison
    - ancestor(X,Y): recursive parent/2

    Notes:
    - This file contains only derived logic, no raw facts or tests.
    - It is designed to be loaded *after* facts.pl and *before* queries.pl

    Author: Benjamin van de Sande
    Created: 2025-04-22
    Updated: 2025-05-17
*/

% father(Father, Child)
father(X, Y) :- 
    male(X),
    parent(X, Y).

% mother(Mother, Child)
mother(X, Y) :-
    female(X),
    parent(X, Y).

% child(Child, Parent).
child(X, Y) :- parent(Y, X).

% sibling(Child, Child)
sibling(X, Y) :- 
    parent(P, X),
    parent(P, Y),
    X \= Y.

% spouse(X, Y) :- X is married to Y (symmetric)
spouse(X, Y) :- married(X, Y).
spouse(X, Y) :- married(Y, X).

% --- X is aunt of Y if ---
% 1 - By blood: X is a female and a sibling of Y's parent 
aunt(X, Y) :-
    female(X),
    sibling(X, P),
    parent(P, Y).

% 2 - By marriage: X is female and married to a male who is the sibling of Y's parent
aunt(X, Y) :-
    female(X),
    spouse(X, S),
    sibling(S, P),
    parent(P, Y).

% --- X is uncle of Y if ---
% 1 - By blood: X is a male and a ssibling of Y's parent
uncle(X, Y) :-
    male(X),
    sibling(X, P),
    parent(P, Y).

% 2 - By marriage: X is a male and married to the sibling of Y's parent
uncle(X, Y) :-
    male(X),
    spouse(X, S),
    sibling(S, P),
    parent(P, Y).

