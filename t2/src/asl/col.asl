pos(boss,15,15).
checking_cells.
resource_needed(1).

// Informa os outros agentes que um recurso R foi found na posição X,Y
+!check_for_resources
   :  resource_needed(R) & found(R) & position(X,Y)
   <- !stop_search;
   	  .broadcast(tell,resource(X,Y,R));
      !take(R,boss);
      !continue.

// Informa os agentes que o recurso R na posição X,Y se esgotou
// atraves da remocao da mensagem enviada anteriormente
+!check_for_resources
   :  resource_needed(R) & not found(R) & position(X,Y)
   <- move_to(next_cell);
   .broadcast(untell,resource(X,Y,R)).

// Informa os agentes que foi found um recurso diferente
// do que esta sendo coletado
+!check_for_resources
   :  resource_needed(R) & found(S) & position(X,Y)
   <- .broadcast(tell,resource(X,Y,S));
   	  .wait(100);
      move_to(next_cell).

// Procedures relacionadas a mineracao e recursos
+resource(X,Y,R)
   : not position(X,Y)
   <- !go(X,Y).

+!take(R,B) : true
   <- .wait(100);
      mine(R);
      !go(B);
      drop(R).

// Procedures de movimentacao e busca de recursos
+resource_needed(R)
   : resource(X,Y,R)
   <- !go(X,Y).

+!go(X,Y) : true
   <- move_towards(X,Y).

+!stop_search : true
   <- ?position(X,Y);
      +pos(back,X,Y);
      -checking_cells.

+!continue : true
   <- !go(back);
      -pos(back,X,Y);
      +checking_cells;
      !check_for_resources.

+!go(Position)
   :  pos(Position,X,Y) & position(X,Y)
   <- true.

+!go(Position) : true
   <- ?pos(Position,X,Y);
      .wait(100);
      move_towards(X,Y);
      !go(Position).

+position(X,Y)
   :  checking_cells & not building_finished
   <- !check_for_resources.

@psf[atomic]
+!search_for(NewResource) : resource_needed(OldResource)
   <- +resource_needed(NewResource);
      -resource(_,_,OldResource);
      -resource_needed(OldResource).

@pbf[atomic]
+building_finished : true
   <- .drop_all_desires;
      !go(boss).
