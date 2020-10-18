
echo "WELCOME TO FLIP COMBINATION SIMULATION"

declare -A singlet

heads=0
tails=0
read -p "HOW MANY TIMES YOU WANT TO FLIP THE COIN" n

for((i=1;i<=$n;i++))
do
     flip=$((RANDOM%2))
     singlet[$i]=$flip
     if [ $flip -eq 1 ]
     then
	#echo "HEADS"
	heads=$(($heads+1))
     elif [ $flip -eq 0 ]
     then
	#echo "TAILS"
	tails=$(($tails+1))

    fi
done

echo "STORED IN singlet DICTIONARY"

echo ${singlet[@]}
echo "HEADS="$heads
echo "TAILS="$tails
hp=$(((heads*100)/$n))
tp=$(((tails*100)/$n))
echo "HEAD PERCENTAGE IS $hp% "
echo "TAIL PERCENTAGE IS $tp%"
