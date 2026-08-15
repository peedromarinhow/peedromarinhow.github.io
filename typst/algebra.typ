#import "lib.typ": *

= estruturas algébricas

== magmas


Um _magma_ é um conjunto com uma operação binária.

Dito de outra forma, um magma é um conjunto $A$ sobre o qual está definida uma aplicação $bot : A times A -> A$ que escrevemos $x bot y$ para $x, y in A$.


A notação $x bot y$ é _genérica_. Os símbolos mais comumente usados para denotar operações binárias são os conhecidos $+$, $-$, $times$ e $div$.

No caso em que uma operação binária é denotada por $+$, chamamos essa operação de _soma_ ou _adição_, e dizemos que essa ela é _escrita aditivamente_.

No caso em que a operação é denotada por qualquer um dos símbolos $times$, $dot$, $*$ ou simplesmente por _justaposição_#footnote[que significa dizer escrever $x y$ no lugar de $x times y$, por exemplo.], chamamos essa operação de _multiplicação_ ou _produto_, e dizemos que ela é escrita _multiplicativamente_.


Seja $X$ um conjunto qualquer. O conjunto das partes $pow(X)$ com qualquer uma das operações de união ou intersecção é um magma.


O conjunto dos naturais $NN$ com qualquer uma das operações de soma, multiplicação e exponenciação é um magma.


Se $A_i, i in I$ é uma família de magmas cujas operações são $bot_i$, então a aplicação
$ ((x_i), (y_i)) |-> ((x_i bot_i y_i)) $
é uma operação no produto cartesiano
$ A = Pi {A_i | i in I} $
que faz de $A$ um magma, chamado de _magma produto_ dos magmas $A_i$.


Dados dois subconjuntos $X, Y$ de um magma $C$, denotamos por $X bot Y$ o conjunto
$ {x bot y | x in X, y in Y}. $


No caso em que $X$ ou $Y$ consiste de um único elemento, por exemplo, $X = {x}$, escrevemos $x bot Y$ ao envés de ${x} bot Y$, e similarmente caso $Y = {y}$.


A _operação iterada_ de uma família ordenada finita $(x_i), i in I$ de elementos de um magma $A$ onde $I$ é não-vazio é denotada por
$
limits(class("large", bot))_(i in I) x_i
" ou "
limits(class("large", bot)) {x_i | i in I}
$
e definida indutivamente por
+ caso $I = {alpha}$, então
  $ limits(class("large", bot))_(i in I) x_i = x_alpha $
+ caso $I$ tenha mais de $1$ elemento e $alpha$ seja o menor elemento de $I$, então
  $
  limits(class("large", bot))_(i in I) x_i
  =
  x_alpha " " bot limits(class("large", bot))_(i in I - {alpha}) x_i
  $


Seja $I = {1, 2, 3}$ e $x_i in A$ para todo $i in I$, onde $A$ é um magma. Então
$ limits(class("large", bot))_(i in I) x_i = x_1 bot (x_2 bot x_1). $


É importante observar que na definição acima foi feita a escolha de compor os elementos _da direita para a esquerda_. Poderíamos ter definido que a operação iterada fosse feita da esquerda para a direita. Nesse caso, a operação iterada da sequência $x_1, x_2, x_3$ seria
$ (x_1 bot x_2) bot x_3. $


Seja $(x_i), i in I$ uma família e elementos de um magma $A$ e $I$ não-vazio. No caso em que a operação do magma é escrita aditivamente, escrevemos
$ sum_(i in I) x_i " ou " sum {x_i | i in I} $
para denotar a sua iteração, que chamamos de _somatório_. No caso em que a operação é escrita multiplicativamente, escrevemos
$ product_(i in I) x_i " ou " product {x_i | i in I} $
que chamamos de _produtório_.
Quando é claro sobre qual conjunto de índices queremos efetuar a operação, escrevemos, por exemplo
$ class("large", bot)_i x_i " ou " class("large", bot) x_i. $

== homomorfismos de magmas


Um _homomorfismo_ de um magma $A$ num magma $B$ é uma função $f : A -> B$ tal que#footnote[onde as operações de $A$ e $B$ são denotadas por $bot_E$ e $bot_F$ respectivamente]
$ f(x bot_E y) = f(x) bot_F f(y) $
para todos $x, y in A$. Denotamos o conjunto dos homomorfismos entre dois magmas $B$ e $G$ pro $hom(B, G)$.

Um _endomorfismo_ é um homomorfismo de um magma $A$ em si mesmo. Denotamos o conjunto dos endomorfismos sobre um magma $A$ por $end(A)$.

Um _isomorfismo_ é um homomorfismo que é uma aplicação bijetiva. Não existe uma maneira especial de denotar o conjunto dos isomorfismos entre dois magmas.

Um _automorfismo_ é um endomorfismo que também é um isomorfismo. Denotamos o conjunto dos automorfismos sobre um magma $A$ por $aut(A)$.

Definiremos adiante homomorfismos entre outros tipos de estruturas algébricas. No caso de confusão, denotaremos o conjunto dos homomorfismos entre dois magmas $A$ e $B$ por $hom_"mag" (A, B)$.


Se $A$ é um magma qualquer, então a aplicação identidade $id_E : A -> A$ é um endomorfismo de $A$.


Se $A$, $B$ e $C$ são magmas, $f in hom(A, B)$ e $g in hom(B, C)$ então $f compose g in hom(A, C)$.

Com efeito, dados $x, y in A$ temos que
$
[f compose g](x bot_A y)
&=
f[g(x bot_A y)] \
&=
f[g(x) bot_B g(y)] \
&=
f[g(x)] bot_C f[g(y)] \
&=
[f compose g](x) bot_C [f compose g](y)
$
donde $f compose g in hom(A, C)$.


Se $f in hom(A, B)$ é um isomorfismo entre dois magmas $A$ e $B$, então a inversa de $f$ é um isomorfismo de $B$ em $A$

Por definição, $f$ ser um isomorfismo significa que $f$ é bijetora. Daí, dados $x, y in B$ existem $x', y' in A$ _únicos_ tais que
$
mat(
  delim: #none,
  f(x') &= x,      " e ", f(y') &= y;
  f^(-1)(x) &= x', " e ", f^(-1)(y) &= y'.;
)
$
Daí, temos que
$
f^(-1)(x bot_B y)
&=
f^(-1)[f(x') bot_B f(y')] \
&=
f^(-1)[f(x' bot_A y')] \
&=
x' bot_A y' \
&=
f^(-1)(x) bot_A f^(-1)(y)
$
donde $f^(-1) in hom(B, A)$.


Se $f in hom(A, B)$ onde $A$ e $B$ são magmas e $(x_i), i in I$ é uma família de elementos de $A$, então
$
f(limits(class("large", bot))_(i in I) x_i)
=
limits(class("large", bot))_(i in I) f(x_i).
$

Com efeito, temos que se $I = {alpha}$, então
$
f(limits(class("large", bot))_(i in I) x_i)
=
f(x_alpha)
=
limits(class("large", bot))_(i in I) f(x_i).
$
Se $I$ tem mais de $1$ elemento e $alpha$ é o menor deles, então
$
f(limits(class("large", bot))_(i in I) x_i)
&=
f(x_alpha " " bot limits(class("large", bot))_(i in I - {alpha}) x_i) \
&=
f(x_alpha) bot f(limits(class("large", bot))_(i in I - {alpha}) x_i) \
&=
limits(class("large", bot))_(i in I) f(x_i).
$

== submagmas


Um _subconjunto estável_ de um magma $A$ é um subconjunto $B$ de $A$ tal que se $x, y in B$, então $x bot y in B$.

Dito de outra forma, um subconjunto $B$ de um magma $A$ é estável se $B bot B subset.eq B$.

Dizemos que a operação $bot$ restrita à $B$ é _induzida_ pela operação $bot$ de $A$. Nesse caso, dizemos que $B$ é um _submagma_ de $A$, e escrevemos $B <= A$.


Se $A$ é um magma e ${B_i | i in I}$ é uma família arbitrária de subconjuntos estáveis de $A$, então $B = inter.big {B_i | i in I}$ também é um subconjunto estável de $A$.

Com efeito, se $x, y in B$, então $x, y in B_i$ para todo $i in I$. Como cada $B_i$ é estável, temos que $x bot y in B_i$ para todo $i in I$ donde $x bot y in B$, e portanto $B$ é estável.


Se $A$ e $B$ são magmas e $f in hom(A, B)$, então
+ $X <= A => f(X) <= B$
+ $X <= B => f^(-1)(X) <= A$
+ se $g in hom(A, B)$, então o conjunto $X$ dos $x in A$ tais que $f(x) = g(x)$ é um subconjunto estável de $A$.

Com efeito
+ dados $x, y in f(X)$, existem $x', y' in A$ tais que $x = f(x')$ e $y = f(y')$, donde
  $ x bot y = f(x') bot f(y') = f(x' bot y') in f(X) $
  uma vez que $x' bot y' in X$
+ dados $x, y in f^(-1)(X)$, existem $x', y' in B$ tais que $x' = f(x)$ e $y' = f(y)$, donde
  $ x' bot y' = f(x) bot f(y) = f(x bot y) in f(X) $
  e portanto $x bot y in f^(-1)(X)$, uma vez que $f(x bot y) = x' bot y'$.
+ se $x, y in X$, então $f(x) = g(x)$ e $f(y) = g(y)$, donde
  $ f(x bot y) = f(x) bot f(y) = g(x) bot g(y) = g(x bot y) $
  e portanto $f(x bot y) = g(x bot y)$.


O _submagma gerado_ por um subconjunto $X$ de um magma $A$ é denotado por $<|X|>$ e definido como
$ <|X|> := inter.big {B <= A | X subset.eq B}.  $


Se $A$ e $B$ são magmas, $X subset.eq A$ e $f in hom(A, B)$, então
$ f(<|X|>) = <|f(X)|>. $

Em primeiro lugar, como $X subset.eq <|X|>$, temos que $f(X) subset.eq f(<|X|>)$. Mas daí, como $f(<|X|>) <= A$, temos que $f(<|X|>)$ é um subconjunto estável de $A$ que contém $f(X)$, e portanto $<|f(X)|> subset.eq f(<|X|>)$.

Por outro lado, como $f(X) subset.eq <|f(X)|>$, temos que $X subset.eq f^(-1)(<|f(X)|>)$. Mas como $<|f(X)|> <= B$, temos que $f^(-1)(<|f(X)|>) <= A$ é um subconjunto estável de $A$ que contém $X$, e donde $<|X|> subset.eq f^(-1)(<|f(X)|>)$ e portanto $f(<|X|>) subset.eq <|f(X)|>)$.

== magmas comutativos, associativos e unitais


Um _magma comutativo_ é um magma cuja operação é comutativa.

Dito de outra forma, um magma comutativo é um magma $A$ onde
$ x bot y = y bot x $
para todos $x, y in A$


Qualquer um dos conjuntos $ZZ, QQ$ ou $RR$ com a operação de soma ou a operação de multiplicação são magmas comutativos.

Porém, nenhum deles é um magma comutativo com a operação de exponenciação.


O conjunto das funções de $X$ em $X$ onde $X$ é um conjunto qualquer cuja cardinalidade seja $> 1$ _não_ é um magma comutativo com a operação de composição.


Um _magma associativo_ é um magma cuja operação é associativa.

Dito de outra forma, um magma associativo é um magma $A$ onde
$ x bot (y bot z) = (x bot y) bot z $
para todos $x, y, z in A$.

Magmas associativos também são chamados de _semigrupos_.


Qualquer um dos conjuntos $ZZ, QQ$ ou $RR$ com a operação de soma ou a operação de multiplicação são semigrupos.

Porém, _nenhum_ deles é um semigrupo com respeito à operação de subtração. De fato, temos que
$ x - (y - z) = x - y + z != (x - y) - z $
sejam $x, y, z$ elementos de $ZZ, QQ$ ou $RR$.

Além disso, $RR_star$ e $QQ_star$ também não são semigrupos com respeito à operação de divisão. De fato, temos que
$
x div (y div z)
=


!=
x / (y z)
=

=
(x div y) div z.
$


O conjunto $fun(X, X)$ das funções de $X$ em $X$ onde $X$ é um conjunto qualquer com a operação de composição é um semigrupo. Com efeito, se $f, g, h : X -> X$, então
$
[f compose (g compose h)](x)
=
f{[g compose h](x)}
=
f{g[h(x)]}
$
assim como
$
[(f compose g) compose h](x)
=
{f compose g}[h(x)]
=
f{g[h(x)]}.
$


A associatividade nos permite escrever $x bot y bot z$ sem parenteses. O mesmo ocorre para um número finito qualquer de elementos.


Se $A$ é um magma associativo e $X subset.eq A$, então o conjunto
$ X' = {x_1 bot x_2 bot ... bot x_n | n in NN, x_i in X} $
é igual a $<|X|>$.

Com efeito, temos que $X' subset.eq <|X|>$. Para mostrar que $<|X|> subset.eq$, mostraremos que $X'$ é um subconjunto estável de $A$. Com efeito, dados $x, y in X'$, podemos escrever
$
x &= x_1 bot x_2 bot ... bot x_(n-1) \
y &= x_n bot x_(n + 1) bot ... bot x_(n + p)
$
donde
$ x bot y = x_1 bot x_2 bot ... bot x_(n + p) in X' $
e portanto $X' <= A$.


No conjunto dos naturais $NN$ com a operação de soma, o subconjunto estável gerado pelo $1$ é o próprio $NN$. Com a operação de multiplicação, o subconjunto estável gerado pelo $1$ consiste de um único elemento, ele próprio.


Um _magma unital_ é um magma que possui um _elemento identidade_.

Dito de outra forma, um magma unital é um magma $A$ que possui um elemento $e$ tal que
$ e bot x = x bot e = x $
para todo $x in A$.

No caso em que $A$ é uma magma unital associativo, ou seja, no caso em que $A$ é um semigrupo com elemento identidade, dizemos que $A$ é um _monoide_.


Quando houver ambiguidade, denotaremos a identidade de um magma $A$ por $e_A$.


Qualquer um dos conjuntos $ZZ, QQ$ ou $RR$ com a operação de soma é um monoide, onde o elemento identidade é o zero.

Além disso, os mesmos conjuntos com a operação de multiplicação também são monoides, porém nesse caso o elemento identidade é o um.


O conjunto das funções de $X$ em $X$ onde $X$ é um conjunto qualquer com a operação de composição é um monoide com identidade igual a função identidade $id_X$.


Nenhum dos conjuntos $NN$, $ZZ, QQ$ ou $RR$ tem elemento identidade com respeito à operação de exponenciação.


Se $A$ é um magma com identidades $e$ e $e'$, então $e' = e$.

Com efeito, temos que
$ e' = e bot e' = e. $


Um _homomorfismo unital_ é um homomorfismo $f in hom(A, B)$ entre dois magmas unitais $A$ e $B$ tal que $f(e_A) = e_B$.


No caso em que $A$ e $B$ são monoides, $f$ é chamado um _homomorfismo de monoides_. Novamente, denotamos o conjunto dos homomorfismos entre dois monoindes $A$ e $B$ por $hom_"mon" (A, B)$, ou simplesmente $hom(A, B)$. Similarmente, definimos $end_"mon" (A)$ e $aut_"mon" (A)$ para um monoide $A$.

== magmas quocientes


Se $A$ é um magma com operação $bot$ e $R$ é uma relação de equivalência entre os elementos de $A$, então dizemos que $R$ e $bot$ são _compatíveis_ se $x ~_R x'$ e $y ~_R y'$ implicam que $x bot y ~_R x' bot y'$ para todos $x, x' y, y' in A$.

O _magma quociente_ de $A$ por $R$ é o conjunto quociente $A\/R$ com a operação  $bot : A\/R times A\/R -> A\/R$ dada por
$ [x]_R bot [y]_R = [x bot y]_R $
que leva as classes de equivalência de $x$ e $y$ na classe de equivalência de $x bot y$.


Seja $A$ um magma qualquer e $R$ a relação de igualdade. Então o quociente $A\/R$ é isomorfo ao próprio $A$.


Se $A$ é um magma associativo e $R$ é uma relação de equivalência em $A$, então o magma quociente $A\/R$ também é associativo. O mesmo ocorre se $A$ for comutativo.

Com efeito, temos que se $x bot (y bot z) = (x bot y) bot z$ para todos $x, y, z in A$, então
$
[x] bot ([y] bot [z])
&=
[x] bot [y bot z] \
&=
[x bot (y bot z)] \
&=
[(x bot y) bot z] \
&=
[x bot y] bot [z] \
&=
([x] bot [y]) bot [z].
$

Além disso, se $x bot y = y bot x$, então
$ [x] bot [y] = [x bot y] = [y bot x] = [y] bot [x]. $


A _projeção canônica_ é a aplicação $pi_R : A -> A\/R$ que leva um elemento $x$ na sua classe de equivalência $[x]_R$.


Quando não há risco de confusão, denotamos a $pi_R$ simplesmente por $pi$.


Se $A$ é um magma e $R$ é uma relação de equivalência em $A$, então a projeção canônica $pi : A -> A\/R$ é um homomorfismo de $A$ em $A\/R$.

Com efeito, temos que
$ pi (x bot y) = [x bot y] = [x] bot [y] = pi(x) bot pi(y) $
e portanto $pi in hom(A, A\/R)$.


Se $A$ e $B$ são magmas e $f in hom(A, B)$, então a relação $R$ definida por
$ x ~ y <=> f(x) = f(y) $
é uma relação de equivalência em $A$. Além disso, $R$ é compatível com a operação de $A$, e a aplicação $f' : A\/R -> f(A)$ dada por
$ f'([x]) = f(x) $
é um isomorfismo.

Primeiro, vamos mostrar que $R$ é uma relação de equivalência.
- Afirmo que $R$ é reflexiva. Com efeito, como $f(x) = f(x)$ para todo $x in A$, temos que $x ~ x$ para todo $x in A$.
- Afirmo que $R$ é simétrica. Com efeito, se $x, y in A$ são tais que $x ~ y$, então $f(x) = f(y)$ donde $f(y) = f(x)$ e portanto $y ~ x$.
- Afirmo que $R$ é transitiva. Com efeito, se $x, y, z in A$ são tais que $x ~ y$ e $y ~ z$, então $f(x) = f(y)$ e $f(y) = f(z)$, donde $f(x) = f(z)$ e portanto $x ~ z$.

Agora, vamos mostrar que $R$ é compatível com a operação de $A$. Com efeito, temos que se $x ~ x'$ e $y ~ y'$, então $f(x) = f(x')$ e $f(y) = f(y')$, donde
  $ f(x bot y) = f(x) bot f(y) = f(x') bot f(y') = f(x' bot y') $
  donde
  $ x bot y ~ x' bot y'. $

Resta mostrar que $f'$ é um isomorfismo.
- Afirmo que $f$ é injetiva. Com efeito,
  $ [x] = [y] => x ~ y => f(x) = f(y) $
  e portanto
  $ f'([x]) = f(x) = f(y) = f'([y]) $
- Além disso afirmo que $f$ é sobrejetiva. Com efeito, dado $z in f(A)$, então $z = f(x)$ para algum $x in A$, e daí $[x]$ é tal que $f'([x]) = f(x) = z$, e portanto $f'$ é sobrejetiva.
- Por fim, afirmo que que $f' in hom(A\/R, f(A))$. Com efeito, 
  $
  f'([x] bot [y])
  =
  f'([x bot y])
  =
  f(x bot y)
  =
  f(x) bot f(y)
  =
  f'([x]) bot f'([y]).
  $


Se $A$ é um magma com elemento identidade $e$ e $R$ é uma relação de equivalência em $A$, então a imagem de $e$ pela projeção canônica $pi$ é um elemento identidade de $A\/R$.

Com efeito, se $x in A$ então
$
[x] bot pi(e) = [x] bot [e] = [x bot e] = [x]
" e "
pi(e) bot [x] = [e] bot [x] = [e bot x] = [x].
$


A proposição acima mostra que o quociente de um magma unital $A$ por uma relação de equivalência $R$ resulta num magma unital. O mesmo vale para o caso em que $A$ é um monoide.

Além disso, o produto de magmas unitais (respectivamente, monoides) continua sendo um magma unital (respectivamente, monoide).


//   Se $A$ é um magma e $a in A$, então
//   - a _translação à esquerda por $a$_ é a aplicação $epsilon_a : A -> A$ tal que $epsilon_a (x) = a bot x$
//   - a _translação à direita por $a$_ é aplicação $delta_a : A -> A$ tal que $delta_a (x) = x bot a$.


//   Se $A$ é um semigrupo, então
//   $
//   epsilon_(x bot y) = epsilon_x compose epsilon_y
//   " e "
//   delta_(x bot y) = delta_y compose delta_x
//   $
//   para todos $x, y in A$.

//   Com efeito, temos que
//   $
//   epsilon_(x bot y) (z)
//   &=
//   (x bot y) bot z
//   =
//   x bot (y bot z)
//   =
//   epsilon_x [epsilon_y (z)]
//   =
//   [epsilon_x compose epsilon_y](z) " e " \

//   delta_(x bot y) (z)
//   &=
//   z bot (x bot y)
//   =
//   (z bot x) bot y
//   =
//   delta_y [delta_x (z)]
//   =
//   [delta_y compose delta_x](z)
//   $


//   Um elemento $a$ de um magma $A$ é dito
//   - _cancelável à esquerda_ se $epsilon_a$ é injetiva
//   - _cancelável à direita_ se $delta_a$ é injetiva e
//   - _cancelável_ se é cancelável à direita e à esquerda simultaneamente.


//   Dito de outra forma, um elemento $a$ de um magma $A$ é cancelável se qualquer uma das equações
//   $ a bot x = a bot y " ou " x bot a = y bot a $
//   implicam em ser $x = y$.


//   Todo número natural é cancelável com respeito à soma.

== elementos inversos


Se $A$ é um monoide e $x in A$, então $x' in A$ é dito um
- _inverso à esquerda de $x$_ se $x' bot x = e$, e nesse caso dizemos que $x$ é _invertível à esquerda_
- _inverso à direita de $x$_ se $x bot x' = e$, e nesse caso dizemos que $x$ é _invertível à direita_, e
- _inverso de $x$_ se $x' bot x = x bot x' = e$, e nesse caso dizemos que $x$ é invertível.


Se $A$ é um monoide, $x in A$ e $y, z in A$ são inversos de $x$, então $y = z$.

Com efeito, temos que
$ y = y bot e = y bot x bot z = e bot z = z. $


O inverso de um elemento $x$ de um monoide $A$ é denotado por $x^(-1)$.

Num magma escrito aditivamente, geralmente chamamos o inverso de um elemento $x$ de _oposto_ ou _negativo_ de $x$, e o denotamos por $-x$.


No conjunto $fun(X, X)$ onde $X$ é um conjunto qualquer, uma função $f$ é invertível à esquerda se é sobrejetiva, e invertível à direita se for injetiva.


Se $A$ e $B$ são monoides, $f in hom(A, B)$ é um homomorfismo unital e $x, x' in A$ são tais que $x'$ é o inverso de $x$, então $f(x')$ é o inverso de $f(x)$ em $B$.

Com efeito, como $f(e_A) = e_B$ e como $x' bot x = x bot x' = e_A$, temos que
$
f(e_A)
&=
f(x bot_A x') \
&=
f(x) bot_B f(x') \
&=
e_B
$
e também que
$
f(e_A)
&=
f(x' bot_A x) \
&=
f(x') bot_B f(x) \
&=
e_B
$
donde $f(x) bot f(x') = f(x') bot f(x) = e_B$.


Se $R$ é uma relação de equivalência compatível com a operação de um monoide $A$, então a imagem de um elemento invertível $x$ pela projeção canônica é um elemento invertível de $A\/R$. 


Se $A$ é um monoide e $x, y in A$ tem inversos $x', y' in A$ respectivamente, então $y' bot x'$ é o inverso de $x bot y$.

Com efeito, temos que
$
(y' bot x') bot (x bot y)
=
y' bot (x' bot x) bot y
=
y' bot y
=
e
$
e similarmente
$
(x bot y) bot (y' bot x')
=
x bot (y bot y') bot x'
=
x bot x'
=
e
$
donde $(y' bot x') bot (x bot y) = (x bot y) bot (y' bot x') = e$.

== ações


Uma _ação_ de um conjunto $Omega$ num conjunto $A$ é uma aplicação de $Omega$ no conjunto $fun(A, A)$ das funções de $A$ em $A$.

Se $alpha in Omega |-> f_alpha in fun(A, A)$ é uma ação de $Omega$ em $A$, então
- a _operação à esquerda associada à $alpha$ em $A$_ é a aplicação $(alpha, x) in Omega times A |-> f_alpha (x) in A$ definida por
  $ alpha x = f_alpha (x) $
- a _operação à direita associada à $alpha$ em $A$_ é a aplicação do tipo $A times Omega -> A$ definida por
  $ x alpha = f_alpha (x). $
Por brevidade, vamos nos referir às operações à esquerda de uma ação simplesmente por _operações_.


Se $A$ é um magma, a aplicação que relaciona um natural não-nulo $n$ à aplicação
$ x |-> underbrace(x bot x bot ... bot x, n "vezes") $
para $x in A$ é uma ação de $NN$ em $A$. No caso em que $A$ é escrito aditivamente, denotamos a operação dessa ação por $n x$, e no caso em que $A$ é escrito multiplicativamente, denotamos a operação dessa ação por $x^n$.


Uma ação de um conjunto $Omega$ num magma $A$ é dita _distributiva_ se para todo $alpha in Omega$ a aplicação $f_alpha$ é um endomorfismo.

Dito de outra forma, a ação $alpha |-> f_alpha$ é dita distributiva se
$ alpha (x bot y) = (alpha x) bot (alpha y) $
para todos $x, y in A$ e $alpha in Omega$.

No caso em que $Omega$ também é um magma cuja operação é $top$, se ocorre que
$ (alpha top beta) x = alpha x bot beta x $
para todos $alpha, beta in A$ e $x in A$, dizemos que a operação dessa ação é _distributiva na primeira variável_.


Se $A$ é um magma comutativo e associativo escrito aditivamente, a ação de $NN$ em $A$ dada por $n x$ como definida no exemplo anterior é distributiva. Com efeito,
$
n (x + y)
&=
underbrace((x + y) + ... + (x + y), n "vezes") \
&=
underbrace(x + ... + x, n "vezes") + underbrace(y + ... + y, n "vezes") \
&=
n x + n y.
$


Se $A$ é um magma com duas operações $top$ e $bot$, então dizemos que $top$ é _distributiva_ sobre $bot$ se
$
x top (y bot z) &= (x top y) bot (x top z)
" e " \
(x bot y) top z &= (x top z) bot (y top z).
$


As duas condições acima são equivalentes se a operação $top$ for comutativa.

Geralmente, uma das operações é escrita multiplicativamente e a outra aditivamente.


No conjunto $NN$ dos naturais, a multiplicação é distributiva sobre a soma, ou seja
$ x (y + z) = x y + x z. $

== grupos


Um _grupo_ é um monoide em que todo elemento é invertível.

Um _grupo comutativo_ ou _grupo abeliano_ é um grupo cuja operação é comutativa.


Chamamos um grupo cuja operação é escrita multiplicativamente de _grupo multiplicativo_, e um grupo cuja operação é escrita aditivamente de _grupo aditivo_. Grupos genéricos são escritos multiplicativamente.

Se $G$ é um grupo e $x in G$, então o inverso de $x$ é denotado por $x^(-1)$ caso $G$ seja um grupo multiplicativo e $-x$ caso $G$ seja um grupo aditivo.


Qualquer um dos conjuntos $ZZ, QQ$ e $RR$ é um grupo abeliano com a operação de soma.


Os conjuntos
$ QQ_* := QQ - {0} " e " RR_* := RR - {0} $
são grupos abelianos com a operação de multiplicação.


O conjunto das bijeções de um conjunto qualquer $X$ em si mesmo é um grupo com a operação de composição. Esse grupo é chamado de _grupo simétrico sobre $X$_ é denotado por $"Sym"(X)$.


O grupo $"Sym"(I_n)$ onde $I_n := {1, 2, ..., n}$ com $n in NN$ é chamado de _grupo de permutações de $n$ elementos_ e é denotado por $S_n$.

Podemos representar um elemento $sigma$ de $S_n$ na forma de uma tabela
$
mat(
  delim: "(",
  1, 2, ..., n;
  sigma(1), sigma(2), ..., sigma(n)
)
$
por exemplo, um elemento de $S_4$ é dado por
$
mat(
  delim: "(",
  1, 2, 3, 4;
  3, 2, 1, 4
).
$


O inverso de um elemento de um grupo é único. Dito de outra forma, se $G$ é um grupo e $x in G$ e $y, z in G$ são tais que
$ x y = y x = x z = z x = e $
então $y = z$.

  Com efeito, temos que
  $ y = y e = y x z = e z = z. $


Se $G$ é um grupo, então
+ se $x y = x z$ ou $y x = z x$ então $y = z$
+ $(x y)^(-1) = x^(-1) y^(-1)$
+ $(x^(-1))^(-1) = x$
para todos $x, y, z in G$.

Em primeiro lugar, temos que
$
x^(-1) (x y) = x^(-1) (x z)
=>
(x^(-1) x) y = (x^(-1) x) z
=>
e y = e z
=>
y = z
$
e similarmente
$
(y x) x^(-1) = (z x) x^(-1)
=>
y (x x^(-1)) = z (x x^(-1))
=>
y e = z e
=>
y = z.
$

Em segundo lugar, temos que
$
(x y) (y^(-1) x^(-1))
=
x[y(y^(-1) x^(-1))]
=
x[(y y^(-1)) x^(-1)]
=
x[e x^(-1)]
=
x x^(-1)
=
e
$
e similarmente
$
(y^(-1) x^(-1)) (x y)
=
[(y^(-1) x^(-1)) x] y
=
[y^(-1) (x^(-1) x)] y
=
[y^(-1) e] y
=
y^(-1) y
=
e
$
donde, pela unicidade do inverso, segue-se que $(x y)^(-1) = y^(-1) x^(-1)$.

Em terceiro lugar, temos que
$
(x^(-1)) x = e
$
e também que
$
x (x^(-1)) = e
$
donde, pela unicidade do inverso, segue-se que $(x^(-1))^(-1) = x$.


Um _homomorfismo de grupos_ entre dois grupos $G$ e $H$ é um homomorfismo de magmas entre $G$ e $H$. Assim como no caso dos magmas, denotamos o conjunto de todos os homomorfismos entre os grupos $G$ e $H$ por $hom(G, H)$ ou $hom_"gru" (G, H)$ quando houver risco de confusão.

Um _endomorfismo_ é um homomorfismo de um grupo em si mesmo. Novamente, denotamos o conjunto dos endomorfismos de um grupo por $end(G)$.

Um _isomorfismo_ é um homomorfismo bijetivo.


Se $G$ e $H$ são grupos e $f in hom(G, H)$, então $f(e_G) = e_H$.

Com efeito, temos que
$
f(e_G)
&=
f(e_G) \
&=
f(e_G e_G) \
&=
f(e_G) f(e_G).
$
Multiplicando ambos os lados de $f(e_G) = f(e_G) f(e_G)$ pelo inverso de $f(e_G)$, obtemos
$
e_H = f(e_G).
$


Se $G$ e $H$ são grupos e $f in hom(G, H)$, então $f(x^(-1)) = f(x)^(-1)$ para todo $x in G$.

Com efeito, como $f(e_G) = e_H$ temos que
$
f(e_G)
&=
f(x x^(-1)) \
&=
f(x) f(x^(-1)) \
&=
e_H
$
donde $f(x) f(x^(-1)) = e_H$ e portanto $f(x^(-1)) = f(x)^(-1)$.


Um _subgrupo_ de um grupo $G$ é um submagma $H$ em que todo elemento tem inverso.

Dito de outra forma, um subgrupo de um grupo $G$ é um subconjunto $H$ de $G$ tal que
- $x, y in H => x y in H$
- $x in H => x^(-1) in H$.

Escrevemos $H <= G$ para dizer que $H$ é um subgrupo de $G$.


Dado um natural $n in NN$, o conjunto
$ n ZZ = {n z | z in ZZ} $
é um subgrupo do grupo aditivo $ZZ$.


O conjunto ${e}$ que contém somente o elemento identidade de um grupo qualquer $G$ é um subgrupo de $G$, chamado de _subgrupo trivial_.


Se $G$ é um grupo e $H <= G$, então $e in H$.

Com efeito, do fato de que $x in H => x^(-1) in H$ e do fato de que $x, y in H => x y in H$, temos que
$ x x^(-1) = e in H. $


Se $G$ é um grupo e ${H_i | i in I}$ é uma família arbitrária de subgrupos de $G$, então $H = inter.big_(i in I) H_i$ também é um subgrupo de $G$.

Com efeito, temos que $e in H_i$ para todo $i in I$, e portanto $H$ não é vazio.

Além disso, se $x, y in H$, então $x, y in H_i$ para todo $i in I$. Daí, como cada $H_i$ é um subgrupo, temos que $x y in H_i$ para todo $i in I$, e portanto $x y in H$, ou seja, $H$ é fechado com respeito a produtos.

Por fim, se $x in H$, então $x in H_i$ para todo $i in I$. Mas como cada $H_i$ é um subgrupo, temos que $x^(-1) in H_i$ para todo $i in I$, e portanto $x^(-1) in H$, ou seja, $H$ é fechado com respeito a inversos.




== anéis


Um _anel_ é um conjunto $A$ com duas operações $+$ e $times$ chamadas de soma e multiplicação respectivamente, tais que
+ com respeito a operação de soma $A$ é um grupo abeliano, cuja identidade denotamos por $0$
+ com respeito à operação de multiplicação $A$ cuja identidade denotamos por $1$
+ a multiplicação é distributiva sobre a soma.
Se a multiplicação for comutativa, então dizemos que $A$ é um anel comutativo.


Os inteiros $ZZ$, os racionais $QQ$, os reais $RR$ e os complexos $CC$ são anéis.


O conjunto
$ con [0, 1] := {f : [0, 1] -> RR | f " é contínua"} $
onde
$
[f + g](x)
&:=
f(x) + g(x) \

[f g](x)
&:=
f(x) g(x)
$
é um anel comutativo.


Se $A$ é um anel e $x in A$, então $x 0 = 0 x = 0$.

Com efeito, temos que
$
x 0
=
x (0 + 0)
=
x 0 + x 0
$
donde, somando $-x 0$ a ambos os lados, temos que
$
0 = x 0 - x 0 = x 0 + x 0 - x 0 = x 0 + 0 = x 0.
$
Similarmente, temos que
$ 0 x = (0 + 0) x = 0 x + 0 x $
donde
$
0 = 0  x - 0 x = 0 x + 0 x - 0 x = 0 x + 0 = 0 x.
$


Se $A$ é um anel e $x in A$, então $(-1)x = x(-1) = -x$.

Com efeito, temos que
$
(-1)x + x = (-1)x + 1 x = (-1 + 1)x = 0 x = 0
$
donde, pela unicidade do inverso, segue-se que $(-1)x = -x$.
Similarmente, temos que
$
x(-1) + x = x(-1) + x 1 = x(-1 + 1) = x 0 = 0
$
donde, pela unicidade do inverso, segue-se que $x(-1) = -x$.


Em um anel, todo elemento tem um _oposto_, ou seja, um inverso com respeito á soma. Porém, com respeito à multiplicação, um elemento _pode ou não_ ter inverso.


Um elemento $a$ de um anel $A$ é um _divisor de zero_ se existe $b in A$ diferente de zero tal que $a b = 0$.


O próprio zero sempre é um divisor de zero, uma vez que $x 0 = 0$ para todo $x in A$.


Um _domínio de integridade_ é um anel comutativo em que o único divisor de zero é o próprio zero.


$ZZ$, $QQ$ e $RR$ são domínios de integridade.


Um _ideal_#footnote[mais precisamente, um ideal _à esquerda_] em um anel $A$ é um subconjunto $I subset.eq A$ que é um subgrupo do grupo aditivo de $A$ que é fechado com respeito à multiplicação à esquerda.

Dito de outra forma, um ideal em um anel $A$ é um subconjunto $I subset.eq A$ tal que
+ $x + y in I$
+ $-x in I$
+ $x y in I$
para todos $x, y in I$ e $x in A$.


O conjunto ${0}$ contendo apenas o zero é um ideal em qualquer anel. Com efeito, ele é o subgrupo trivial do grupo aditivo, e multiplicar qualquer elemento de um anel por zero resulta em zero.


O conjunto $n ZZ$ com $n in NN$ é um ideal no anel $ZZ$. Com efeito, já vimos que $n ZZ$ é um subgrupo do grupo aditivo $ZZ$. Além disso, se $x in n ZZ$ então $x = n z$ para algum $z in ZZ$. Daí, temos que $x x = x n z = n (x z) in n ZZ$.


Se $A$ é um anel e ${A_i | i in I}$ é uma família arbitrária de ideias em $A$, então $A = inter.big_(i in I) A_i$ também é um ideal em $A$.

  Com efeito, cada $A_i$ é um subgrupo do grupo aditivo de $A$, e portanto $A$ também é um subgrupo.
  
  Além disso, dado $x in A$, temos que $x in A_i$ para todo $i in I$. Mas como cada $A_i$ é um ideal, temos que $x x in A_i$ para todo $i in I$, e portanto $x x in A$.


O _ideal gerado_ por um subconjunto $A subset.eq A$ de um anel $A$ é o menor ideal de $A$ que contém $A$.

Quando $A = {a}$ é um conjunto com um elemento só, então o ideal gerado por $A$ é dito um _ideal principal_, e é denotado por $a A$.


O ideal gerado pelo conjunto vazio $diameter$ é o ideal que contem apenas o zero, já que o conjunto vazio é um subconjunto de qualquer outro conjunto e o ideal ${0}$ é o menor ideal possível em um anel qualquer.

== corpos


Um _corpo_ é um anel comutativo que também é um grupo com respeito  à multiplicação quando se retira o elemento $0$.

Dito de outra forma, um _corpo_ é um anel comutativo $KK$ onde todo elemento diferente de zero tem inverso.


// O corpo mais simples é o corpo ${0, 1}$ onde as operações $+$ e $times$ são definidas por
// #align(
//   center,
//   grid(
//     columns: (25%, 25%),
//     row-gutter: 1em,
//     align: center,
//     table(
//       columns: 3,
//       stroke: none,
//       $+$, table.vline(), $0$, $1$,
//       table.hline(),
//       $0$, $0$, $1$,
//       $1$, $1$, $0$,
//     ),
//     table(
//       columns: 3,
//       stroke: none,
//       $times$, table.vline(), $0$, $1$,
//       table.hline(),
//       $0$, $0$, $0$,
//       $1$, $0$, $1$,
//     ),
//   )
// )
// e os opostos são definidos por $-0 := 0$ e $-1 := 1$, e o inverso de 1 é 1. Esse corpo geralmente é chamado de $ZZ_2$.


Alguns dos corpos mais comuns são $RR$,$CC$ e $QQ$.


Mais geralmente, se $p$ é primo, $ZZ_p$ é um corpo finito onde as operações são definidas módulo $p$.


Se $KK$ é um corpo, então a sua _característica_ é o menor natural $n$ tal que
$ underbrace(1 + 1 + ... + 1, n " vezes ") = 0. $


A característica do corpo $ZZ_2$ é 2, uma vez que $1 + 1 = 0$ nele. A característica dos corpos $QQ$, $RR$ e $CC$ é zero.

== anéis de polinômios sobre um corpo


O conjunto dos _polinômios sobre um anel comutativo $R$ na variável $x$_ é denotado por $R[x]$ e definido por
$
R[x] := {r_0 + r_1 x^1 + r_2 x^2 + ... + r_n x^n | n in NN, r_i in R}
$
onde a soma e o produto são definidos da maneira usual é um anel comutativo.

O _grau_ de um polinômio $f in R[x]$ diferente de zero é denotado por $deg f$ e definido como o maior $k in NN$ tal que $r_k != 0$.


O conjunto $ZZ[x]$ é um anel de polinômios. Um elemento desse anel é
$ f = 2x^3 + 5x^9 $
e o grau desse elemento é $9$.



Como todo corpo também é um anel comutativo, faz sentido considerarmos o conjunto dos _polinômios sobre um corpo $KK$_.

= módulos

== módulos


Se $R$ é um anel, então um _$R$-módulo_ ou _módulo sobre $R$_#footnote[mais precisamente, um $R$-módulo _á esquerda_ ou módulo _à esquerda_ sobre $R$] é um grupo abeliano aditivo (ou seja, com operação $+$ e identidade $0_M$) com uma operação adicional de _multiplicação por escalar_. Chamando esse grupo de $M$, a multiplicação por escalar associa a cada $r in R$ (que chamamos de escalar) e $m in M$ o elemento $r m in M$, e satisfaz
+ $r (s m) = (r s) m$
+ $(r + s) m = r m + s m$
+ $r (m + n) = r m + r n$
+ $1 m = m$
para todos $r, s in R$ e $m, n in M$.


Se $M$ é um módulo sobre um anel $R$, então
+ $0_R x = 0_M$
+ $r 0_M = 0_M$
+ $(-1) x = -x$
para todos $x in M$ e $r in R$, onde $0_R$ é a identidade do grupo aditivo de $R$ e $0_M$ é a identidade do grupo aditivo de $M$.

  Em primeiro lugar, temos que
  $
  0_R x
  &=
  0_R x + 0_M \
  &=
  0_R x + x - x \
  &=
  (0_R + 1) x - x \
  &=
  1 x - x \
  &=
  x - x \
  &=
  0_M.
  $
  Em segundo lugar, temos que
  $
  r 0_M
  &=
  r 0_M + 0_M \
  &=
  r 0_M + r 0_M - r 0_M \
  &=
  r (0_M + 0_M) - r 0_M \
  &=
  r 0_M - r 0_M \
  &=
  0_M.
  $
  Por fim, temos que
  $
  (-1) x
  &=
  (-1) x + 0_M \
  &=
  (-1) x + x - x \
  &=
  [(-1) + 1] x - x \
  &=
  0_R x - x \
  &=
  0_M - x \
  &=
  -x.
  $
  


Se $R$ é um anel, então podemos enxergar $R$ como um módulo, em que o grupo aditivo do módulo é o grupo aditivo do anel e a multiplicação por escalar é simplesmente a multiplicação do anel.


Se $R$ é um anel, então o conjunto $R^2 = R times R$ onde
$
(r_1, r_2) + (s_1, s_2)
&:=
(r_1 + s_1, r_2 + s_2) \

r (r_1, r_2)
&:=
(r r_1, r r_2)
$
é um módulo.

Mais geralmente
$ R^n = underbrace(R times R times ... times R, n "vezes") $
onde $n in NN$ também pode ser considerado um módulo, com as operações definidas de maneira similar a $R^2$.


Se $X$ é um conjunto não vazio qualquer e $M$ é um módulo, então o conjunto $fun (X, M)$ das funções de $X$ em $M$ com as operações
$
[f + g](x)
&:=
f(x) + g(x) \

[r f](x)
&:=
r f(x)
$
é um módulo.

O exemplo anterior é um caso especial desse, tratando um elemento de $(r_1, ..., r_n) in R^n$ como uma função $(r_1, ..., r_n) : I_n -> R$ onde
$ [(r_1, ..., r_n)](i) = r_i. $


Se $G$ é um grupo abeliano qualquer, então podemos enxergar $G$ como um módulo sobre $ZZ$ definindo
$
z g
=
cases(
  underbrace(g + g + ... + g, z " vezes") " se " z > 0,
  underbrace((-g) + (-g) + ... + (-g), -z " vezes") " se " z < 0,
  0 " se " z = 0
)
$
para $z in ZZ$ e $g in G$.

== submódulos


Um _submódulo_ de um módulo de um $R$-módulo $M$ é um subconjunto $N subset.eq M$ tal que
+ $N$ é um grupo com respeito à soma herdada de $M$ e
+ se $n in N$ então $r n in N$ para todo $r in R$.
Escrevemos $N <= M$ para dizer que $N$ é um submódulo de $M$.

Dito de outra forma, um submódulo de um $R$-módulo $M$ é um subconjunto $N subset.eq M$ que é um subgrupo do grupo aditivo de $M$ que também é um $R$-módulo com respeito à mesma operação de multiplicação que $M$.


Se $M$ é um $R$-módulo e ${N_i | i in I}$ é uma família arbitrária de submódulos de $M$, então $N = inter.big_(i in I) N_i$ também é um submódulo de $M$.

Cada um dos $N_i$ é um subgrupo de $M$, e portanto $N$ também é um subgrupo de $M$. Além disso se $x in N$, então $x in N_i$ para todo $i$, e portanto, dado $r in R$, temos que $r x in N_i$ para todo $i in I$, donde $r x in N$.


Num módulo qualquer $M$ o conjunto contendo apenas o elemento $0_M$ é um submódulo, chamado de _submódulo trivial_.


Se $R$ é um anel e $n, k in NN$ com $k <= n$, então $R^k <= R^n$.


Um ideal em um anel $R$ é um submódulo de $R$ visto como módulo.


Se $M$ é um $R$-módulo e $X subset.eq M$ é um subconjunto não vazio qualquer de $M$, então o _submódulo gerado por $X$_ é denotado por $<|X|>$ e definido como a intersecção de todos os submódulos de $M$ que contém $X$.

No caso em que $M = <|X|>$, dizemos que o conjunto $X$ _gera_ o módulo $M$. Se, além disso, ocorrer de $X$ ser um conjunto finito, então dizemos que $M$ é _finitamente gerado_

No caso em que $M = <|{m_0}|>$, ou seja, no caso em que $M$ é gerado por um conjunto de um só elemento, dizemos que $M$ é um _módulo cíclico_.

Dito de outra forma, se $M$ é um $R$-módulo e $X subset.eq M$ é não vazio, então
$ <|X|> := inter.big {N <= M | X subset.eq N}. $


A _soma_ de dois submódulos $N_1, N_2$ de um $R$-módulo $M$ é denotada por $N_1 + N_2$ e definida como
$ N_1 + N_2 := <|N_1 union N_2|>. $

Mais geralmente, se ${N_i | i in I}$ é uma família arbitrária de submódulos de $M$, então a soma dessa família é denotada por $sum {N_i | i in I}$ e definida como
$ sum {N_i | i in I} := <|union.big {N_i | i in I}|>. $
No caso em que ${N_i | i in I}$ é uma família finita, escrevemos
$ sum {N_i | i in I} = N_1 + N_2 + ... + N_n. $

== homomorfismos de módulos


Um _homomorfismo de módulos_ entre dois módulos $M$ e $N$ sobre um mesmo anel $R$ é uma função $f : M -> N$ que preserva as operações dos módulos. Denotamos o conjunto de todos os homomorfismos entre de $M$ em $N$ por $hom_R (M, N)$.

Dito de outra forma, $f : M -> N$ é um homomorfismo de módulos se
$
f(m_1 + m_2)
&=
f(m_1) + f(m_2) \

f(r m)
&=
r f(m)
$
para todos $m, m_1, m_2 in M$ e $r in R$.


Se $M$ e $N$ são $R$-módulos e $f in hom_R (M, N)$, então $f(0_M) = 0_N$.

  Temos que $0_M = 0_R 0_M$, e portanto
  $ f (0_M) = f (0_r 0_M) = 0_R f (0_M) = 0_N. $
  


Se $M, N$ e $O$ são módulos sobre um anel $R$ e $f in hom_R (M, N)$, $g in hom_R (N, O)$, então $f compose g in hom_R (M, O)$.

  Com efeito, temos que
  $
  [f compose g](x + y)
  &=
  f[g(x + y)] \
  &=
  f[g(x) + g(y)] \
  &=
  f[g(x)] + f[g(y)] \
  &=
  [f compose g](x) + [f compose g](y)
  $
  e também que
  $
  [f compose g](r x)
  &=
  f[g(r x)] \
  &=
  f(r g(x)) \
  &=
  r f[g(x)] \
  &=
  r [f compose g](x)
  $
  para todos $x, y, in M$, $r in R$.
  


A aplicação identidade é um homomorfismo de qualquer módulo em si mesmo.


A aplicação $f : M -> M$ de um módulo $M$ sobre um anel comutativo $R$ em si mesmo definida por
$ f(x) = a x $
para algum $a in R$ é um homomorfismo de módulos. Com efeito, temos que
$ f (x + y) = a (x + y) = a x + a y = f(x) + f(y) $
e também que
$ f (r x) = a (r x) = (a r) x = (r a) x = r (a x) = r f(x). $


Se $R$ é um anel comutativo e $M, N$ são $R$-módulos, então $hom_R (M, N)$ é um $R$-módulo com as operações
$
[f + g](x)
&:=
f(x) + g(x) \

[r f](x)
&:=
r f(x)
$
para $f, g in hom_R (M, N)$ e $r in R$.

  Vamos mostrar que as operações acima resultam em elementos de $hom_R (M, N)$. Com efeito, temos que
  $
  [f + g](x + y)
  &=
  f(x + y) + g(x + y) \
  &=
  f(x) + f(y) + g(x) + g(y) \
  &=
  f(x) + g(x) + f(y) + g(y) \
  &=
  [f + g](x) + [f + g](y)
  $
  e também que
  $
  [f + g](r x)
  &=
  f(r x) + g(r x) \
  &=
  r f(x) + r g(x) \
  &=
  r[f(x) + g(x)] \
  &=
  r[f + g](x)
  $
  para $x, y in M$, $r in R$ e $f, g in hom_R (M, N)$.
  Além disso, temos que
  $
  [r f](x + y)
  &=
  r f(x + y) \
  &=
  r[f(x) + f(y)] \
  &=
  r f(x) + r f(y) \
  &=
  [r f](x) + [r f](y)
  $
  e também que
  $
  [r f](s x)
  &=
  r f(s x) \
  &=
  r[s f(x)] \
  &=
  (r s) f(x) \
  &=
  (s r) f(x) \ // " "<-#footnote[aqui usamos a comutatividade do anel]\
  &=
  s [r f(x)] \
  &=
  s [r f](x)
  $
  para $x, y in M, r, s in R$ e $f in hom_R (M, N)$.


Um _isomorfismo_ é um homomorfismo que é bijetivo. Dito de outra forma, se $f in hom_R (M, N)$, então $f$ é um isomorfismo se existe $g in hom_R (N, M)$ tal que
$ f compose g = id_N " e " g compose f = id_M. $
Quando existe um isomorfismo entre dois módulos $M$ e $N$, dizemos que $M$ e $N$ são _isomorfos_, e escrevemos $M iso N$.

Um _endomorfismo_ é um homomorfismo de um módulo em si mesmo. Dito de outra forma, um endomorfismo é um homomorfismo $f in hom_R (M, M)$.

Um _automorfismo_ é um endomorfismo que também é um isomorfismo.

Denotamos o conjunto de todos os endomorfismos sobre um $R$-módulo $M$ por $end_R (M)$, e o conjunto de todos os automorfismos por $aut_R (M)$.


A relação $iso$ que existe entre dois módulos isomorfos é uma relação de equivalência.

  Em primeiro lugar, $iso$ é simétrica, uma vez que a função identidade $id_M$ é um isomorfismo de um módulo $M$ em si mesmo.

  Em segundo lugar, $iso$ é reflexiva, uma vez que se $M iso N$, então existe um isomorfismo $f in hom_R (M, N)$ entre $M$ e $N$. Mas daí, o seu inverso é um isomorfismo entre $N$ e $M$, e portanto $N iso M$.

  Por fim, $iso$ é transitiva, uma vez que se $M iso N$ e $N iso O$, então existem $f in hom_R (M, N)$ e $g in hom_R (N, O)$ e $f compose g$ é um isomorfismo de $M$ em $O$ e portanto $M iso O$, uma vez que a composição de homomorfismos é um homomorfismo e a composição de bijeções é uma bijeção. 


//   Se $R$ é um anel comutativo e $M$ é um $R$-módulo, então a aplicação $Phi : hom_R (R, M) -> M$ dada por
//   $ Phi(alpha) := alpha(1) $
//   é um isomorfismo de módulos.

//     Com efeito, temos que
//     $
//     Phi(alpha + beta)
//     =
//     [alpha + beta](1)
//     =
//     alpha(1) + beta(1)
//     =
//     Phi(alpha) + Phi(beta)
//     $
//     e também que
//     $
//     Phi(r alpha)
//     =
//     [r alpha](1)
//     =
//     r alpha(1)
//     =
//     r Phi(alpha)
//     $
//     para $alpha, beta in hom_R (R, M)$ e $r in R$, donde $Phi in hom_R (hom_R (R, M), M)$.

//     Além disso, 


Se $M$ e $N$ são módulos sobre um anel $R$ e $f in hom_R (M, N)$, então
+ o _núcleo de $f$_ é denotado por $ker f$ e definido como o conjunto
  $ ker f := f^(-1) (0_N) = {m in M | f(m) = 0_N} subset.eq M $
+ a _imagem de $f$_ é denotada por $im f$ e definida como o conjunto
  $ im f := f(M) = {f(m) | m in M} subset.eq N. $


Se $M$ e $N$ são $R$-módulos e $f in hom_R (M, N)$, então $ker f <= M$ e $im f <= N$.

  Em primeiro lugar, se $x, y in ker f subset.eq M$, então $f x = f y = 0_N$. Mas daí, temos que
  $ f (x + y) = f (x) + f (y) = 0_N + 0_N = 0_N $
  e portanto $x + i in ker f$. Além disso, se $r in R$, então
  $ f (r x) = r f (x) = f 0_N = 0_N $
  e portanto $r x in ker f$. Sendo assim, $ker f <= M$.

  Em segundo lugar, se $x, y in im f subset.eq N$, então $x = f (m)$ e $y = f (n)$ com $m, n in M$. Mas daí, temos que
  $ x + y = f (m) + f (n) = f (m + n) in im f. $
  Além disso, se $r in R$, então
  $ r x = r f (m) = f (r m) in im f. $
  Sendo assim, $im f <= N$. 


Se $M$ e $N$ são $R$-módulos e $f in hom_R (M, N)$, então $f$ é injetivo se e somente se $ker f = {0_M}$.

  Com efeito, sempre ocorre que $0_M in ker f$, uma vez que $f(0_M) = 0_N$. Daí, se $|ker f| != 1$, então $f$ deixa de ser injetiva, porque haveria pelo menos algum outro $x in M$ tal que $f(x) = 0_N$ também. Por outro lado, assumindo que $ker f = {0_M}$, se ocorre que $f(x) = f(y)$ então
  $ 0_N = f(x) - f(y) = f(x - y) $
  donde $x - y = 0_M$ e portanto $x = y$, tornando $f$ injetiva.

== módulos quocientes


Se $M$ é um $R$-módulo e $N <= M$, então a relação $~^(N)$ em $M$ definida por
$ x ~^N y <=> x - y in N $
é uma relação de equivalência.

  Em primeiro lugar, $~^N$ é reflexiva, uma vez que se $x in M$, então $x - x = 0 in N$ e portanto $x ~^N x$.

  Em segundo lugar, $~^N$ é simétrica, uma vez que se $x ~^N y$ então $x - y in N$, e como $N$ é um subgrupo, temos que $-(x - y) = y - x in N$ e portanto $y ~^N x$.

  Por fim, $~$ é transitiva, uma vez que se $x ~^N y$ e $y ~^N z$ então $x - y in N$ e $y - z in N$, ou seja, $x - y + y - z in N$, donde, $x - z in N$ e portanto $x ~^N z$.  


O _módulo quociente_ de um $R$-módulo $M$ por um submódulo $N <= M$ é denotado por $M \/ N$ e definido como o conjunto quociente $M \/ ~^N$. Dado $m in M$, denotamos a sua classe de equivalência por $[m]_N in M \/ N$.


O módulo quociente de um $R$-módulo $M$ por um submódulo $N <= M$ é um $R$-módulo com as operações#footnote[escrevendo $[m]$ no lugar de $[m]_N$ porque não há ambiguidade]
$
[x] + [y]
&:=
[x + y] \

r [x]
&:=
[r x]
$
para $x, y in M$ e $r in R$.

  Primeiro, vamos mostrar que essas operações fazem sentido.
  
  Afirmo que se $[x] = [x']$ e $[y] = [y']$ com $x, x', y, y' in M$, então $[x] + [y] = [x'] + [y']$. Com efeito, temos que $x - x' in N$ e $y - y' in N$. Daí, temos que
  $
  (x + y) - (x' + y')
  =
  x - x' + y - y' in N
  $
  donde $[x] + [y] = [x + y] = [x' + y'] = [x'] + [y']$.

  Além disso, afirmo que se $[x] = [x']$ e $r in R$, então $r[x] = r[x']$. Com efeito, temos que $x - x' in N$. Daí, temos que
  $ r (x - x') = r x - r x' in N $
  donde $r [x] = [r x] = [r x'] = r [x']$.

  Agora, vamos mostrar que#footnote[escrevendo $~$ no lugar de $~^N$ porque não há ambiguidade] $M \/ ~$ é um grupo abeliano com respeito à soma definida acima. Resta mostrar que a soma é associativa, que ela possui identidade, e que existem inversos.
  
  Com efeito, temos que
  $
  ([x] + [y]) + [z]
  &=
  [x + y] + [z] \
  &=
  [(x + y) + z] \
  &=
  [x + (y + z)] \
  &=
  [x] + [y + z] \
  &=
  [x] + ([y] + [z])
  $
  para todos $x, y, z in M$.
  
  Além disso, temos que se $n in N$ e $x in M$, então $(x + n) ~ x$ uma vez que
  $ x - n - x = x - x - n = 0_M - n in N $
  e portanto $[x + n] = [x] + [x] = [x]$, donde $[n]$ é a identidade do grupo aditivo de $M \/ ~$.

  Por fim, se $x in M$, então $[-x] + [x] = [-x + x] = [0_M]$. Como $0_M in N$, temos que $[0_M] = [n]$ para $n in N$, e portanto $[-x]$ é o inverso de $[x]$.

  Resta mostrar que a multiplicação por escalar tem as propriedades desejadas. Com efeito, temos que
  $
  r (s [x]) = r [s x] = [r s x] = [(r s) x] = (r s)[x]
  $
  $
  (r + s)[x] = [(r + s) x] = [r x + s x] = [r x] + [s x] = r [x] + s [x]
  $
  $
  r [(x + y)] = [r (x + y)] = [r x + r y] = [r x] + [r y] = r [x] + r [y]
  $
  $
  1 [x] = [1 x] = [x]
  $
  para todos $x, y in M$, $r, s in R$.  


A _projeção canônica_ em um submódulo $N$ de um $R$-módulo $M$ é a aplicação $pi_N : M -> M\/N$ tal que
$ pi_N (m) = [m]_N $
para $m in M$.


A projeção canônica é um homomorfismo do $R$-módulo $M$ no quociente $M\/N$ onde $N  <= M$.

Dito de outra forma, se $M$ é um $R$-módulo e $N <= M$ é um submódulo de $M$, então $pi_N in hom_R (M, M\/N)$.


  Com efeito, temos que
  $ pi_N (x + y) = [x + y]_N = [x]_N + [y]_N = pi_N (x) + pi_N (y) $
  e também que
  $ pi_N (r x) = [r x]_N = r [x]_N = r pi_N (x) $
  para todos $x, y in M$ e $r in R$. 



//   $ phi ([x]) = f (x) $


//   Em primeiro lugar, vamos mostrar que $f'$ é bem definida. Dados $w, x in M$ tais que $[w] = [x]$, temos que $w - x in ker f$, e portanto
//   $
//   f (w) = f (w + 0_M) = f (w - x + x) = f (w - x) + f (x) = 0_N + f (x) = f (x)
//   $
//   donde
//   $ phi([x]) = f(x) = f(w) = phi([w]). $


$
phi ([x] + [y])
=
phi ([x + y])
=
f (x + y)
=
f (x) + f (y)
=
phi ([x]) + phi ([y])
$
e também que
$
phi (r [x]) = phi ([r x]) = f (r x) = r f (x) = r phi ([x])
$


Em terceiro lugar, vamos mostrar que $phi$ é injetiva. Com efeito, temos que se $phi([x]) = f(x) = 0_N$ se e somente se $x in ker$ portanto $phi$ é injetiva.

Por fim, vamos mostrar que $phi$ é sobrejetiva. Com efeito, dado $y in im f$, temos que $y = f(x)$ para algum $x in M$. Mas daí, temos que $phi([x]) = f(x) = y$, e portanto $phi$ é sobrejetiva.

= espaços vetoriais


Um _espaço vetorial_ é um módulo sobre um corpo. Chamamos os elementos de um espaço vetorial de _vetores_.


Se $KK$ é um corpo qualquer, então o conjunto $KK^n := {(x_1, ..., x_n) | x_i in KK}$ com $n in NN$ com as operações
$
(x_1, ..., x_n) + (y_1, ..., y_n)
&:=
(x_1 + y_1, ..., x_n + y_n) \

k (x_1, ..., x_n)
&:=
(k x_1, ..., k x_n)
$
forma um espaço vetorial sobre $KK$, cujo vetor nulo é $zero = (0, 0, ..., 0)$.