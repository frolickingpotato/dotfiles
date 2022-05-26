#!/bin/bash

expressions=("I refuse to stop trying to be a better person"
	     "εὐδαιμονία"
	     "Dasein understands existence by existing"
	     "The meaning of Dasein's Being is care"
	     "You are beautiful"
	     "Do the right thing"
	     "HATE: It was with the left hand that Brother Cain iced his brother"
	     "LOVE: These five fingers lead straight to the soul of man."
	     "If I love you, I love you. If I hate you..."
	     "Le vent se lève... ! Il faut tenter de vivre !"
	     "It is strange that you do not remember any of your poetry, William Blake"
	     "That weapon will replace your tongue. Your poetry will now be written with blood."
	     "I rather like not being a Bitch. It's sort of what we have instead of God."
	     "An admirable evasion of man to lay his disposition to the charge of a star!"
	     "Heaven is a place where nothing ever happens"
	     "Things fall apart"
	     "Turning and turning in the widening gyre, the falcon cannot hear the falconer"
	     "All the \"news\" that's \"fit\" to print"
	     #"道可道，非常道。名可名，非常名"
	     #"无，名天地之始；有，名万物之母"
     		)
RANDOM=$$$(date +%s)
string=("${expressions[$RANDOM % ${#expressions[@]}]}")
echo $string
sleep 10
