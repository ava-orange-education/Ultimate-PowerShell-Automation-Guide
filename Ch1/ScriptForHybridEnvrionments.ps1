# On-Premises PowerShell

# Variables
$onPremisesSqlServer = "YourOnPremisesSqlServer"
$azureSqlServer = "YourAzureSqlServer"
$databaseName = "YourDatabase"

# Query data from on-premises SQL Server
$onPremisesQueryResult = Invoke-Sqlcmd -ServerInstance $onPremisesSqlServer -Database $databaseName -Query "SELECT * FROM YourTable"

Write-Host "On-Premises Query Result:"
$onPremisesQueryResult

# Query data from Azure SQL Database
$azureQueryResult = Invoke-Sqlcmd -ServerInstance $azureSqlServer -Database $databaseName -Query "SELECT * FROM YourTable"

Write-Host "Azure Query Result:"
$azureQueryResult
