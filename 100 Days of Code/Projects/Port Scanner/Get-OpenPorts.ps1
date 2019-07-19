function Get-OpenPorts {
   <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER computername

    .Example

    .Example

   #> 
    [CmdletBinding()]

    param (
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]$ComputerName,

        [Parameter(Mandatory=$false,
                   ValueFromPipeline=$true)]
        $Ports = "80"       
    )
    $Results = @()

    ForEach($computer in $ComputerName){
        $Object = New-Object PSCustomObject
        $Object | Add-Member -MemberType NoteProperty -Name "Computer" -Value $ComputerName
        ForEach ($port in $Ports){
            $Result = (Test-NetConnection -ComputerName $ComputerName -Port $Port).TCPTestSucceeded

            If($Result -eq "False"){
                $Status = "Failure"
            } # if
            Else {
                $Status = "Success"
            } #elseif
            $Object | Add-Member NoteProperty "$("Port " + "$Port")" -Value "$($status)"
        } #ForEach Port 

        $Results += $Object 

    } #ForEach Computer

    If($Results){
        $Results
    }
} #Function