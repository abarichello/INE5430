# Lista 1

# https://pt.wikipedia.org/wiki/Regi%C3%A3o_Sul_do_Brasil (capítulo de introdução)

estado(parana).
estado(santa_catarina).
estado(rio_grande_do_sul).
estado(sao_paulo).
estado(mato_grosso_do_sul).

pais(brasil).
pais(uruguai).
pais(paraguai).
pais(argentina).
pais(portugal).
pais(alemanha).
pais(italia).
pais(paises_baixos).
pais(japao).

fronteira(parana, santa_catarina).
fronteira(parana, sao_paulo).
fronteira(parana, mato_grosso_do_sul).
fronteira(santa_catarina, parana).
fronteira(santa_catarina, rio_grande_do_sul).
fronteira(rio_grande_do_sul, rio_grande_do_sul).

fronteira_pais(parana, paraguai).
fronteira_pais(parana, argentina).
fronteira_pais(santa_catarina, argentina).
fronteira_pais(rio_grande_do_sul, argentina).
fronteira_pais(rio_grande_do_sul, uruguai).

clima(subtropical_umido).
clima(subtropical_oceanico).
clima(tropical_de_moncao).

clima_predominante(parana, subtropical_oceanico).
clima_predominante(santa_catarina, subtropical_oceanico).
clima_predominante(rio_grande_do_sul, subtropical_umido).

imigracao(parana, italia).
imigracao(parana, paises_baixos).
imigracao(parana, japao).
imigracao(santa_catarina, portugal).
imigracao(santa_catarina, alemanha).
imigracao(santa_catarina, italia).
imigracao(rio_grande_do_sul, italia).
imigracao(rio_grande_do_sul, portugal).
