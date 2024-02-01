
$code = @'
using System.IO;
using System.Management.Automation;

namespace CustomCmdlet
{
    [Cmdlet("Get", "FileDetails")]
    public class GetFileDetailsCommand : Cmdlet
    {
        [Parameter(Position = 0, Mandatory = true, ValueFromPipeline = true, ValueFromPipelineByPropertyName = true)]
        public string Path { get; set; }

        protected override void ProcessRecord()
        {
            // Check if the specified path exists
            if (Directory.Exists(Path))
            {
                // Get file details and write them to the output
                foreach (string filePath in Directory.GetFiles(Path))
                {
                    FileInfo fileInfo = new FileInfo(filePath);

                    // Create a custom object with file details
                    PSObject fileDetails = new PSObject();
                    fileDetails.Properties.Add(new PSNoteProperty("FileName", fileInfo.Name));
                    fileDetails.Properties.Add(new PSNoteProperty("FileSizeInBytes", fileInfo.Length));
                    fileDetails.Properties.Add(new PSNoteProperty("CreationTime", fileInfo.CreationTime));
                    fileDetails.Properties.Add(new PSNoteProperty("LastAccessTime", fileInfo.LastAccessTime));
                    fileDetails.Properties.Add(new PSNoteProperty("LastWriteTime", fileInfo.LastWriteTime));

                    // Write the custom object to the output
                    WriteObject(fileDetails);
                }
            }
            else
            {
                // Path does not exist, write an error message
                WriteError(new ErrorRecord(
                    new FileNotFoundException("Path not found", Path),
                    "PathNotFound",
                    ErrorCategory.ObjectNotFound,
                    Path));
            }
        }
    }
}
'@

# Get the current date in the format yyyyMMdd
$datetime = Get-Date -Format yyyyMMdd

# Get the third entry from the PSModulePath to determine the module path
$modulePath = $env:PSModulePath -split ';' | Select-Object -Index 2

# Specify the name of the folder you want to create
$newFolderName = "BinaryModule"

# Create the full path for the new folder
$newFolderPath = Join-Path $modulePath $newFolderName

# Construct the full path for the DLL using the current date
$DLLPath = Join-Path $newFolderPath "myCmdlet_$datetime.dll"

# Compile the C# code and output it to the specified DLL path
Add-Type -TypeDefinition $code -OutputAssembly $DLLPath

# Import the module
Import-Module -Name $DLLPath -Verbose

# Get information about the 'Get-FileDetails' command from the imported module
Get-Command -Name Get-FileDetails | Select-Object Module, ModuleName, ImplementingType, CommandType


# Use the custom cmdlet
Get-FileDetails -Path "C:\Ultimate PowerShell Automation\ExportedTemplate-MyPowerShellRG\" 
