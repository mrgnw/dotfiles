
ec2(){
    filters="$1"
    baseQuery='.Reservations[].Instances[]'
    flattenObjs='(.Tags | map( {(.Key): .Value} ) | add)'
    filterByKeys='with_entries(select([.key] | inside(["PrivateDnsName", "InstanceType"])))'

    aws ec2 describe-instances --filters "$filters" | jq "$baseQuery | $flattenObjs * $filterByKeys"    
    # todo: jq filter by [key1=value1, key2=value2]
}
