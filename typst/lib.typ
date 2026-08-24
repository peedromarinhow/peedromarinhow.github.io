#import "@preview/quick-maths:0.2.1": shorthands

#let (
  aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm,
  nn, oo, pp, qq, rr, ss, tt, uu, vv, ww, xx, yy, zz
) = (
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
  "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
).map(math.bold)

#let (
  Aa, Bb, Cc, Dd, Ee, Ff, Gg, Hh, Ii, Jj, Kk, Ll, Mm,
  Nn, Oo, Pp, Qq, Rr, Ss, Tt, Uu, Vv, Ww, Xx, Yy, zz
) = (
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
  "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
).map(math.bold)

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

#let car = math.op("car")

#let teo(body, caption: []) = figure(
  kind: "teorema",
  supplement: "teorema",
  numbering: "1",
  caption: figure.caption(position: top, caption),
  body
)
#let lem(body, caption: []) = figure(
  kind: "lema",
  supplement: "lema",
  numbering: "1",
  caption: figure.caption(position: top, caption),
  body
)
#let cor(body, caption: []) = figure(
  kind: "corolário",
  supplement: "corolário",
  numbering: none,
  caption: figure.caption(position: top, caption),
  body
)
#let pro(body, caption: []) = figure(
  kind: "prova",
  supplement: "prova",
  numbering: none,
  caption: figure.caption(position: top, caption),
  body
)
#let def(body, caption: []) = figure(
  kind: "definição",
  supplement: "definição",
  numbering: "1",
  caption: figure.caption(position: top, caption),
  body
)
#let prp(body, caption: []) = figure(
  kind: "proposição",
  supplement: "proposição",
  numbering: none,
  caption: figure.caption(position: top, caption),
  body
)
#let exm(body, caption: []) = figure(
  kind: "exemplo",
  supplement: "exemplo",
  numbering: "1",
  caption: figure.caption(position: top, caption),
  body
)

#let style(doc) = {
  show: shorthands.with(
    ($:=$, math.eq.delta),
    ($~=$, math.tilde.eq),
    ($<|$, math.chevron.l),
    ($|>$, math.chevron.r),
  )

  let thmcap(it) = html.figcaption(class: "side", {
    let sup = upper(it.supplement) + if it.numbering == none {none} else {" " + it.counter.display()}
    let cap = it.body
    html.span(style: "font-weight: 700", sup)
    if it.body != none {
      html.br()
      html.em(it.body)
    }
  })

  show figure: it => {
    if it.kind == "definição" or it.kind == "teorema" {
      html.figure(class: "box", thmcap(it.caption) + it.body)
    }
    else if (
      it.kind == "prova"
    ) {
      let qed = html.div(style: "position: absolute; bottom: 0; right: 0", math.qed)
      html.figure(thmcap(it.caption) + it.body + qed)
    }
    else if (
      it.kind == "lema" or it.kind == "prova" or it.kind == "proposição" or it.kind == "exemplo" or it.kind == "corolário"
    ) {
      html.figure(thmcap(it.caption) + it.body)
    }
    else {
      it
    }
  }

  doc
}

#let Styles = html.link(rel: "stylesheet", href: "./css/main.css")
#let Header = html.header[
  #html.img(src: "media/header.jpg")

  #link(<index>)[Início]
]

#let HtmlPage(Body) = {
  counter(figure.where(kind: "teorema")).update(0)
  counter(figure.where(kind: "lema")).update(0)
  counter(figure.where(kind: "definição")).update(0)
  counter(figure.where(kind: "exemplo")).update(0)

  html.head(Styles)
  Header
  html.main(Body)
}
