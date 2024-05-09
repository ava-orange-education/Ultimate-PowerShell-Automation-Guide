# Creating a new user account 
New-ADUser -Name "Prashanth Jayaram" ` -AccountPassword (Read-Host -AsSecureString "Input User Password") ` 
-ChangePasswordAtLogon $True ` -Company "commvault" ` 
-Title "Architect" ` 
-State "Texas" `
-City "Dallas" `
-Description "Test Account Creation" ` 
-EmployeeNumber "1" ` 
-Department "Executives" ` 
-DisplayName "Prashanth Jayaram" `
-Country "us" ` 
 -PostalCode "90210" ` 
 -Enabled $True 


# Retrieving information about a specific user 
Get-ADUser -Identity "Prashanth Jayaram" 

# Changing the value of the 'Title' attribute for a user 
Set-ADUser -Identity "Prashanth Jayaram" -Title "Sales" 

# Retrieve specific properties for the user "Prashanth Jayaram" 
Get-ADUser -Identity "Prashanth Jayaram" -Properties * | Select-Object Name, Department, Title 

# Retrieve information for all users in the domain 
Get-ADUser -Filter * 

# Find all users with the name containing "Prashanth Jayaram" 
Get-ADUser -Filter {Name -like "*Prashanth Jayaram*"} 


# Retrieve names of all disabled user accounts 
Search-ADAccount -AccountDisabled | Select-Object Name 

# Disable the user account for "Prashanth Jayaram" 
Disable-ADAccount -Identity "Prashanth Jayaram" 

# Enable the user account for "Prashanth Jayaram" 
Enable-ADAccount -Identity "Prashanth Jayaram" 

# Find all accounts with passwords set never to expire 
 Get-ADUser -Filter * -Properties Name, PasswordNeverExpires | Where-Object {$_.PasswordNeverExpires -eq $true} | Select-Object DistinguishedName, Name, Enabled 

# Find all locked user accounts 
Search-ADAccount -LockedOut 

# Unlock the user account for "Prashanth Jayaram" 
Unlock-ADAccount -Identity "Prashanth Jayaram" 




