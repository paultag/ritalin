(import [hy [HyExpression]])


(setv *flags* {'-- "--"
               '-> "->"})


(defn attr-to-str [el]
  (let [[(, attr value) el]]
    (.format "{}=\"{}\"" (slice attr 2) value)))


(defn node-attr-to-str [el]
  (+ "[" (attr-to-str el) "]"))


(defn el-to-str [el]
  (cond [(instance? list el) (node-attr-to-str el)]
        [true (if (in el *flags*) (get *flags* el) (str el))]))


(defn inner-block-to-stream [el]
  (cond [(instance? HyExpression el) (+ "  " (.join " " (map el-to-str el)) ";")]
        [(instance? list el)         (+ "  " (el-to-str el))]))


(defn inner-blocks-to-stream [els]
  (yield-from (map inner-block-to-stream els)))


(defn blocks-to-stream [name els]
  (yield (+ "graph " name " {"))
  (yield-from (inner-blocks-to-stream els))
  (yield "}"))


(defmacro graph [name &rest els]
  (let [[gbuf (blocks-to-stream name els)]]
    (.join "\n" gbuf)))
