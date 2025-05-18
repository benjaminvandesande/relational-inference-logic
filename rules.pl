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

% brother(Brother, Sibling)
% X is the brother of Y if X is male and a sibling of Y
brother(X, Y) :-
    male(X),
    sibling(X, Y).

% sister(Sister, Sibling)
% X is the sister of Y if X is female and a sibling of Y
sister(X, Y) :-
    female(X),
    sibling(X, Y).

% spouse(X, Y) :- X is married to Y (symmetric)
spouse(X, Y) :- married(X, Y).
spouse(X, Y) :- married(Y, X).

% grandparent(Grandparent, Child)
% X is the grandparent of Y is X is the parent of the parent of Y
grandparent(X, Y) :-
    parent(X, P),
    parent(P, Y).

% grandmother(Grandmother, Child)
% X is female grandparent of Y
grandmother(X, Y) :-
    female(X),
    grandparent(X, Y).

% grandfather(Grandfather, Child)
% X is male grandparent of Y
grandfather(X, Y) :- 
    male(X),
    grandparent(X, Y).

% --- X is aunt of Y if ---
% 1 - By blood: X is a female and a sibling of Y's parent 
aunt(X, Y) :-
    sister(X, P),
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
    brother(X, P),
    parent(P, Y).

% 2 - By marriage: X is a male and married to the sibling of Y's parent
uncle(X, Y) :-
    male(X),
    spouse(X, S),
    sibling(S, P),
    parent(P, Y).

% cousin(Cousin1, Cousin2)
% X and Y are cousins if X's parent is a sibling of Y's parent.
cousin(X, Y) :-
    parent(P, X),
    parent(Q, Y),
    sibling(P, Q).

% ancestor(Ancestor, Descendent)
% X is an ancestor of Y if
% 1 - X is a parent of Y (base-case)
ancestor(X, Y) :- 
    parent(X, Y).

% 2 - X is a parent of someone who is an ancestor of Y (recursive case)
ancestor(X, Y) :- 
    parent(Z, Y), 
    ancestor(X, Z).

% descendant(Descendant, Ancestor)
% X is a descendant of Y if Y is an ancestor of X
descendant(X, Y) :- 
    ancestor(Y, X).
