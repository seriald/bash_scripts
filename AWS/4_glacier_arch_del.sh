
accountID = "816563600800"
echo "Using the Account ID $accountID"

echo "Enter the Vault name"
read vault

echo "Enter the ArchiveID"
read archiveID

aws glacier delete-archive --vault-name NAS03_0011322FDC65_1 --account-id 816563600800 --archive-id *** archiveid ***

