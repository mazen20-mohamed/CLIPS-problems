(deftemplate country
	(multislot name)
	(multislot color)
)
(deftemplate query 
	(slot col)
)
(deffacts countries
(country (name Egypt) (color Red White Black))
(country (name United states) (color Red White Blue))
(country (name Belgium) (color Black Yellow Red))
(country (name Sweden) (color Yellow Blue))
(country (name Italy) (color Green White Red))
(country (name Ireland) (color Green White Orange))
(country (name Greece) (color White Blue))
)
(defrule countryname 
	(query (col ?x))
	(country (name $?n) (color $?z ?x $?b))
=>
(printout t $?n " country" crlf))
)


(defrule reading-input
   =>
   (printout t "Enter the color: " )
   (bind ?q (read))
   (assert (query (col ?q)))
)
