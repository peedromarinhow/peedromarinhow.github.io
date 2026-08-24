#import "lib.typ": *
#show: HtmlPage

= Notas de teoria da medida, parte 1: conceitos básicos

#def(caption: [comprimento de um intervalo])[
  O _comprimento de um intervalo_ $I subset RR$ cujas extremidades são os números $a, b in RR$ (com $a <= b$, obviamente) é definido por
  $
  abs(I) := b - a.
  $
]

Vale observar que a definição acima é válida para intervalos degenerados $I = [a, a]$ constituídos do único ponto $a$ ou vazios quando uma ou ambas as extremidades são abertas. Nesses casos, $abs(I) = 0$.

#def(caption: [caixa e volume de uma caixa])[
  Uma _caixa $n$-dimensional_ é o produto cartesiano
  $
  B = I_1 times ... times I_n
  $
  de $n$ intervalos $I_1, ..., I_n$. O _volume_ de uma caixa é definido por
  $
  abs(B) := abs(I_1) times ... times abs(I_n).
  $
]

Novamente, vale observar que a definição acima é válida quando um dos intervalos $I_1, ..., I_n$ é degenerado, e nesse caso $abs(B) = 0$. Por exemplo, a medida da caixa tri-dimensional $B = [0, 1] times [0, 1] times [0, 0]$ é zero.

#prp[
  A intersecção de duas caixas $B$ e $C$ é uma caixa.
]
#pro[
  Primeiro, é fácil ver que a intersecção de duas caixas $1$-dimensionais, ou seja, de dois intervalos, é um intervalo (possivelmente vazio).

  Para o caso $n$-dimensional, começamos escrevendo
  $
  B = I_1 times ... I_n
  #text(font: "Libertinus Sans", " e ")
  C = J_1 times ... times J_n
  $
  Temos que um ponto $xx$ de $RR^n$ pertence a $B inter C$ se e só se $xx in B$ e $xx in C$. Vejamos em detalhes o que significa $xx$ pertencer a uma caixa. Escrevendo $xx$ em coordenadas como $(x_1, ..., x_n)$, temos que
  $
  xx in B
  #text(font: "Libertinus Sans", " se e só se ")
  x_1 in I_1
  #text(font: "Libertinus Sans", " e ")
  ...
  #text(font: "Libertinus Sans", " e ")
  x_n in I_n.
  $
  e similarmente
  $
  xx in C
  #text(font: "Libertinus Sans", " se e só se ")
  x_1 in J_1
  #text(font: "Libertinus Sans", " e ")
  ...
  #text(font: "Libertinus Sans", " e ")
  x_n in J_n.
  $
  Sendo assim,
  $
  xx in B inter C
  #text(font: "Libertinus Sans", " se e só se ")
  x_1 in I_1 inter J_1
  #text(font: "Libertinus Sans", " e ")
  ...
  #text(font: "Libertinus Sans", " e ")
  x_n in I_n inter J_n.
  $
  de modo que
  $
  B inter C
  =
  (I_1 inter J_1) times ... times (I_n inter J_n).
  $
  Como $I_1 inter J_1$, ..., $I_n inter J_n$ são intersecções de intervalos, cada um é um intervalo. Desse modo, $B inter C$ é o produto cartesiano de $n$ intervalos, ou seja, $B inter C$ é uma caixa $n$-dimensional.
]

#def(caption: [conjunto elementar])[
  Um _conjunto elementar_ é um subconjunto de $RR^n$ que é a união de um número finito de caixas.
]

É fácil ver que a união de conjuntos elementares $E$ e $F$ é um conjunto elementar: basta escrever $E$ e $F$ como a união de caixas
$
E = B_1 union ... union B_p
#text(font: "Libertinus Sans", " e ")
F = C_1 union ... union C_q
$
e observar que a união de conjuntos é associativa.

Também ocorre que a intersecção de conjuntos elementares é elementar:
$
E inter F
&=
(B_1 union ... union B_p) inter (C_1 union ... union C_q) \
&=
[B_1 inter (C_1 union ... union C_q)] union ... union [B_p inter (C_1 union ... union C_q)] \
&=
[(B_1 inter C_1) union ... union (B_1 inter C_q)] union ... union \
&"  " [(B_p inter C_1) union ... union (B_p inter C_q)]
$
é a união de um número finito de intersecções de caixas. Como a intersecção de duas caixas é uma caixa, $E inter F$ é a união de um número finito de caixas, e portanto é elementar.

#prp[
  Um conjunto elementar $E$ pode ser escrito como a união de um número finito de caixas _disjuntas_.
]
#pro[
  Começamos com o caso unidimensional, em que $E$ é a união de finitos intervalos $I_1, ..., I_k$. Colocando as extremidades desses intervalos em ordem crescente e descartando repetições, obtemos uma sequência $x_1, ..., x_m$ que é finita e estritamente crescente. A partir dessa sequência, podemos formar a coleção
  $
  {x_1}, (x_1, x_2),
  {x_2}, (x_2, x_3), ...,
  {x_(m-1)}, (x_(m-1), x_m),
  {x_m}
  $
  constituída dos termos da sequência, vistos como intervalos degenerados, e os intervalos abertos entre eles. Claramente, essa é uma coleação de intervalos disjuntos. Assim, cada um dos $I_1, ..., I_k$ se escreve como a união de membros dessa coleção, de modo que o próprio $E$ se escreve dessa forma.

  Já para o caso $n$-dimensional, escrevemos $E$ como a união das caixas $B_1, ..., B_k$, cada uma escrita como $B_i = I_i^1 times ... times I_i^n$. Para cada $j$ de $1$ até $n$, podemos escrever cada um dos intervalos $I_1^j, ..., I_k^k$ como a união disjunta de intervalos $J_1^j, ..., J_(m_j)^j$, obtidos da mesma forma que no caso unidimensional. Assim, cada caixa $B_i$ pode ser escrita como a união de membros da coleção de caixas $J_(i_1)^1, ..., J_(i_n)^n$, onde $i_j$ varia de $1$ até $m_j$ e $j$ varia de $1$ até $n$. Facilmente se verifica que as caixas dessa coleção são disjuntas. Desse modo, o próprio $E$ se escreve como a união de caixas dessa coleção.
]

Tendo em vista a proposição acima, é natural definir o volume $abs(E)$ de um conjunto elementar $E$ como sendo a soma dos volumes das caixas disjuntas $B_1, ..., B_k$ cuja união é igual a $E$. Porém, precisamos ter certeza de que esse valor não é alterado quando escolhemos uma outra decomposição $C_1, ..., C_m$ de $E$ em caixas disjuntas. Precisaremos do seguinte lema:

#lem[
  O comprimento de um intervalo limitado $I$ pode ser obtido por
  $
  abs(I)
  =
  lim_(n -> infinity) (car(I inter ZZ\/n))/n
  $
  onde $car(I inter ZZ\/n)$ é o número de elementos do conjunto
  $
  I inter ZZ\/n
  =
  I inter {z\/n | z in ZZ}
  =
  {z in ZZ | z\/n in I}.
  $
  Similarmente, o volume de uma caixa $d$-dimensional $B$ pode ser obtido por
  $
  abs(B)
  =
  lim_(n -> infinity) (car(B inter ZZ^d\/n))/n^d.
  $
]
#pro[
  Mostraremos a validade do lema para o caso em que $I$ é um intervalo fechado. Temos que
  $
  car {z in ZZ | z\/n in I}
  &=
  car {z in ZZ | a <= z\/n <= b} \
  &=
  car {z in ZZ | 0 <= z <= n(b - a)} \
  &=
  1 + floor(n(b - a)).
  $
  Acontece que $floor(n(b - a)) = n(b - a) - epsilon$ para algum $epsilon in [0, 1)$. Daí
  $
  lim_(n -> infinity) (car(I inter ZZ\/n))/n
  =
  lim_(n -> infinity) (1 + n(b - a) - epsilon)/n
  =
  b - a
  =
  abs(I)
  $
  Para o volume da caixa, observamos que pondo $B = I_1 times ... times I_d$ temos que
  $
  B inter ZZ^d\/n
  &=
  {zz in ZZ^d | zz\/n in B} \
  &=
  {z_1, ..., z_d in ZZ | z_1\/n in I_1, ..., z_d\/n in I_d} \
  &=
  {z_1 in ZZ | z_1\/n in I_1} times ... times {z_d in ZZ | z_d\/n in I_d} \
  &=
  (I_1 inter ZZ\/n) times ... times (I_d inter ZZ\/n)
  $
  de modo que
  $
  car(B inter ZZ^d\/n)/n^d
  &=
  car(I_1 inter ZZ\/n)/n times ... times car(I_d inter ZZ\/n)/n
  $
  e portanto
  $
  lim_(n -> infinity) car(B inter ZZ^d\/n)/n^d
  =
  abs(I_1) times ... times abs(I_d)
  =
  abs(B)
  $
  como queríamos.
]

#prp[
  Se $E$ é um conjunto elementar que pode ser escrito de duas maneiras como a união de caixas disjuntas $B_1, ..., B_p$ e $C_1, ..., C_q$, então
  $
  attach(sum, b: i, br: 1, tr: p) abs(B_i)
  =
  attach(sum, b: j, br: 1, tr: q) abs(C_j).
  $
]
#pro[
  Temos que
  $
  attach(sum, b: i, br: 1, tr: p) abs(B_i)
  &=
  attach(sum, b: i, br: 1, tr: p)
    lim_(n -> infinity) car(B_i inter ZZ^d\/n)/n^d \
  &=
  lim_(n -> infinity)
    1/n^d attach(sum, b: i, br: 1, tr: p) car(B_i inter ZZ^d\/n) \
  &=
  lim_(n -> infinity)
    1/n^d car[(attach(union.big, b: i, br: 1, tr: p) B_i) inter ZZ^d\/n] \
  &=
  lim_(n -> infinity)
    1/n^d car(E inter ZZ^d\/n)
  $
  e similarmente
  $
  attach(sum, b: j, br: 1, tr: q) abs(C_j)
  &=
  attach(sum, b: j, br: 1, tr: q)
    lim_(n -> infinity) car(C_j inter ZZ^d\/n)/n^d \
  &=
  lim_(n -> infinity)
    1/n^d attach(sum, b: j, br: 1, tr: q) car(C_j inter ZZ^d\/n) \
  &=
  lim_(n -> infinity)
    1/n^d car[(attach(union.big, b: j, br: 1, tr: q) C_j) inter ZZ^d\/n] \
  &=
  lim_(n -> infinity)
    1/n^d car(E inter ZZ^d\/n)
  $
  de modo que
  $
  attach(sum, b: i, br: 1, tr: p) abs(B_i)
  =
  lim_(n -> infinity)
    1/n^d car(E inter ZZ^d\/n)
  =
  attach(sum, b: j, br: 1, tr: q) abs(C_j)
  $
  como queríamos.
]

De fato, poderíamos definir o volume de $E$ como sendo o limite
$
  abs(E)
  :=
  lim_(n -> infinity) 1/n^d car(E inter ZZ^d\/n)
$
já que essa fórmula funciona bem para conjuntos elementares. Mais do que isso, acontece que essa fórmula funciona bem para uma classe ainda maior de conjuntos, os chamados _mensuráveis a Jordan_.

Comecemos agora o processo de generalização do conceito de volume, trocando a nomenclatura _volume_ pela nomenclatura _medida_.

#def(caption: [medida de um conjunto elementar])[
  A _medida_ de um conjunto elementar $E$ é definida por
  $
  m(E)
  :=
  attach(sum, b: i, br: 1, tr: p) abs(B_i)
  $
  onde $B_1, ..., B_p$ é uma decomposição de $E$ em caixas disjuntas.
]

Vemos que $m(E)$ é sempre um número real não negativo e que $m(B) = abs(B)$ para toda caixa $B$. Nesse sentido, pode-se dizer que a noção de medida _estende_ a noção de volume. Em particular
$
m(emptyset)
=
abs(emptyset)
=
0.
$

Acontece também que se $E_1, ..., E_k$ são conjuntos elementares disjuntos, então
$
m(E_1 + ... + E_k)
=
m(E_1) + ... + m(E_k)
$
e essa propriedade é denominada por _aditividade finita_.

Intuitivamente, esperamos que se $E$ e $F$ são conjuntos elementares com $E subset.eq F$, então $m(E) <= m(F)$. Isso é fácil de ser ver quando escrevemos
$
F = (F - E) union (F inter E)
$
e usamos a aditividade e não negatividade da medida de conjuntos elementares (a rigor, não sabemos se $F - E$ de fato é elementar).