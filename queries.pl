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
% === spouse/2 =====================================



