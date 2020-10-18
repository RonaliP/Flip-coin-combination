
echo "WELCOME TO FLIP COMBINATION SIMULATION"

flip=$((RANDOM%2))
if [ $flip -eq 1 ]
then
	echo "HEADS"
elif [ $flip -eq 0 ]
then
	echo "TAILS"
fi
