# Restart-I2CHIDAndSendKey.ps1
# 以管理员身份运行此脚本
Write-Host "请按任意键继续…"
# 1. 找出所有 FriendlyName 包含 "I2C HID" 的 HID 设备
$devices = Get-PnpDevice -Class 'HIDClass' |
    Where-Object { $_.FriendlyName -like '*I2C HID*' -and $_.Status -eq 'OK' }

# 2. 如果没找到，报错退出
if ($devices.Count -lt 1) {
    Write-Error "未找到任何 I2C HID 设备。"
    exit 1
}

# 3. 依次重启（禁用→延迟→启用），并捕获可能的权限错误
foreach ($dev in $devices) {
    Write-Host "重启设备： $($dev.FriendlyName) [$($dev.InstanceId)]"
    try {
        Disable-PnpDevice -InstanceId $dev.InstanceId -Confirm:$false -ErrorAction Stop
        Start-Sleep -Seconds 2
        Enable-PnpDevice  -InstanceId $dev.InstanceId -Confirm:$false -ErrorAction Stop
        Start-Sleep -Seconds 2
    }
    catch {
        Write-Host "❌ 操作失败：请右键管理员权限运行此脚本！" -ForegroundColor Red
        exit 1
    }
}

# 4. 发送 Alt+Insert
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('%{INSERT}')
Write-Host "✔ 已发送 Alt+Insert。"



