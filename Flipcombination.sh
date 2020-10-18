#!/bin/bash

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
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0

for((i=1;i<=$n;i++))
do
     flip1=$((RANDOM%2))
     flip2=$((RANDOM%2))
     flip3=$((RANDOM%2))
     triplet[$i]=$flip1$flip2$flip3

     if [ $flip1 -eq 1 -a $flip2 -eq 1 -a $flip3 -eq 1 ]
     then
        hhh=$(($hhh+1))
     elif [ $flip1 -eq 1 -a $flip2 -eq 1 -a $flip3 -eq 0 ]
     then
        hht=$(($hht+1))
      elif [ $flip1 -eq 0 -a $flip2 -eq 0 -a $flip3 -eq 1 ]
     then
        hth=$(($hth+1))
     elif [ $flip1 -eq 1 -a $flip2 -eq 0 -a $flip3 -eq 0 ]
     then
        htt=$(($htt+1))
     elif [ $flip1 -eq 0 -a $flip2 -eq 1 -a $flip3 -eq 1 ]
     then
        thh=$(($thh+1))
     elif [ $flip1 -eq 0 -a $flip2 -eq 1 -a $flip3 -eq 0 ]
     then
        tht=$(($tht+1))
      elif [ $flip1 -eq 0 -a $flip2 -eq 0 -a $flip3 -eq 1 ]
     then
        tth=$(($tth+1))
     elif [ $flip1 -eq 0 -a $flip2 -eq 0 -a $flip3 -eq 0 ]
     then
        ttt=$(($ttt+1))


     fi
done
echo ${triplet[@]}
hhhp=$(((hhh*100)/$n))
hhtp=$(((hht*100)/$n))
hthp=$(((hth*100)/$n))
http=$(((htt*100)/$n))
thhp=$(((thh*100)/$n))
thtp=$(((tht*100)/$n))
tthp=$(((tth*100)/$n))
tttp=$(((ttt*100)/$n))

echo "hhh percentage is $hhhp%"
echo "hht percentage is $hhtp%"
echo "hth percentage is $hthp%"
echo "htt percentage is $http%"
echo "thh percentage is $thhp%"
echo "tht percentage is $thtp%"
echo "tth percentage is $tthp%"
echo "ttt percentage is $tttp%"

echo "___________________________"

for((i=1;i<=${#singlet[@]};i++))
do
	for((j=$i;j<=${#singlet[@]};j++))
	do
	if [ ${singlet[$j]} -lt ${singlet[$i]} ]
	then
		temp=${singlet[$i]}
		singlet[$i]=${singlet[$j]}
		singlet[$j]=$temp
	fi
	done
done

echo "SORTED SINGLET DICTIONARY IS" ${singlet[@]}



for((i=1;i<=${#doublet[@]};i++))
do
	for((j=$i;j<=${#doublet[@]};j++))
	do
		if [ ${doublet[$j]} -lt ${doublet[$i]} ]
		then
		temp=${doublet[$i]}
		doublet[$i]=${doublet[$j]}
		doublet[$j]=$temp
		fi
	done
done

echo "SORTED DOUBLET DICTIONARY IS" ${doublet[@]}


max=1
p=${triplet[1]}
count=1

for((i=1;i<=${#triplet[@]};i++))
do
        for((j=$i;j<=${#triplet[@]};j++))
        do
                if [ ${triplet[$j]} -lt ${triplet[$i]} ]
                then
                temp=${triplet[$i]}
                triplet[$i]=${triplet[$j]}
                triplet[$j]=$temp
                fi
        done
#if [ ${triplet[$i]} -eq ${triplet[$(($i+1))]} ]
#then
#	count=$(($count+1))
#elif [ $count -gt $max ]
#then
#	max=$count
#	p = ${triplet[$(($i+1))]}
#fi
done

echo "SORTED TRIPLET DICTIONARY IS" ${triplet[@]}
#echo "MOST REPEATED ELEMENT IS $p"
