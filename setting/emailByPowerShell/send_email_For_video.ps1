[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PassKey
)

function Send-Email {
    param(
        [string]$subject,
        [string]$body,
        [string[]]$toEmails,
        [string[]]$ccEmails,
        [string]$fromEmail,
        [pscredential]$credential,
        [string[]]$attachmentPaths
    )

    try {
        Write-Host "Creating email message"
        $msg = New-Object System.Net.Mail.MailMessage
        $msg.From = $fromEmail
        $msg.To.Add(($toEmails -join ","))
        $msg.CC.Add(($ccEmails -join ","))
        $msg.Subject = $subject
        $msg.Body = $body
        $msg.IsBodyHtml = $true

        foreach ($attachmentPath in $attachmentPaths) {
            $attachment = New-Object System.Net.Mail.Attachment($attachmentPath)
            $attachment.Name = [System.IO.Path]::GetFileName($attachmentPath)
            $msg.Attachments.Add($attachment)
        }

        Write-Host "Connecting to SMTP server"
        $smtp = New-Object System.Net.Mail.SmtpClient("mail.bot.or.th", 587)
        $smtp.EnableSsl = $true
        $smtp.Credentials = $credential
        $smtp.Send($msg)
        Write-Host "Email sent successfully"
    } catch {
        Write-Host "Failed to send email: $_" "ERROR"
    }
}

function ParseRobotResults {
    param([string]$XmlFile)
    Write-Host "Parsing XML file: $XmlFile"
    if (-Not (Test-Path $XmlFile)) {
        Write-Host "File not found: $XmlFile" "ERROR"
        return 0, 0
    }
    try {
        [xml]$xml = Get-Content $XmlFile
        $totalStat = $xml.SelectSingleNode("//statistics/total/stat")
        $passCount = 0
        $failCount = 0
    } catch {
        Write-Host "Failed to parse XML file: $_" "ERROR"
        return 0, 0
    }

    foreach ($suite in $xml.robot.suite) {
        Write-Host "Processing suite: $($suite.name)"
        foreach ($test in $suite.test) {
            $status = $test.status.status
            Write-Host "Test: $($test.name), Status: $status"
            if ($status -eq "PASS") {
                $passCount++
            } elseif ($status -eq "FAIL") {
                $failCount++
            }
        }
    }
    Write-Host "Total Passed: $passCount, Total Failed: $failCount"
    return $failCount, $passCount
}

function Main {
    # Azure Variable Configuration
    $toEmails = $env:ToEmail -split ";"
    Write-Host "Task Variable (toEmails): $toEmails"
    $ccEmails = $env:CcEmail -split ";"
    Write-Host "Task Variable (ccEmails): $ccEmails"
    $fromEmail = (Get-Item -Path Env:FromEmail).Value
    Write-Host "Pipeline Variable (fromEmail): $fromEmail"
    $project = (Get-Item -Path Env:ProjectNameEnvironment).Value
    Write-Host "Pipeline Variable (project): $project"
    $pipeline = (Get-Item -Path Env:PipelineURL).Value
    Write-Host "Pipeline Variable (pipeline): $pipeline"
    $testscript = (Get-Item -Path Env:TestscriptURL).Value
    Write-Host "Pipeline Variable (testscript): $testscript"
    $usermanual = (Get-Item -Path Env:UserManualURL).Value
    Write-Host "Pipeline Variable (usermanual): $usermanual"
    $logFilePath = (Get-Item -Path Env:LogFilePATH).Value
    Write-Host "Pipeline Variable (logFilePath): $logFilePath"
    $ReportFilePath = (Get-Item -Path Env:ReportFilePATH).Value
    Write-Host "Pipeline Variable (ReportFilePath): $ReportFilePath"
    $xmlFile = (Get-Item -Path Env:OutputXMLFilePATH).Value
    Write-Host "Pipeline Variable (xmlFile): $xmlFile"

    $result = ParseRobotResults -xmlFile $xmlFile
    $failCount = $result[0]
    $passCount = $result[1]
    $subject = "$project - Passed: $passCount, Failed: $failCount"
    $tableRows = "<tr style='background-color:#dae9f8'><td>$project</td><td>$passCount</td><td>$failCount</td></tr>"
    $body = @"
<html>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        text-align: center;
    }
</style>
<body>
    <table style="width:100%">
        <tr style="background-color:#d9d9d9">
            <th style="color:#0070c0; width:60%">Test Scenario</th>
            <th style="color:#3c7d22; width:20%">Passed</th>
            <th style="color:#ff0000; width:20%">Failed</th>
        </tr>
        $tableRows
    </table>
    <br><br>
    Release Pipeline: <a href="$pipeline">Link To Azure Release Pipeline</a><br>
    <br>
    Testscript: <a href="$testscript">Link To Testscript</a><br>
    <br>
    User Manual: <a href="$usermanual">Link To User Manual</a><br>
    <br><br>
</body>
</html>
"@

    $passwordSecure = ConvertTo-SecureString $PassKey -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential ($fromEmail, $passwordSecure)
    $attachmentPaths = @($logFilePath, $ReportFilePath)

    $testcaseDir = Split-Path -Parent $logFilePath
    $videoDir = Join-Path -Path $testcaseDir -ChildPath "browser\video"
    Write-Host "กำลังค้นหาวิดีโอที่: $videoDir"
    if (Test-Path -Path $videoDir) {
        $videoFiles = @(Get-ChildItem -Path $videoDir -Filter *.webm)
        if ($videoFiles.Count -gt 0) {
            Write-Host "พบวิดีโอทั้งหมด $($videoFiles.Count) ไฟล์"
            foreach ($video in $videoFiles) {
                $attachmentPaths += $video.FullName
                Write-Host "แนบวิดีโอสำเร็จ: $($video.Name)"
            }
        } else {
            Write-Host "โฟลเดอร์มีอยู่ แต่ไม่พบไฟล์ .webm ข้างใน"
        }
    } else {
        Write-Host "ไม่พบโฟลเดอร์ Video"
    }

    Send-Email -subject $subject -body $body -toEmails $toEmails -ccEmails $ccEmails -fromEmail $fromEmail -credential $credential -attachmentPaths $attachmentPaths
}
Main
