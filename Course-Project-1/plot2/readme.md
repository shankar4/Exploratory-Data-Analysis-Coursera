Here, unlike plot1, I declared that strings should not be read as factors up front.
This made sure that with my read.table(), all character strings read in were not
considered to be factors. This makes sure that I can treat them as characters and
convert them to numeric or date values as appropriate easily.