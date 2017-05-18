#define parameters
#assume folderPath is an absolute path.
$folder = "folderPath"

#SqlServerName is something like balaji\MSSQLServer14
$ServerName = "SqlServerName"

$DbName = "DBName"

#fileName contains the list of files.
#We could have just executed the .sql files without having a file that contains the list of sql files.
#But there might be lot of dependencies (tables, constraints, functions). So fileName will be helpful in those cases
$fileName = "fileName"
#foldername, filename 
#read the lines from fileName
foreach($line in Get-Content $folder\$fileName){
	Write-Host $line
	Invoke-Sqlcmd -InputFile $folder\$line -ServerInstance $ServerName -Database $DbName
}
