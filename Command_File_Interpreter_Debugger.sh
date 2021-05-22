

# This Script Execute Commands One By One
# It Holds the Screen After Each Command Execution untill User Presses Any Key
# So That He Can Observer Command Output and Proceed Further

# Need Command File Name as Input Parameter
# Manadatory

if [ "$#" -gt 0 ]
then
	command_file="$1"
else
	echo -e "\n\n\t\tPlease Pass Command File Name As Parameter\n\n";
	exit;
fi


#IFS=''
number=1

while read command
do
	echo -e "\n\t\t$number". "\t $command\n"
	
	# Assuming Every Line in File is a Valid Unix Command
	$command

	number=`expr "$number" + 1`

	# Wait for User Key Press ( Any Key )
	# It is Just him to Observe Command Output	
	read kuch_bhi < /dev/tty;

done < $command_file
