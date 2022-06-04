% Sistema especialista para recomendação de motores gráficos de jogos
% Artur Barichello e Bernardo Schmidt Farias

genre(fps).
genre(rpg).
genre(three_dimensional).
genre(two_dimensional).
genre(indie).
genre(multiplayer).
genre(singleplayer).
genre(battle_royale).

experience(beginner).
experience(intermediate).
experience(advanced).

licensing(open_source).
licensing(closed_source).
licensing(paid_source).

language(c).
language(cpp).
language(csharp).
language(lua).
language(python).
language(gdscript).

% godot
engine(gd, G, E, LI, LE) :-
    (G = indie; G = singleplayer; G = multiplayer; G = two_dimensional; G = rpg),
    (E = beginner; E = intermediate),
    (LI = open_source),
    (LE = gdscript; LE = cpp; LE = csharp),
    !.

% unity
engine(un, G, E, LI, LE) :-
    (G = fps; G = three_dimensional; G = multiplayer; G = singleplayer; G = battle_royale),
    (E = beginner; E = intermediate; E = advanced),
    (LI = closed_source; LI = paid_source),
    (LE = csharp),
    !.

% unreal
engine(ur, G, E, LI, LE) :-
    (G = fps; G = rpg; G = three_dimensional; G = multiplayer; G = battle_royale),
    (E = intermediate; E = advanced),
    (LI = open_source),
    (LE = cpp),
    !.

% blender
engine(bd, G, E, LI, LE) :-
    (G = indie; G = singleplayer; G = three_dimensional),
    (E = beginner; E = intermediate),
    (LI = open_source),
    (LE = c; LE = cpp; LE = python),
    !.

% Cry Engine
engine(ce, G, E, LI, LE) :-
    (G = fps; G = three_dimensional; G = battle_royale),
    (E = beginner; E = intermediate; E = advanced),
    (LI = open_source),
    (LE = lua; LE = cpp; LE = csharp),
    !.

% source
engine(sr, G, E, LI, LE) :-
    (G = fps; G = three_dimensional; G = battle_royale; G = multiplayer; G = indie),
    (E = beginner; E = intermediate; E = advanced),
    (LI = closed_source; LI = paid_source),
    (LE = lua; LE = cpp; LE = python),
    !.

% Panda 3D
engine(pd, G, E, LI, LE) :-
    (G = fps; G = three_dimensional; G = rpg; G = singleplayer; G = indie),
    (E = beginner; E = intermediate),
    (LI = open_source),
    (LE = python; LE = cpp),
    !.

name(gd, "Godot Engine").
name(un, "Unity").
name(ur, "Unreal Engine").
name(bd, "Blender Game Engine").
name(cr, "CryEngine").
name(sr, "Source Engine").
name(pd, "Panda3D").

formatList(A, L) :- atomics_to_string(L, ", ", A).
listGenres(A) :- findall(S, genre(S), L), formatList(A, L).
listExperiences(A) :- findall(S, experience(S), L), formatList(A, L).
listLicenses(A) :- findall(S, licensing(S), L), formatList(A, L).
listLanguages(A) :- findall(S, language(S), L), formatList(A, L).

ask(A) :-
    writeln("Este programa lhe auxiliará a escolher um motor gráfico para seu próximo jogo"),
    listGenres(GENRE_LIST), format("Qual o gênero de jogo você quer desenvolver? Possibilidades: [~w]. Answ=", GENRE_LIST), read(G),
    listExperiences(EXP_LIST), format("Qual sua experiência desenvolvendo jogos? Possibilidades: [~w]. Answ=", EXP_LIST), read(E),
    listLicenses(LCN_LIST), format("Qual o modo de licença desejado?. Possibilidades: [~w]. Answ=", LCN_LIST), read(LI),
    listLanguages(LNG_LIST), format("Quais linguagens de programação você prefere? Possibilidades: [~w]. Answ=", LNG_LIST), read(LE),
    engine(N, G, E, LI, LE), name(N, A).
