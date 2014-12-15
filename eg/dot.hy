(require ritalin.language)


(print (digraph hello
  (a [:color red])
  (a -> b -> d [:style dotted])
  (a -> b -> c [:color red])))
