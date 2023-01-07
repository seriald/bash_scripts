
accountID="816563600800"
echo "Using Account ID $accountID"

echo ""
echo "Enter the Vault Name"
read vault

echo ""
echo "Enter the Job ID"
read jobID

echo ""
aws glacier get-job-output --vault-name $vault --account-id $accountID --job-id $jobID output.json
