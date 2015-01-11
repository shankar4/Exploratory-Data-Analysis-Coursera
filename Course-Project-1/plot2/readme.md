Here, unlike plot1, I declared that strings should not be read as factors up front.
This made sure that with my read.table(), all character strings read in were not
considered to be factors. This makes sure that I can treat them as characters and
convert them to numeric or date values as appropriate easily.
With regard to labels, the lubridate package yields the label for day 1 as
"Thurs", but the professor hard-coded the three days and hence has "Thu" etc.
The other two ("Fri" and "Sat") are the same in lubridate (and hence R) and the
hardcoding. One more thing: I noticed that I should have put the "Sat" label at
location of 2800, not 2799. Will fix it another time!
