function FancyWritter([string]$Text){
    $Text.ToCharArray() | ForEach-Object{
        switch -Regex ($_){
            "`r"{break}
            "`n"{Write-Host " "; break}
            "[^ ]"{
                $writeHostOptions = @{
                    ForegroundColor = ([system.enum]::GetValues([system.consolecolor])) | get-random
                    NoNewLine = $true
                }
                Write-Host $_ @writeHostOptions
                break
            }
            " "{Write-Host " " -NoNewline}
        } 
    }
    Write-Host `r`
    Write-Host `r`
}

function Get-Random-Art()
{
    $number = Get-Random 60
    $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/zozobalogh0817/ascii-splash-screen/master/art/$number.txt"
    $art = $response.Content
    return $art
}

function Print-Random-Art([Nullable[bool]]$colorized)
{
    $art = Get-Random-Art
    if($colorized) 
    {
        FancyWritter $art
    }

    else
    {
        Write-Host $art
    }
}

Print-Random-Art -colorized 1
