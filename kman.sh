line0="__      __   _                    _  __"
line1="\ \    / /__| |__ ___ _ __  ___  | |/ /_ __  __ _ _ _"
line2=" \ \/\/ / -_) / _/ _ \ '  \/ -_) | ' <| '  \/ _' | ' \ "
line3="  \_/\_/\___|_\__\___/_|_|_\___| |_|\_\_|_|_\__,_|_||_|"
numCols=$(tput cols)
numRows=$(tput lines)
whitespace=-1
hOffset=-1
vOffset=-1
max=0
space=''

# echo ${#line0}
# echo ${#line1}
# echo ${#line2}
# echo ${#line3}
# echo $numCols

whitespace=`expr $numCols - ${#line3}`
isHeven=`expr $whitespace % 2`
vSpace=`expr $numRows - 4`
isVeven=`expr $vSpace % 2`

# Handle Horizontal Offset
if [ $isHeven == 0 ]; then
    hOffset=`expr $whitespace / 2`
    for (( i = 0; i < $hOffset; i++ )); do
        space+=' '
    done
else
    ws=`expr $whitespace + 1`
    hOffset=`expr $ws / 2`
    for (( i = 0; i < $hOffset; i++ )); do
        space+=' '
    done
fi
# Handle Vertical Offset
# if [ $isVeven == 0 ]; then
#     vOffset=`expr $vSpace / 2`
# else


clear

printf '%s' "$space"

printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
printf '%s%s\n' "$space" "$line0"
printf '%s%s\n' "$space" "$line1"
printf '%s%s\n' "$space" "$line2"
printf '%s%s\n' "$space" "$line3"
printf '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'

sleep 3
clear
