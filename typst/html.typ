#import "lib.typ": *
#show: style

#document("index.html", title: [Index])[
  #html.head(Styles)

  #Header
  
  #html.main[

    = Pedro da Cruz

    #link(<medida>)[medida]

    #link(<tensores>)[tensores]

    #link(<analise>)[análise]
  ]
]<index>

#document("medida.html", include "medida.typ")<medida>
#document("tensores.html", include "tensores.typ")<tensores>
#document("analise.html", include "analise.typ")<analise>
