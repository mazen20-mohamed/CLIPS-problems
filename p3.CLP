(deftemplate student
   (slot name)
(multislot grade (type INTEGER))) 
(defrule closeOutputFile 
 =>
(close theOut)
)
(defrule output
(student (name ?name) (grade ?a ?b ?c ?d))
 =>
(bind ?val (+ ?a ?b))
(bind ?val (+ ?val ?c))
(bind ?val (+ ?val ?d))
(bind ?val (/ ?val 4))
(printout theOut ?name " ("?a " " ?b " "?c " "?d " ) "?val crlf)
)
(defrule state
   =>
   (open "data.txt" theFile "r")
   (bind ?data (readline theFile))
   (while (neq ?data EOF)
	(bind ?string (explode$ ?data))
	(bind ?name (nth$ 1 ?string))
	(bind $?grade (rest$ ?string))
	(assert (student (name ?name) (grade $?grade)))
      (bind ?data (readline theFile))
      )
   (close theFile)
)
(defrule openOutputFile 
 =>
(open "output.txt" theOut "w")
)