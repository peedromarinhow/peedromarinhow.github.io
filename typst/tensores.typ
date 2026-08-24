#import "lib.typ": *
#show: HtmlPage

= Tensores

#let bu(x) = math.bold(math.upright(x))

#let bv = $bu(e)$
#let bd = $bu(epsilon)$

#let zero = $bu(0)$

#let oo = $bu(omega)$
#let pp = $bu(psi)$
#let ff = $bu(phi)$

#let OO = $bu(Omega)$
#let PP = $bu(Psi)$
#let FF = $bu(Phi)$

#let Alt = math.op("Alt")

#let tensor = math.times.o

= revisão de álgebra

No que segue, $U, V, W$, etc denotam espaços vetoriais de dimensão finita sobre o corpo dos reais.

== transformações lineares e isomorfismos

#def(caption: [transformações lineares])[
  Uma _transformação linear_ é uma função linear entre espaços vetoriais.
]

Mais explicitamente, se $uu, vv in V$ e $a, b in RR$ então
$ F : V -> W " é uma trans. lin. " <==> " "
  F(a uu + b vv) = a F(uu) + b F(vv). $

O conjunto das transformações lineares entre $V$ e $W$ é denotado por $L(V, W)$.

Se $F, G in L(V, W)$, podemos definir a sua soma como
$ [F + G](vv) eq.delta F(vv) + G(vv) $
e o produto de uma transformação linear por um número real $a$ como
$ [a F](vv) eq.delta a F(vv). $
Facilmente se verifica que essas operações fazem do conjunto $L(V, W)$ um espaço vetorial.

#lem[
  Se $F : V -> W$ é uma transformação linear, então $F(zero) = zero$.
]
#pro[
  Sendo $vv in V$ qualquer, temos que $zero = vv - vv$. Como $F$ é linear, temos que $F(bu(0)) = F(vv - vv) = F(vv) - F(vv) = zero$
]

Ocorre que se $F(zero) != zero$, automaticamente $F$ não é uma transformação linear.

#exm[
  A função que leva um vetor $vv in V$ qualquer no vetor nulo de algum outro espaço $W$ (ou o próprio $V$) é uma transformação linear.
]

De fato, a função do exemplo acima é chamada de _transformação linear nula_ e também é denotada pelo símbolo $zero$. Ela é o elemento neutro da soma no espaço vetorial $L(V, W)$.

#exm[
  A função identidade definida num espaço vetorial qualquer é uma transformação linear e pertence à $L(V, V)$
]

#lem[
  Se $F : V -> W$ é uma transformação linear, então $F$ é injetiva se e somente se $F(vv) = zero$ implica que $vv = zero$.
]
#pro[
  Em primeiro lugar, se $F$ é injetiva  e $vv != zero$, então $F(vv) != F(zero) = 0$ donde $F(vv) != 0$.
  
  Em segundo lugar, se $F(vv) = 0$ implica que $vv = 0$, então $F(uu - ww) = F(uu) - F(ww) = zero$ implica que $uu - ww = zero$, donde $uu = ww$
]

#def(caption: [isomorfismo])[
  Um _isomorfismo_ é uma transformação linear entre espaços vetoriais que é também uma bijeção.
]

Dito de outra maneira, $I : V -> W$ é um isomorfismo  se $I$ satisfaz as condições a seguir:
+ $I(vv) = zero$ implica que $vv = 0$ e
+ para todo $ww in W$ existe $vv in V$ tal que $I(vv) = ww$.
Bem entendido, pelo lema 1, a primeira condição exige que $I$ seja injetiva e, pelo lema 2, a segunda condição exige que $I$ seja sobrejetiva.

#teo[
  Se $I$ é um isomorfismo entre $V$ e $W$ e ${bv_1, bv_2, ..., bv_n}$ é uma base de $V$, então ${I(bv_1), I(bv_2), ..., I(bv_n)}$ é uma base de $W$.
]
pro[
  Em primeiro lugar, pondo $ff_i = I(bv_i)$, temos que o conjunto ${ff_1, ff_2, ..., ff_n}$ é linearmente independente, porque
  $ a_1 ff_1 + a_2 ff_2 + ... + a_n ff_n
  &= a_1 I(bv_1) + a_2 I(bv_2) + ... + a_n I(bv_n) \
  &= I(a_1 bv_1 + a_2 bv_2 + ... a_n bv_n) $
  donde
  $ a_1 ff_1 + a_2 ff_2 + ... + a_n ff_n = zero " implica "
    I(a_1 bv_1 + a_2 bv_2 + ... + a_n bv_n) = zero $
  o que só ocorre se
  $ a_1 bv_1 + a_2 bv_2 + ... + a_n bv_n = zero $
  que por sua vez só ocorre se $a_1 = a_2 = ... = a_n = 0$ já que ${bv_1, bv_2, ..., bv_n}$ é uma base.

  Em segundo lugar, dado $ww in W$ qualquer, como $I$ é sobrejetiva existe $vv in V$ tal que $ww = I(vv)$. Escrevendo
  $ vv = v_1 bv_1 + v_2 bv_2 + ... + v_n bv_n $
  temos que
  $ ww
  &= I(vv) \
  &= I(v_1 bv_1 + v_2 bv_2 + ... + v_n bv_n) \
  &= v_1 I(bv_1) + v_2 I(bv_2) + ... + v_n I(bv_n) \
  &= v_1 ff_1 + v_2 ff_2 + ... + v_n ff_n $
  e portanto um $ww$ qualquer pode ser escrito como combinação linear dos ${ff_1, ff_2, ..., ff_n}$
]
 
== formas lineares, bilineares e $k$-lineares

#def(caption: [forma linear])[
  Uma _forma linear_ é uma função linear de um argumento em $V$ tomando valores em $RR$.
]

Mais explicitamente, se $uu, vv in V$ e $a, b in RR$, então
$ oo " é uma forma linear " <==> " "
  oo (a uu + b vv) = a oo (uu) + b oo (vv). $
O conjunto de todas as formas lineares num espaço $V$ é denotado por $L^1(V)$.
  
Podemos definir a soma de duas formas lineares $pp$ e $oo$ como
$ [pp + oo](vv) eq.delta pp(vv) + oo(vv) $
e o produto de uma forma linear por um número real $a$ como
$ [a oo](vv) eq.delta a oo (vv). $
Facilmente se verifica que com as operações definidas acima o conjunto $L^1(V)$ se torna um espaço vetorial.

#exm[
  Em $RR^3$, as funções $f(x, y, z)$ e $g(x, y, z)$ definidas por
  $ f (x, y, z) = 2x - y + z " e "
    g (x, y, z) = 2y - z $
  são formas lineares  
]

#exm[
  Fixando $bu(a) in RR^n$ temos que a função $[bu(a)^flat]$ definida por
  $ [bu(a)^flat](vv) = bu(a) dot vv $
  onde $bu(a) dot vv$ é o produto escalar entre $bu(a)$ e $vv$, é uma forma linear
]

#def(caption: [forma bilinear])[
  Uma _forma bilinear_ é uma função de dois argumentos em $V$ que é linear em cada um deles, tomando valores em $RR$.
]

Mais explicitamente, se $a, b in RR$ e $uu, vv, ww in V$, então
#{
  set math.cases(gap: 0.5em)
  set math.vec(delim: none, gap: 0.5em)
  $ OO " é uma forma bilinear " <==> " "
    vec(
      OO(a uu + b vv, ww) = a OO(uu, ww) + b OO(vv, ww),
      " e também ",
      OO(vv, a uu + b ww) = a OO(vv, uu) + b OO(vv, ww)
    ) $
}
O conjunto de todas as formas bilineares num espaço $V$ é denotado por $L^2(V)$.
  
Podemos definir a soma de duas formas bilineares $PP$ e $OO$ como
$ [PP + OO](uu, vv) eq.delta
  PP(uu, vv) + OO(uu, vv) $
e o produto de uma forma bilinear por um número real $a$ como
$ [a OO](uu, vv) eq.delta a OO(uu, vv). $
Facilmente se verifica que com as operações definidas acima o conjunto $L^2(V)$ se torna um espaço vetorial.

#exm[
  Dadas duas formas lineares $pp$ e $oo$, a função $OO(uu, vv)$ definida por
  $ OO(uu, vv) = pp(uu) dot oo(vv) $
  é uma forma bilinear 
]

#exm[
  Considerando $V$ um espaço com produto interno $uu dot vv$, temos que a função $OO(uu, vv)$ definida por
  $ OO(uu, vv) = uu dot vv $
  é uma forma bilinear 
]

#def(caption: [forma $k$-linear])[
  Uma _forma $k$-linear_ é uma função de $k$ argumentos em $V$ que é linear em cada um deles, tomando valores em $RR$.
]

Mais explicitamente, se $a, b in RR$ e $ww, vv_1, vv_2, ..., vv_k in V$, então $bu(A)$ é uma forma $k$-linear se e somente se
$
bu(A) (a vv_1 + b ww, vv_2, ..., vv_k) &=
  a bu(A)(vv_1, vv_2, ..., vv_k) +
  b bu(A)(ww,   vv_2, ..., vv_k) \
bu(A) (vv_1, a vv_2 + b ww, ..., vv_k) &=
  a bu(A)(vv_1, vv_2, ..., vv_k) +
  b bu(A)(vv_1, ww, ...,   vv_k) \
dots.v " " &= " " dots.v \
bu(A) (vv_1, vv_2, ..., a vv_k + b ww) &=
  a bu(A)(vv_1, vv_2, ..., vv_k) +
  b bu(A)(vv_1, vv_2, ..., ww). $
O conjunto de todas as formas bilineares num espaço $V$ é denotado por $L^k (V)$.

Podemos definir a soma de duas formas $k$-lineares $bu(A)$ e $bu(B)$ como
$ [bu(A) + bu(B)] (vv_1, ..., vv_k) eq.delta
    bu(A) (vv_1, ..., vv_k) +
    bu(B) (vv_1, ..., vv_k) $
e o produto de uma forma $k$-linear por um número real $a$ como
$ [a bu(A)] (vv_1, ..., vv_k) eq.delta a bu(A) (vv_1, ..., vv_k). $
Facilmente se verifica que com as operações definidas acima o espaço $L^k (V)$ se torna um espaço vetorial.

Bem entendido, formas lineares e formas bilineares são casos especiais de formas $k$-lineares. Em particular, pode-se chamar uma forma linear de forma $1$-linear e uma forma bilinear de forma $2$-linear.

== o espaço dual

O espaço vetorial $L^1(V)$ recebe o nome especial de _espaço dual de $V$_ e é denotado por $V^star$.

O motivo dessa terminologia é o fato de que existe uma relação simétrica entre um espaço $V$ e seu dual $V^star$. Do mesmo modo que um elemento $oo in V^star$ é uma função linear de $V$ em $RR$, podemos pensar em um elemento $vv in V$ como uma função linear de $V^star$ em $RR$ definida por
$ vv(omega) eq.delta oo(vv). $
A ação de aplicar um covetor a um vetor ou vice-versa é chamada de _contração entre $vv$ e $oo$_, é às vezes denotada por $chevron.l oo, vv chevron.r$.

Ocorre que se $a, b in RR$ e $pp, oo in V^star$, então
$ vv(a pp + b oo) = a vv(pp) + b vv(oo) $
donde $vv$ é uma função linear de covetores.

Dada uma base ortonormal ${bv_1, bv_2, ..., bv_n}$ de $V$, existe uma maneira natural de associar a ela uma base para $V^star$, chamada de _base dual_. Dado $vv in V$, escrevemos
$ vv = v_1 bv_1 + v_2 bv_2 + ... + v_n bv_n. $
Então definimos $bd_i in V^star$ tais que
$ bd_i (vv) eq.delta v_i. $
Ocorre que o conjunto ${bd_1, bd_2, ..., bd_n}$ é a base dual. Temos ainda que $bd_i (bv_j)$ vale $1$ caso $i = j$ e vale $0$ caso contrário (isso só ocorre quando a base de $V$ é ortonormal).

No que segue, usaremos ${bv_1, bv_2, ..., bv_n}$ para denotar uma base ortonormal de $V$ e ${bd_1, bd_2, ..., bd_n}$ para denotar a base dual correspondente de $V^star$.

// #exm[
//   Em $RR^3$ sejam novamente
//   $ f (x, y, z) = 2x - y + z " e "
//     g (x, y, z) = 2y - z. $
//   Sendo $xx, yy, zz$ uma base de $RR^3$, pondo $vv = x xx + y yy + z zz$ temos que
//   $ x =  $
//   $ ff(vv)        &= 2 bd_1(vv) - 1 bd_2(vv) + bd(3)(vv) " e " \
//     bu(gamma)(vv) &= 0 bd_1(vv) + 2 bd_2(vv) - bd(3)(vv). $
  // as funções $f(x, y, z)$ e $g(x, y, z)$ definidas por
  // são formas lineares. Com efeito, essas formas pertencem a $cal(L)^1 (RR^3)$ 
// ]

== tensores

Vetores e formas $k$-lineares são casos especiais de _tensores_, que vamos definir agora.

#def(caption: [tensores])[
  Um _tensor_ de valência $(frak(f), frak(v))$ é uma função multilinear
  $ bu(H) :
      underbrace(V^star times ... times V^star, frak(f) "vezes")
    times
      underbrace(V times ... times V, frak(v) "vezes") -> RR $
  que recebe $frak(f)$ covetores e $frak(v)$ vetores e retorna um número real.
]

Bem entendido, um vetor é nada menos do que um tensor de valência $(1, 0)$, e um covetor é nada menos do que um tensor de valência $(0, 1)$.

Ocorre que uma transformação linear $bu(M)$ de $V$ em $V$ é um tensor de valência $(1, 1)$. Para ver porque, basta observar que se $vv in V$ então a aplicação de $bu(M)$ a $vv$ produz como resultado um vetor $bu(M) vv$. Podemos então reinterpretar $bu(M)$ como uma função $bu(M) : V^star times V -> RR$ definida por
$ bu(M) (oo, vv) = [bu(M) vv](oo). $
Nesse sentido, tensores generalizam os vetores, covetores, transformações lineares, e vários outros objetos. Consideramos ainda que escalares são tensores de valência $(0, 0)$.

O conjunto de todos os tensores de valência $(frak(f), frak(v))$ sobre um espaço vetorial $V$ é denotado por $T_frak(f)^frak(v) (V)$. Em particular, $L^k (V) = T_0^k (V)$.

O lema a seguir prova formalmente que os conjuntos $L^K (V)$ que vimos anteriormente de fato são espaços vetoriais.

 Podemos definir a soma de dois tensores $bu(G), bu(H) in T_frak(f)^frak(v) (V)$ por
$ [bu(G) + bu(H)](bu(omega_1), ...., bu(v_1), ...) = 
    bu(G)(bu(omega_1), ...., bu(v_1), ...) +
    bu(H)(bu(omega_1), ...., bu(v_1), ...) $
e o produto de um tensor $bu(H)$ por um número real $a$ por
$ [a bu(H)](bu(omega_1), ...., bu(v_1), ...) =
    a bu(H) (bu(omega_1), ...., bu(v_1), ...). $
Facilmente se verifica que com as operações definidas acima o espaço $T_frak(f)^frak(v) (V)$ se torna um espaço vetorial.
    
Além dessas operações, podemos definir um produto entre tensores. Comecemos definindo como esse produto é feito entre dois covetores.
#def(caption: [produto tensorial de covetores])[
  Se $pp$ e $oo$ são covetores, definimos o _produto tensorial_ de $pp$ por $oo$ como um tensor de valência $(0, 2)$ definido por
  $ [pp tensor oo](uu, vv) eq.delta
      pp(uu) oo(vv). $
]
Nota-se que em geral a ordem importa, uma vez que em
$ [pp tensor oo](uu, vv) $
o covetor $pp$ recebe o vetor $uu$ como argumento, ao passo que em
$ [oo tensor pp](uu, vv) $
é o covetor $oo$ que recebe $uu$ como argumento.

De modo geral, definimos o produto tensorial de dois tensores como segue.

#def(caption: [produto tensorial de dois tensores])[
  Se $bu(G)$ é um tensor de valência $(frak(f)_1, frak(v)_1)$ e $bu(H)$ é um tensor de valência $(frak(f)_2, frak(v)_2)$, definimos o _produto tensorial_ de $bu(G)$ por $bu(H)$ como um tensor de valência $(frak(f)_1 + frak(f)_2, frak(v)_1 + frak(v)_2)$ definido por
  $ [bu(G) tensor bu(H)](
      oo_1, ..., oo_(frak(f)_1 + frak(f)_2),
      vv_1, ..., vv_(frak(v)_1 + frak(v)_2)
    ) eq.delta \
    bu(G)(
      oo_1, ..., oo_(frak(f)_1),
      vv_1, ..., vv_(frak(v)_1)
    ) bu(H)(
      oo_(frak(f)_1 + 1), ..., oo_(frak(f)_1 + frak(f)_2),
      vv_(frak(v)_1 + 1), ..., vv_(frak(v)_1 + frak(v)_2)
    ) $
]

Ocorre que na definição acima, o produto de um tensor por um escalar, que é um tensor de valência $(0, 0)$, se dá exatamente da maneira como foi definida anteriormente.

== componentes

Comecemos discutindo primeiro os componentes de 1-formas e 2-formas lineares.

Sejam $oo$ uma 1-forma linear e $vv$ um vetor arbitrários. A aplicação de $oo$ a $vv$ nos fornece
$ oo(vv) &= oo(v_1 bv_1 + ... + v_n bv_n) \
         &= v_1 oo(bv_1) + ... + v_n oo(bv_n) \
         // &= bd_1(vv) oo(bv_1) + ... + bd_n (vv) oo(bv_1) \
         &= omega_1 bd_1(vv) + ... + omega_n bd_n (vv) $
fazendo dos números $omega_i = oo(bv_i)$ os _componentes_ de $oo$. Desse modo, podemos escrever $oo$ como
$ oo = sum omega_i bd_i. $

Seja $OO$ uma 2-forma linear e $uu, vv$ vetores arbitrários. A aplicação de $OO$ a $uu$ e $vv$ nos fornece
$ OO(uu, vv) &= OO(sum bv_i u_i, sum bv_j v_j) \
             &= sum_i sum_j OO(bv_i, bv_j) u_i v_j \
             &= sum_i sum_j OO(bv_i, bv_j) bd_i (uu) bd_j (vv) \
             &= sum_i sum_j Omega_(i j) [bd_i tensor bd_j] (uu, vv) $
fazendo dos números $Omega_(i j) = OO(bv_i, bv_j)$ os _componentes_ de $OO$. Desse modo, podemos escrever $OO$ como
$ OO = sum_i sum_j Omega_(i j) bd_i tensor bd_j $

Similarmente, um tensor $bu(A)$ de valência $(2, 0)$ pode ser escrito como
$ bu(A) = sum_i sum_j A^(i j) bv_i tensor bv_j. $

De modo geral, se $bu(H)$ é um tensor de valência $(frak(f)_1, frak(v)_1)$, temos que os componentes de $bu(H)$ são dados por
$ H_(a b c ...)^(i j k ...)
= bu(H)(bd_a, bd_b, bd_c, ..., bv_i, bv_j, bv_k, ...). $

Ocorre que os tensores do tipo
$ lr((bd_i_1 tensor bd_i_2 tensor ... tensor bd_i_frak(f)), size: #50%) tensor
  lr((bv_j_1 tensor bv_j_2 tensor ... tensor bv_j_frak(v)), size: #50%) $
formam uma base para o espaço dos tensores de valência $(frak(f), frak(v))$.

== formas alternadas

Vimos que as formas $k$-lineares são nada mais nada menos do que tensores de valência $(0, k)$. De interesse especial para nós são um caso especial desses tensores que veremos agora.

#def(caption: [formas alternadas])[
  Seja $bu(H)(vv_1, vv_2, ..., vv_k)$ uma forma $k$-linear, ou seja, um tensor de valência $(0, k)$. Dizemos que essa forma é _alternada_ se acontece que trocar dois dos argumentos de lugar faz com que a forma troque de sinal.
]

Para fixar as ideias, se $oo$ é uma forma bilinear e $uu, vv in V$, então
$ oo " é alternada " <==> " "
  oo(uu, vv) = - oo(vv, uu). $
Temos que
$ oo(vv, vv) = - oo(vv, vv)
" donde " oo(vv, vv) = 0 $
já que o único número que é igual ao oposto de si mesmo é o zero.

Em geral, se $vv_1, vv_2, ..., vv_k in V$, $sigma$ é uma permutação dos elementos ${1, 2, ..., k}$, e $bu(A)$ é uma forma $k$-linear, então $bu(A)$ é alternada se e somente se
$ bu(A)(vv_1, vv_2, ..., vv_k) eq
  ("sgn" sigma) dot bu(A)(vv_sigma(1), vv_sigma(2), ..., vv_sigma(k)). $
Ocorre que se dentre os argumentos de uma forma alternada há vetores repetidos, o valor da forma aplicada à esses vetores é zero.

O conjunto de todas as formas $k$-alternadas sobre $V$ é denotado por $Alt^k (V)$, e é um subespaço de $L^k (V)$.

// Sabemos que um conjunto qualquer ${vv_1, vv_2, ..., vv_(n+1)} subset V$ com mais de $n$ vetores (onde $n = dim V$) não pode ser linearmente independente. Disso segue que um dos vetores desse conjunto, pode ser escrito como combinação linear dos demais. Podemos então, sem perca de generalidade, assumir que esse vetor é o $vv_(n + 1)$, e escrever
// $ vv_(n + 1) = c_1 vv_1 + c_2 vv_2 + ... c_n vv_n. $
// Daí, se $bu(A)$ é uma forma $(n + 1)$-linear alternada, ocorre que
// #block(breakable: false, width: 100%)[
//   #align(center)[
//     #grid(
//       columns: 4,
//       column-gutter: 0.2em,
//       row-gutter: 1em,
//       $bu(A) (vv_1, vv_2,..., vv_(n+1))$, $=$,
//       $c_1$, $bu(A) (vv_1, vv_2,..., vv_n, vv_1)$,
//       [], $+$,
//       $c_2$, $bu(A) (vv_1, vv_2,..., vv_n, vv_2)$,
//       [], $+$, [], $...$,
//       [], $+$,
//       $c_n$, $bu(A) (vv_1, vv_2,..., vv_n, vv_n)$,
//     )
//   ]
// ]
// mas como $A$ é alternada, ocorre que
// $ bu(A) (vv_1, vv_2,..., vv_n, vv_1)   &=
//   bu(A) (vv_1, vv_2,..., vv_n, vv_2) \ &= ... \ &=
//   bu(A) (vv_1, vv_2,..., vv_n, vv_n) = 0 $
// porque sempre há um argumento repetido. Segue-se que qualquer forma $(n + 1)$-linear alternada é identicamente nula. Dizemos então que $Alt^k (V^star) = {0}$ se $k > dim V$.

Se $V$ é um espaço de dimensão $n$, ocorre que os espaços $Alt^k (V)$ têm cada um dimensão $C_n^k$ ($n$ escolha $k$).

#exm[
  Sejam $uu, vv, ww in RR^3$ e $bu(A)(uu, vv, ww)$ definida como
  $ bu(A)(uu, vv, ww) = det [uu|vv|ww] $
  ou seja, $bu(A)$ é o determinante da matriz cujas colunas são $uu, vv$ e $ww$. Ocorre que $bu(A)$ é linear, e trocar dois dos argumentos da $bu(A)$ significa trocar duas colunas da matriz $[uu|vv|ww]$, o que troca o sinal do seu determinante. Daí, segue-se que $bu(A)$ é uma forma 3-linear alternada 
]

#exm[
  Em $RR^2$ seja $bu(A)(uu, vv)$ definida por
  $ bu(A)(uu, vv) eq.delta
    " área orientada do paralelogramo com lados " uu " e " vv. $
  Então $bu(A)$ é uma forma bilinear alternada 
]

No que segue, vamos nos referir às formas $k$-lineares alternadas, ou seja, aos tensores de valência $(0, k)$ simplesmente por _$k$-formas_.

== o produto exterior

Comecemos definindo o produto exterior de duas 1-formas.

#def(caption: [produto exterior de covetores])[
  O produto exterior de duas 1-formas $pp$ e $oo$ é uma $2$-forma definida por
  $ pp and oo eq.delta
      pp tensor oo - oo tensor pp. $
]

Para ver que $pp and oo$ de fato é uma 2-forma, basta observar que
$ [pp and oo](uu, vv) &=   pp(uu) oo(vv) - oo(uu) pp(vv) \
                      &= -[pp(vv) oo(uu) - oo(vv) pp(uu)]
                      = - [pp and oo](vv, uu) $
ou seja, trocar a ordem dos argumentos de fato troca o sinal da forma.

Na expressão acima, observemos também que
$ [pp and oo](uu, vv) &=   pp(uu) oo(vv) - oo(uu) pp(vv) \
                      &= -[oo(uu) pp(vv) - pp(uu) oo(vv)]
                      = - [oo and pp](uu, vv) $
ou seja, trocar a ordem de $pp$ e $oo$ também troca o sinal da forma. Temos então que
$ pp and oo = - oo and pp " e " pp and pp = 0 $
o que são características fundamentais do produto exterior de duas 1-formas. Além disso, o produto exterior é distributivo sobre a soma, ou seja
$ ff and (pp + oo) = ff and pp + ff and oo. $

Passemos ao caso mais geral.

#def(caption: [produto exterior])[
  O _produto exterior_ de uma $p$-forma $bu(A)$ por uma $q$-forma $bu(B)$ é uma $(p + q)$-forma definida por
  $ [bu(A) and bu(B)](vv_1, ..., vv_(p + q)) eq.delta \
    sum_(sigma \ sigma "é permutação cíclica")
      ("sgn" sigma) dot
      bu(A) (vv_sigma(1), ..., vv_sigma(p)) dot
      bu(B) (vv_sigma(p + 1), ..., vv_sigma(p + q)). $ 
]

#exm[
  Se $PP$ é uma $2$-forma e $oo$ é uma 1-forma, então o produto exterior de $PP$ por $oo$ é
  $ [PP and oo](uu, vv, ww) =
    PP(uu, vv) oo(ww) +
    PP(vv, ww) oo(uu) +
    PP(ww, uu) oo(vv). $
  Se trocarmos a ordem de $PP$ e $oo$ no produto exterior, temos
  $ [oo and PP](uu, vv, ww) =
    oo(uu) PP(vv, ww) +
    oo(vv) PP(ww, uu) +
    oo(ww) PP(uu, vv) $
  que facilmente se verifica que é igual a $PP and oo$, ao contrário do que aconteceu quando trocamos a ordem do produto de duas 1-formas
]

Acontece que se $bu(A)$ é uma $p$-forma e $bu(B)$ é uma $q$-forma, então
$ bu(A) and bu(B) = (-1)^(p q) bu(B) and bu(A) $
donde, se $p$ é ímpar, ocorre que
$ bu(A) and bu(A) = 0. $

== orientação, a forma de volume e a estrela de hodge

Comecemos vendo o que é uma orientação num espaço vetorial de dimensão um.

#def(caption: [orientação de um espaço de dimensão um])[
  Uma _orientação_ num espaço vetorial $V$ de dimensão um é a escolha de um componente conexo do conjunto $V - {0}$.
]

Nesse contexto, a componente conexa escolhida é denotada por $V_+$ e chamada de _cone positivo_. Dizemos que um vetor $vv in V$ é _orientado positivamente_ se $vv in V_+$.

#exm[
  Seja $V subset RR^2$ a linha diagonal que corta o primeiro quadrante. Uma orientação de $V$ é uma escolha entre a semirreta que parte de zero e vai na direção de $x > 0$ e $y > 0$ e a semirreta que vai na direção de $x < 0$ e $y < 0$.
]

Ocorre que se $V$ tem dimensão $n$, então $Alt^n (V)$ tem dimensão $C_n^n = 1$. Então $Alt^n (V)$ pode ser orientado.

#def(caption: [orientação de um espaço de dimensão $n$])[
  Uma _orientação_ num espaço vetorial $V$ de dimensão $n$ é uma orientação do espaço vetorial de dimensão um $Alt^n (V)$.
]

Uma maneira importante pela qual podemos orientar um espaço $V$ com base ${bv_1, bv_2, ..., bv_n}$ é impondo que a base de $Alt^n (V)$ que é dada por
$ bd_1 and bd_2 and ... and bd_n $
pertença ao seu cone positivo, onde ${bd_1, bd_2, ..., bd_n}$ é a base dual da base de $V$.

#def(caption: [forma de volume])[
  A _forma de volume_ de um espaço vetorial $V$ com base ${bd_1, bd_2, ..., bd_n}$ é o único elemento da base de $Alt^n (V)$.
]

Denotamos a forma de volume por $bb(1)$. Temos que
$ bb(1) eq.delta bd_1 and bd_2 and ... and bd_n $
onde ${bd_1, bd_2, ..., bd_n}$ é a base dual da base de $V$.

#exm[
  Em $RR^n$, temos que a $n$-forma $bb(1)$ é tal que
  $ bb(1)(vv_1, vv_2, ..., vv_n)
  &= [bd_1 and bd_2 and ... and bd_n](vv_1, vv_2, ..., vv_n) \
  &= det[vv_1|vv_2|...|vv_n]. $
]

#def(caption: [a estrela de Hodge])[
  Se $V$ tem dimensão $n$, e
  $ bu(A) = bd_i_1 and bd_i_2 and ... and bd_i_p $
  é uma $p$-forma, então existe uma única $(n - p)$-forma
  $ bu(B) = bd_j_1 and bd_j_2 and ... and bd_j_(n - p) $
  tal que $bu(A) and bu(B) = bb(1)$. O operador que leva a $p$-forma $bu(A)$ à $(n = p)$-forma $bu(B)$ é chamado de _estrela de Hodge_, e denotado por $star$.
  Escrevemos então que
  $ bu(B) = star bu(A). $
]

Bem entendido, para cada $k$ menor do que ou igual à $n$, existe um operador diferente $star : Alt^k (V) -> Alt^(n - k) (V)$ e todos eles são denotados pelo mesmo símbolo.

Ocorre que se $bu(A)$ é uma $k$-forma, então
$ star (star bu(A)) = (-1)^(k (n - k)) bu(A). $