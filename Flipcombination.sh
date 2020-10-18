
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
echo "_________________________"
hh=0
ht=0
th=0
tt=0
for((i=1;i<=$n;i++))
do
     flip1=$((RANDOM%2))
     flip2=$((RANDOM%2))
     doublet[$i]=$flip1$flip2
     if [ $flip1 -eq 1 -a $flip2 -eq 1 ]
     then
        hh=$(($hh+1))
     elif [ $flip1 -eq 1 -a $flip2 -eq 0 ]
     then
        ht=$(($ht+1))
      elif [ $flip1 -eq 0 -a $flip2 -eq 1 ]
     then
        th=$(($th+1))
     elif [ $flip1 -eq 0 -a $flip2 -eq 0 ]
     then
        tt=$(($tt+1))

     fi
done
echo ${doublet[@]}
hhp=$(((hh*100)/$n))
htp=$(((ht*100)/$n))
thp=$(((th*100)/$n))
ttp=$(((tt*100)/$n))

echo "ALL HEADS hh=$hh "
echo "HEAD and TAIL ht=$ht "
echo "TAIL AND HEAD th=$th "
echo "TAIL and TAIL tt=$tt "

echo "hh percentage is $hhp%"
echo "ht percentage is $htp%"
echo "th percentage is $thp%"
echo "tt percentage is $ttp%"

echo "_________________________"
