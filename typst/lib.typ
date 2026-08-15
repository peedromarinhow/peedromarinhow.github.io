#import "@preview/quick-maths:0.2.1": shorthands

#let tensor = math.times.o
#let dir = math.plus.o

#let mul = math.cal("M")
#let fun = math.cal("F")
#let con = math.cal("C")
#let pow = math.cal("P")

#let iso = math.tilde.eq

#let hom = math.op("Hom")
#let lin = math.op("Lin")
#let alt = math.op("Alt")
#let sym = math.op("Sym")
#let end = math.op("End")
#let aut = math.op("Aut")
#let ten = math.op("Ten")

#let style(doc) = {
  show: shorthands.with(
    ($:=$, math.eq.delta),
    ($~=$, math.tilde.eq),
    ($<|$, math.chevron.l),
    ($|>$, math.chevron.r),
  )

  doc
}
