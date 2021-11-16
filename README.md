# Power ASCII
 
**This script will print out a random Ascii Art to your terminal screen whenever you launch the terminal.**

> **Note:** This script only works on PowerShell v5.0 or higher

Run through the following steps to use this script.

## Get your PowerShell profile
```PowerShell
# The following command will open your profile if it exists
# $PROFILE is a variable that contains a path where is your profile file should be
> notepad $PROFILE
```
If you do not currently have a profile
```PowerShell
# The following command will output a directory where is your profile file should be
> echo $PROFILE

# With the following to create your profile file with no content
> New-Item -ItemType File -Force -Path DIRECTORY_FROM_PREVIOUS_COMMAND
```

## Setup PowerShell Profile

Put the following code somewhere to your profile
```PowerShell
$code = 
@"
Print-Random-Art -colorized 1
"@
$Script = Invoke-WebRequest 'https://raw.githubusercontent.com/zozobalogh0817/Power-Ascii/master/power_ascii.ps1'
$ScriptBlock = [Scriptblock]::Create($Script.Content + $code)
Invoke-Command -ScriptBlock $ScriptBlock
```
Save your profile, restart your PowerShell, or type the following
```
# This command will reload your profile
. $PROFILE
```

#### You ready to rock.

## Methods

`Get-Random-Art` - This method will return a Random Ascii Art from sixty variety
> **Arguments:** This method does not take any arguments

`Print-Random-Art` - This method will Print a Random Ascii Art from sixty variety
> **Arguments:** [boolean] colorized

## How to use custom methods 

Put your custom code inside the code variable
Like the following
```PowerShell
$code = 
@"
# Uncolorized Art
Print-Random-Art -colorized 0
# Colorized Art
Print-Random-Art -colorized 1
# Get Random Art then write with Write-Host
Write-Host (Get-Random-Art)
"@
```
The above code will write several Ascii Art to the console.


#### Thanks to [DanCRichards](https://github.com/DanCRichards)

##### Based on [DanCRichards/ASCII-Art-Splash-Screen](https://github.com/DanCRichards/ASCII-Art-Splash-Screen)

> Do not use this script for too serious things
