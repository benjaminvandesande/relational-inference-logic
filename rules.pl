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
