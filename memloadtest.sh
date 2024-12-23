while :

do

	mem_used=`free -m | head -2 | tail -1 | awk '{ print $3 }'`

	total_mem=`free -m | head -2 | tail -1 | awk '{ print $2 }'`

	echo "memory used is:$mem_used "

	echo "total memory is: $total_mem"

	mem_used_percentage=`expr $mem_used \* 100 / $total_mem`

	echo "meory used percentage : $mem_used_percentage"

	echo -e "`date +"%r %D"` \t$mem_used_percentage" >> mem_report.tsv

	if [[ $mem_used_percentage -ge 80 ]]

	then 

		echo "Security alarm for memory" | espeak-ng

	fi

	sleep 5

done