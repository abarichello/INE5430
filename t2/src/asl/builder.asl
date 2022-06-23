// Beliefs
necessario(1).

// a resource has been dropped at site so build site further
// using that resource
//@pnr[breakpoint]
+new_resource(R,ID) : necessario(R)
   <- build_using(R,ID).

// a resource is not needed any more, inform collectors
// to search for another resource
+enough(R): true
   <- -necessario(R);
      +necessario(R+1);
      .broadcast(achieve, search_for(R+1)).

// just tell collectors that I finished the building
+recursos_coletados: true
   <- .broadcast(tell,recursos_coletados).
