#!/bin/bash                                                                      
# pdftk "$1" output - uncompress | \
# awk '                                                                            
#   /^1 1 1 / {                                                                    
#     sub(/1 1 1 /,"0 0 0 ",$0);                                                   
#     print;                                                                       
#     next;                                                                        
#   }                                                                              

#   /^0 0 0 / {                                                                    
#     sub(/0 0 0 /,"1 1 1 ",$0);                                                   
#     print;                                                                       
#     next;                                                                        
#   }                                                                              

#   { print }' | \
# pdftk - output "${1/%.pdf/_inverted.pdf}" compress

gs -o "${1/%.pdf/_inverted.pdf}"    \
   -sDEVICE=pdfwrite  \
   -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" \
   -f $1