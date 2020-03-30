$content = Get-Content -Path "Get-CohesityInterfaceGroup.ps1"
$fileName = 'Get-CohesityInterfaceGroup.ps1'
# 'Content = '+ $content


# Add-content -Path "C:\Git md files Powershell\Cohesity-PowerShell\outfile1.txt" -Value '# '+$fileName+ "`n"
$excludedBlocks = @('.NOTES', '.LINK')

for($i = 0; $i -lt $content.Length; $i++) {
    if($content[$i] -cmatch '\.[A-Z]' -AND ($excludedBlocks -notcontains $content[$i].trim(' '))) {
        $val = "##  " + $content[$i].trim('. ') + "`n"
        $i++;
        while($content[$i] -cnotmatch '\.[A-Z]' -AND $content[$i] -cnotmatch '#>') {
            $val = $val + $content[$i].trim(' ') + "`n";
            $i++
        }
        if($content[$i] -cmatch '\.[A-Z]') {
            $i--
        } else {
            Add-content -Path "C:\Git md files Powershell\Cohesity-PowerShell\output.md" -Value $val
            break
        }
        Add-content -Path "C:\Git md files Powershell\Cohesity-PowerShell\output.md" -Value $val
    }
}

$commonBlock = "## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS"

Add-content -Path "C:\Git md files Powershell\Cohesity-PowerShell\output.md" -Value $commonBlock