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

% === grandparent/2 ================================
testGP1 :- grandparent(mia, brandy).  % true
testGP2 :- grandparent(mia, maxwell). % false

% === grandmother/2 ================================
testGM1 :- grandmother(mia, ryan).    % true
testGM2 :- grandmother(clara, david). % false

% === grandfather/2 ================================
testG1 :- grandfather(franklin, ryan). % true
testG2 :- grandfather(phillip, ryan).  % false


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

% === ancestor/2 ====================================
% Test: parent (mia and julia)
testAn1 :- ancestor(mia, julia).        % true

% Test: grandmother (mia and brandy)
testAn2 :- ancestor(mia, brandy).       % true

% Test: grandfather (franklin and ryan)
testAn3 :- ancestor(franklin, ryan).    % true

% Test: same generation (maxwell and ryan)
testAn4 :- ancestor(maxwell, ryan).     % false

% Test: child > parent (trent and david) 
testAn5 :- ancestor(trent, david).      % false

% === descendant/2 ====================================
% Test: grandchild (brandy and mia) 
testDe1 :- descendant(brandy, mia).       % true

% Test: grandchild (ryan and franklin) 
testDe2 :- descendant(ryan, franklin).    % true

% Test: siblings (david and trent)
testDe3 :- descendant(david, trent).      % false

% Test: same generation (maxwell and ryan)
testDe4 :- descendant(maxwell, ryan).     % false

% === generation/2 ====================================
% Test: same generation (franklin and mia) 
testGen1 :- generation(franklin, mia).     % true

% Test: different generations (franklin and ryan) 
testGen2 :- generation(franklin, ryan).    % false

% Test: cousin generation (trent and julia)
testGen3 :- generation(trent, julia).      % true

% Test: parent-child mismatch (phillip and cindy)
testGen4 :- generation(phillip, cindy).    % false

% === older/2 ========================================
% Test: grandfather > child (franklin and ryan)
testOld1 :- older(franklin, ryan).      % true

% Test: child > parent (cindy and phillip) 
testOld2 :- older(cindy, phillip).      % false

% Test: parent > child (maxwell and brandy)
testOld3 :- older(maxwell, brandy).     % true

% Test: same generation (julia and ryan) 
testOld4 :- older(julia, ryan).         % false