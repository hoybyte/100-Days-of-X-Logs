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
        $Object = Add-Member -MemberType NoteProperty -Name "Computer" -Value $ComputerName
        ForEach($port in $Ports){
            $Result = (Test-NetConnection -ComputerName $ComputerName -Port $Ports).TCPTestSucceeded

            If(!Result){
                $Status = "Failure"
            } # if
            Else {
                $Status = "Success"
            } #elseif
            $Object | Add-Member -MemberType NoteProperty "$("Port " + "$Ports")" -Value "$(status)"
        } #ForEach Port 

        $Result += $Object 

    } #ForEach Computer

    If($Result){
        $Results
    }
} #Function