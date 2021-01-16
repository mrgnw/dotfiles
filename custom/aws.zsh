# Get rds address by identifier
rds-address(){
    pyenv activate current
    aws rds describe-db-instances --db-instance-identifier $1 | jq '.DBInstances[0].Endpoint.Address'
}
