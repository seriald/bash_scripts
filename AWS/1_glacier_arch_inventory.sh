accountID="816563600800"
echo "Using Account ID $accountID"

echo ""
echo "Enter the Vault Name"
read vault

echo ""
aws glacier initiate-job --vault-name $vault --account-id $accountID --job-parameters "{\"Type\":\"inventory-retrieval\"}"
