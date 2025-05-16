/*
    facts.pl
    -------------------------
    This file defines the core relational data for the Prolog-based
    family relationship inference engine. It includes:

    - Gender: male/1, female/1
    - Birth years: born/2
    - Marriages: married/2
    - Parent-child links: parent/2

    This data is separated from logic and test rules for clarity and modularity.
    Only base facts are declared here — no derived logic.

    Author: Benjamin van de Sande
    Created: 2025-04-22
    Updated: 2025-05-15
*/

% Generation 1: 
% Franklin and Mia -> kids: elenore, louise
male(franklin).             born(franklin,1919).
female(mia).                born(mia,1927).
married(franklin,mia).

parent(franklin,elenore).   parent(mia,elenore).
parent(franklin,louise).    parent(mia,louise).

% Generation 2: Children of Franklin and Mia
% Elenore and Phillip -> kids: cindy, ryan, julia
male(phillip).              born(phillip,1940).
female(elenore).            born(elenore,1949).
married(phillip,elenore).

parent(phillip,cindy).      parent(elenore,cindy).
parent(phillip,ryan).       parent(elenore,ryan).
parent(phillip,julia).      parent(elenore,julia).

% Louise and Maxwell -> kids: trent, david, brandy
male(maxwell).              born(maxwell,1949).
female(louise).             born(louise,1954).
married(maxwell,louise).

parent(maxwell,trent).      parent(louise,trent).
parent(maxwell,david).      parent(louise,david).
parent(maxwell,brandy).     parent(louise,brandy).

% Generation 3: Children of Elenore and Phillip
% Cindy
female(cindy).              born(cindy,1976).

% Ryan
male(ryan).                 born(ryan,1980).

% Julia
female(julia).              born(julia,1982).

% Generation 3: Childrent of Louise and Maxwell
% Trent
male(trent).                born(trent,1980).

% David
male(david).               born(david,1986).

% Brandy
female(brandy).             born(brandy,1988).