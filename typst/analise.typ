#import "lib.typ": *
#show: HtmlPage

= Analise

#teo(caption: [o limite de uma função via o limite de uma sequência], [
  Sejam $f : X subset RR -> RR$, $a in X'$ e $x_n$ uma sequência em $X$ tal que $x_n != a$ e $lim x_n = a$. Então
  $ lim_(x -> a) f = L " se e somente se " lim f(x_n) = L. $
])<t1>
#pro([
  *PARTE 1:* primeiro vamos provar que
  $ lim_(x -> a) f = L " implica " lim f(x_n) = L. $
  Sendo $lim_(x -> a) f = L$, dado $epsilon > 0$ existe um $delta$ tal que
  $ 0 < |x - a| < delta "com" x in X => |f(x) - L| < epsilon. $
  Mas, sendo $lim x_n = a$, dado $delta$ existe $n_0$ tal que
  $ n > n_0 => 0 < |x_n - a| < delta. $
  Daí, temos que dado $epsilon > 0$ existe $n_0$ tal que
  $ n > n_0 => |x_n - a| < delta => |f(x_n) - L| < epsilon $
  donde $lim f(x_n) = L$.

  *PARTE 2:* agora vamos provar que
  $ lim_(x -> a) f " implica " L => lim f(x_n) != L $
  De fato, sendo $lim_(x -> a) f != L$, existe $epsilon$ tal que para todo $delta$, mesmo que se tenha $0 < |x - a| < delta$ não se tem $|f(x) - L| < epsilon$. Daí, pondo $delta = 1/n$ por exemplo, podemos encontrar $x_n$ tal que $|x_n - a| < delta$ para todo $n > n_0$, mas sem que tenhamos $|f(x_n) - L| < epsilon$, donde $lim f(x_n) != L$ $qed$
])

#teo(caption: [do valor intermediário], [
  Seja $f : [a, b] -> RR$ contínua e seja $d in RR$ tal que $f(a) < d < f(b)$. Então existe $c in (a, b)$ tal que $f(c) = d$.
])
#pro([
  Seja $A = {x in [a,b] | f(x) < d}$. Vemos que $A != diameter$, já que $a in [a,b]$ e $f(a) < d$, donde pelo menos $a in A$. Mostraremos que $A$ não tem elemento máximo.
  
  Com efeito, seja $alpha in A$. Como $f(alpha) < d$, segue-se que $alpha != b$, e sendo $alpha in [a,b]$, concluímos que $alpha < b$. Tomando $epsilon = d - f(alpha)$, pela continuidade de $f$ em $alpha$, existe $delta > 0$ tal que
  $ x in [alpha, alpha + delta)
  &=> f(alpha) - epsilon < f(x) < f(alpha) + epsilon \
  &=> f(x) < f(alpha) + epsilon = d. $
  Tomando $delta$ pequeno o suficiente de modo que se tenha $alpha + delta < b$ temos que  se $x in [alpha, alpha + delta)$ então
  $ x >= alpha " e " x < alpha + delta < b. $
  Daí, todo ponto de $[alpha, alpha + delta)$ pertence a $[a, b]$ e é menor do que $d$, donde $[alpha, alpha + delta) subset A$, qualquer que seja $alpha$.  Segue-se então que $A$ não tem elemento máximo.

  Seja $c = sup A$. Então existe uma sequência $x_n$ de elementos em $A$ com $lim x_n = c$. Sendo $x_n in A$, temos que $x_n < d$ donde
  $ lim x_n = c <= d. $
  Mas como $A$ não tem maior elemento, $sup A = c in.not A$. Daí, temos que $c$ não é menor do que $d$, porque se fosse, pertenceria a $A$. Daí, concluímos que donde $c >= d$. Mas como $c <= d$, temos que $c = d$ $qed$
])

#teo([
  Seja $X subset RR$ compacto. Então se $f : X -> RR$ é contínua, $Y = f(X)$ também é compacto.
])<t3>
#pro([
  Seja $y_n$ uma sequência em $Y$. Então, para cada $n$ podemos encontrar $x_n in X$ tal que $f(x_n) = y_n$. Sendo $x_n in X$ e $X$ compacto, existe uma subsequência $x_n_k$ de $x_n$ que é converge para $x in X$. Sendo $f$ contínua, temos que
  $ lim f(x_n_k) = f(x) in f(X). $
  Daí, dada uma sequência $y_n$ de termos em $f(X)$, é possível encontrar uma subsequência
  $ y_n_k = f(x_n_k) $
  que converge para $y = f(x) in Y$. Daí, $f(X)$ é compacto $qed$
])

#cor(caption: [teorema de Weierstrass], [
  Seja $f : X subset RR -> RR$ contínua com $X$ compacto. Então $f$ atinge seus extremos em $X$, isto é, existem $x_"min", x_"max" in X$ tais que
  $ f(x_"min") <= f(x) <= f(x_"max") $
  para todo $x in X$.
])
#pro([
  Pelo @t3, $Y$ é compacto, e portanto é limitado e fechado. Daí, existem $sup f(X)$ e $inf f(X)$, e ambos pertencem a $Y$.
  Então, sendo $Y = f(X)$, existem $x_"min", x_"max" in X$ tais que $f(x_"min") = inf Y$ e $f(x_"max") = sup Y$. Como dado $y in Y$, temos que
  $ inf Y <= y <= sup Y $
  temos que
  $ f(x_"min") <= f(x) <= f(x_"max") $
  para todo $x in X$ $qed$
])

#teo([
  Seja $f : X subset RR -> RR$ e $I subset X$ um intervalo. Então $f(I)$ também é um intervalo.
])
#pro([
  Suponhamos primeiro que $f$ seja limitada em $I$. Sendo assim, existem $alpha = inf f(I)$ e $beta = sup f(I)$. Mostraremos que se $alpha < y < beta$ então $y in f(I)$, ou seja, existe $x in I$ tal que $f(x) = y$. De fato, pela definição de $inf$ e $sup$, existem $a, b in I$ tais que
  $ alpha <= f(a) < y < f(b) <= beta. $
  Daí, pelo teorema do valor intermediário, existe $x in [a, b] subset I$ tal que $f(x) = y$.

  Agora se $f$ não for limitada em $I$, então $inf f(I) = - infinity$ ou $sup f(I) = + infinity$, ou ambos. Ainda assim, vale o argumento acima, considerando um intervalo ilimitado $qed$
])

#teo([
  Seja $f : X subset RR -> RR$ contínua e injetiva com $X$ compacto. Então $Y = f(X)$ é compacto e $f^(-1) : Y -> RR$ é contínua.
])
#pro(caption: [por contradição], [
  Pelo @t3, temos que $Y = f(X)$ é compacto, uma vez que $f$ é contínua e $X$ é compacto.

  Para mostrar que $g$ é contínua em $Y$, vamos mostrar que dado $b = f(a) in Y$, $g$ é contínua em $b$. Com efeito, se não fosse assim, existiria uma sequência $y_n$ em $Y$ tal que $lim y_n = b$ mas $lim g(y_n) != g(b)$, ou seja, existe $epsilon > 0$ tal que $|g(y_n) - g(b)| >= epsilon$ para todo $n$.
  
  Seja $x_n = g(y_n)$. Daí, como $x_n in X$ e $X$ é compacto, existe uma subsequência $x_n_k$ de $x_n$ com $lim x_n_k = a'$. A essa subsequência corresponde uma subsequência $y_n_k$ de $y_n$ com $lim y_n_k = b$. Daí, temos que
  $ abs(g(y_n_k) - g(b)) = |x_n_k - a| >= epsilon $
  donde $x_n_k >= a + epsilon$. Daí, $lim x_n_k = a' >= a + epsilon$, e em particular $a' != a$. Mas sendo $f$ contínua em $a'$, temos que
  $ lim f(x_n_k) = f(a'). $
  Mas como
  $ f(x_n_k) = y_n_k " e " lim y_n_k = b $
  temos que $f(a') = b = f(a)$, em contradição com a injetividade de $f$. Daí, deve ser que $g$ é contínua $qed$
])

#teo([
  Seja $X subset RR$ compacto. Então se $f : X -> RR$ é contínua, $f$ também é uniformemente contínua.
])
#pro(caption: [por absurdo], [
  Suponhamos que $f$ não seja uniformemente contínua. Daí, existiriam $epsilon > 0$ e sequências $x_n$ e $y_n$ tais que
  $ |x_n - y_n| < 1/n " mas ainda assim " |f(x_n) - f(y_n)| >= epsilon. $
  Sendo $X$ compacto e $x_n$ uma sequência em $X$, existe uma subsequência $x_n_k$ que converge para algum número $x in X$. Sendo $|x_n - y_n| < 1/n$, existe também uma subsequência $y_n_k$ com $lim y_n_k = x$. Mas como $f$ é contínua
  $ lim f(x_n_k) = lim f(y_n_k) = f(x) $
  em contradição com a desigualdade
  $ |f(x_n) - f(y_n)| >= epsilon $
  que deveria valer para todo $n$. Daí, $f$ deve ser uniformemente contínua $qed
  $ 
])

