+++
title = "List"
+++

# List
a list is made by repeatedly forming a pair:
`[1,2,3]` is `(1, (2, (3, nil) ) )`

**definition**
- constructor for empty list:
	- nil := λxy.y
- constructor for cons:
	- cons := λht.λz.z h t

then:
- nil = λxy.y
- cons H T =β λz.z H T

**head and tail**
- head := λl.l (λht.h)
- tail := λl.l (λht.t)
