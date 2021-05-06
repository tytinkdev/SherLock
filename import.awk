#!/usr/bin/awk -f

# This awk script is used to transform massive T4.tsv and Moriarty files from .tsv format to .csv
# It also is robust to problematic escape characters. 
# Additionally, it transforms the GHz column in T4 to the correct units, and drops the 'GHz' string from the end.
# Finally, it selects the correct columns from each file, depending on the filename. 
# The choice of awk for the task of data cleaning and reduction was purely based on its speed. 
# Awk is strong for line by line transformations, and was able to fix 26GB of data in under 20 minutes,
# reducing the size of our dataset to less than 6GB with correct format. 
# Further transformations are conducted in pySpark. 

BEGIN { FS="\t"; OFS="," } {
  if (FILENAME ~ /T4/){ 
    rebuilt=0 
    for(i=1; i<=NF; ++i) { 
      if ($i ~ /Hz/){ 
        $i = ($i + 0) 
        if ($i > 100) {$i*=.001} 
      } 
      if ($i ~ /,/ && $i !~ /^".*"$/) { 
        gsub("\"", "\"\"", $i) 
        $i = "\"" $i "\"" 
        rebuilt=1 
      } 
    } 
    if (!rebuilt) { $1=$1 } 
    print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26 
  } 
  else if (FILENAME ~ /Mor/) { 
    rebuilt=0 
    for(i=1; i<=NF; ++i) 
      if ($i ~ /,/ && $i !~ /^".*"$/) { 
        gsub("\"", "\"\"", $i) 
        $i = "\"" $i "\"" 
        rebuilt=1 
      } 
    if (!rebuilt) { $1=$1 } 
    print $1,$2,$3,$4,$5,$6,$7,$8 
  } 
} 