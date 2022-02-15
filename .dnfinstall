#!/bin/bash

clear

COLUMNS=$(tput cols) 
title="====================================================="
title1="DNF Fuzzy Finder"
title2="====================================================="
title3="To chose more then one package use <TAB> key"
title4="Below, list of all package "

printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
printf "%*s\n" $(((${#title1}+$COLUMNS)/2)) "$title1"
printf "%*s\n" $(((${#title2}+$COLUMNS)/2)) "$title2"
printf "%*s\n" $(((${#title3}+$COLUMNS)/2)) "$title3"
printf "%*s\n" $(((${#title4}+$COLUMNS)/2)) "$title4"
 

dnf list |tail -n +3| awk -F . '{print $1}'| fzf --height=90% --border --multi --cycle --reverse --preview 'dnf info {1}|tail -n +2|sed "s|Zainstalowane pakiety|\nZainstalowany \n|g"|sed "s|Dostępne pakiety|\nNIE Zainstalowany\nDostępny do instalacji\n|g"' --preview-window=:57%:wrap| xargs -or sudo dnf install""

