pos(boss,15,15).
verifica_pos.
necessario(1).

// Informa os outros agentes que um recurso R foi encontrado na posição X,Y
+!procura_recurso
   :  necessario(R) & encontrado(R) & posicao(X,Y)
   <- !para_busca;
   	  .broadcast(tell,resource(X,Y,R));
      !take(R,boss);
      !continua.

// Informa os agentes que o recurso R na posição X,Y se esgotou
// atraves da remocao da mensagem enviada anteriormente
+!procura_recurso
   :  necessario(R) & not encontrado(R) & posicao(X,Y)
   <- move_to(next_cell);
   .broadcast(untell,resource(X,Y,R)).

// Informa os agentes que foi encontrado um recurso diferente
// do que esta sendo coletado
+!procura_recurso
   :  necessario(R) & encontrado(S) & posicao(X,Y)
   <- .broadcast(tell,resource(X,Y,S));
   	  .wait(100);
      move_to(next_cell).


// Procedures relacionadas a mineracao e recursos
+resource(X,Y,R)
   : not posicao(X,Y)
   <- !go(X,Y).

+!take(R,B) : true
   <- .wait(100);
      mine(R);
      !go(B);
      drop(R).


// Procedures de movimentacao e busca de recursos
+necessario(R)
   : resource(X,Y,R)
   <- !go(X,Y).

+!go(X,Y) : true
   <- move_towards(X,Y).

+!para_busca : true
   <- ?posicao(X,Y);
      +pos(back,X,Y);
      -verifica_pos.

+!continua : true
   <- !go(back);
      -pos(back,X,Y);
      +verifica_pos;
      !procura_recurso.

+!go(Position)
   :  pos(Position,X,Y) & posicao(X,Y)
   <- true.

+!go(Position) : true
   <- ?pos(Position,X,Y);
      .wait(100);
      move_towards(X,Y);
      !go(Position).

+posicao(X,Y)
   :  verifica_pos & not recursos_coletados
   <- !procura_recurso.


@psf[atomic]
+!search_for(NewResource) : necessario(OldResource)
   <- +necessario(NewResource);
      -resource(_,_,OldResource);
      -necessario(OldResource).

@pbf[atomic]
+recursos_coletados : true
   <- .drop_all_desires;
      !go(boss).
