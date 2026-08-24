#set page(width: auto, height: auto, fill: black)
#set text(fill: yellow.desaturate(50%), font: "Libertinus Sans")
#show math.equation: set text(font: "Euler Math")

And where we look for some  $p_c$ in the intersection
$
  {
    Y in
    times.o.big_(U subset.eq cal(W))
    "Hom"_(EE) (U^-, frak(M)_A^dagger)
    mid(|)
    mu["co"("spec" Y^dagger_+)] < delta_"min"
  }
  inter "Hom"_cal(O) (S arrow.hook.l)
$
such that $norm(p_c (x))_B^1 << kappa^+$ where
$
kappa^+ = min_(p in "UF"_g (q)) max_(norm(z) <= 1) " " abs(p(z))
$