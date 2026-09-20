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

#let (
  aalpha,   bbeta,  ggamma,   ddelta,
  eepsilon, zzeta,  eeta,     ttheta,
  iiota,    kkappa, llambda,  mmu,
  nnu,      xxi,    oomicron, ppi,
  rrho,     ssigma, ttau,     uupsilon,
  pphi,     cchi,   ppsi,     oomega
) = (
  math.alpha,   math.beta,  math.gamma,   math.delta,
  math.epsilon, math.zeta,  math.eta,     math.theta,
  math.iota,    math.kappa, math.lambda,  math.mu,
  math.nu,      math.xi,    math.omicron, math.pi,
  math.rho,     math.sigma, math.tau,     math.upsilon,
  math.phi,     math.chi,   math.psi,     math.omega
).map(math.bold)

#let (
  Aalpha,   Bbeta,  Ggamma,   Ddelta,
  Eepsilon, Zzeta,  Eeta,     Ttheta,
  Iiota,    Kkappa, Llambda,  Mmu,
  Nnu,      Xxi,    Oomicron, Ppi,
  Rrho,     Ssigma, Ttau,     Uupsilon,
  Pphi,     Cchi,   Ppsi,     Oomega
) = (
  math.Alpha,   math.Beta,  math.Gamma,   math.Delta,
  math.Epsilon, math.Zeta,  math.Eta,     math.Theta,
  math.Iota,    math.Kappa, math.Lambda,  math.Mu,
  math.Nu,      math.Xi,    math.Omicron, math.Pi,
  math.Rho,     math.Sigma, math.Tau,     math.Upsilon,
  math.Phi,     math.Chi,   math.Psi,     math.Omega
).map(math.bold)

#let tensor = math.times.o
#let direct = math.plus.o

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

#let def = figure.with(kind: "sidefig-boxed", caption: [], supplement: [Definição])
#let teo = figure.with(kind: "sidefig-boxed", caption: [], supplement: [Teorema])
#let lem = figure.with(kind: "sidefig-nobox", caption: [], supplement: [Lema])
#let cor = figure.with(kind: "sidefig-nobox", caption: [], supplement: [Corolário])
#let prp = figure.with(kind: "sidefig-nobox", caption: [], supplement: [Proposição])
#let pro = figure.with(kind: "sidefig-nobox", caption: [], supplement: [Prova], numbering: none)
#let exm = figure.with(kind: "sidefig-nobox", caption: [], supplement: [Exemplo])

#let style(
  body
) = {
  show: shorthands.with(
    ($:=$, math.eq.delta),
    ($~=$, math.tilde.eq),
    ($<|$, math.chevron.l),
    ($|>$, math.chevron.r),
  )

  let sidefig-cap(it) = html.figcaption(class: "side", {
    let sup = upper(it.supplement) + if it.numbering == none {none} else [~#it.counter.display()]
    let cap = it.body
    html.span(style: "font-weight: 700", sup)
    if it.body != none {
      html.br()
      html.em(it.body)
    }
  })

  show figure.where(kind: "sidefig-nobox"): it => {
    html.figure(sidefig-cap(it.caption) + it.body)
  }
  show figure.where(kind: "sidefig-boxed"): it => {
    html.figure(class: "box", sidefig-cap(it.caption) + it.body)
  }

  html.html({
    html.head({
      html.link(rel: "stylesheet", href: "./main.css")
      html.title(context document.title)
    })

    html.header({
      html.img(src: "media/header.jpg")
      html.nav(
        html.ul({
          html.li(link(<index>, [início]))
          html.li(link(<sobre>, [sobre]))
        })
      )
    })

    html.body(
      html.main(body)
    )
  })
}
