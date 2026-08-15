#import "lib.typ": *
#show: style

#let css = html.link(rel: "stylesheet", href: "../css/main.css")

#document("index.html", title: [Index])[
  #html.head(css)
  #include "index.typ"
]

#document("algebra.html", title: [algebra])[
  #html.head(css)
  #include "algebra.typ"
]<algebra>
