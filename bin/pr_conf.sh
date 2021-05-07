#!/bin/bash

user=chuckjones
limit=5

datasize=`psql -X -A $ADDBNAME -U $user -h test -t -c "select count(*) from main_select;"`
srid=`psql -X -A -d $ADDBNAME -U $user  -h test -t -c "select srid from main_select order by srid desc limit 1"`
branch_name=`psql -X -A -d $ADDBNAME -U $user  -h test -t -c "select branch_name from main_select limit 1"`

branch_name="${branch_name// /_}"
branch_name="${branch_name//,/}"
branch_name="${branch_name//./}"

if [[ $datasize -lt $limit ]]; then
	range=$datasize
	max_srid=`echo "($srid + $range)" | bc`
else
	range=5
	max_srid=`echo "($srid + $range)" | bc`
fi
