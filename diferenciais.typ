#import "config.typ": *

#set document(
  title: "Formalizando os diferenciais",
  date: datetime.today(),
  keywords: ("CALC", "ODE")
)

#show: style

#heading(context document.title)

$
  (dif y)/(dif x) = f(x) g(y)

  ==>

  1 / g(y) dif y = f(x) dif x

  ==>

  integral 1/g(y) dif y = integral f(x) dif x
$