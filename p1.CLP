(deftemplate parent
 (slot parentName)
 (slot son)
 (slot gender (allowed-values f m))
)
(deftemplate grandMother
 (slot grand)
 (slot child)
)
(deftemplate grandFather
 (slot grand)
 (slot child)
)
(deffacts data 
 (parent (parentName "Ahmed") (son "Mohamemd") (gender m))
(parent (parentName "Mona") (son "Ali") (gender f))
(parent (parentName "Ali") (son "Sara") (gender m))	
(parent (parentName "Hassan") (son "Ahmed") (gender m))
)

( defrule gm 
	(parent (parentName ?name) (son ?son) (gender f))
	(parent (parentName ?oname) (son ?oson) (gender f|m))
	(test (eq ?oname ?son))
=>
    (printout t ?name " is grandMother of " ?oson crlf)
(assert 
   (grandMother (grand ?name) (child ?oson))
  )
)

( defrule gv 
	(parent (parentName ?name) (son ?son) (gender m))
	(parent (parentName ?oname) (son ?oson) (gender f|m))
	(test (eq ?son ?oname))
=>
    (printout t ?name " is grandFather of " ?oson crlf)
(assert 
   (grandFather (grand ?name) (child ?oson))
  )
)
(defrule parents (parent (parentName ?name) (son ?son) (gender ?gen&m|f))
 => 
  (printout t ?name " is parent of " ?son crlf)
  (assert 
   (parent (parentName ?name) (son ?son) (gender ?gen))
  )
)