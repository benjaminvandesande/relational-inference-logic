/* 
    Inference Test Layer — queries.pl
    ----------------------------------
    This file defines conversational smoke tests for the core relational
    inference rules for the Prolog-based family relationship inference engine.

    -- Purpose -- 
    - Validate each logical rule immediately after definition
    - Confirm rule behavior matches expected relationships

    Notes:
    - Organize queries by rule section for clarity and traceability.
    - Run after facts.pl and rules.pl are both loaded in.

    Author: Benjamin van de Sande
    Created: 2025-04-22
    Updated: 2025-05-17
*/

% === father/2 =====================================
testF1 :- father(phillip, cindy).     % true
testF2 :- father(mia, julia).         % false

% === mother/2 =====================================
testM1 :- mother(mia, louise).        % true
testM2 :- mother(mia, daniel).        % false

% === child/2 ======================================
testC1 :- child(trent, maxwell).      % true
testC2 :- child(cindy, brandy).       % false

% === sibling/2 ====================================
testS1 :- sibling(cindy, julia).      % true
testS2 :- sibling(phillip,trent).     % false

% === brother/2 ====================================
testB1 :- brother(david, brandy).     % true
testB2 :- brother(brandy, david).     % false

% === sister/2 =====================================
testSi1 :- sister(brandy, trent).     % true
testSi2 :- sister(louise, julia).     % false

% === spouse/2 =====================================
testSp1 :- spouse(maxwell, louise).   % true
testSp2 :- spouse(louise, maxwell).   % true
testSp3 :- spouse(franklin, trent).   % false

% === aunt/2 =======================================
testA1 :- aunt(louise, cindy).        % true, blood
testA2 :- aunt(clara, trent).         % true, spouse
testA3 :- aunt(clara, maxwell).       % false

% === uncle/2 ======================================
testU1 :- uncle(henry, cindy).        % true, blood
testU2 :- uncle(maxwell, julia).      % true, spouse
testU3 :- uncle(maxwell, phillip).    % false

% === cousin/2 =====================================
testCo1 :- cousin(julia, trent).      % true
testCo2 :- cousin(trent, julia).      % true, symmetry
testCo3 :- cousin(julia, ryan).       % false