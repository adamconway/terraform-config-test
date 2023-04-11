# Config Example

## Running for each team:

Team 1:
```
terraform plan --state=team1.state --var team_name=team1 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID" 
terraform apply --state=team1.state --var team_name=team1 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID" 
terraform destroy --state=team1.state --var team_name=team1 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID" 
```

Team 2:
```
terraform plan --state=team2.state --var team_name=team2 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID"     
terraform apply --state=team2.state --var team_name=team2 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID" 
terraform destroy --state=team2.state --var team_name=team2 -var subscription_id="SUBSCRIPTION_ID" -var tenant_id="TENANT_ID" 
