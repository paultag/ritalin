(require ritalin.language)


(print (graph hello
  (a -> b -> d [:style dotted])
  (a -> b -> c [:color red])))
