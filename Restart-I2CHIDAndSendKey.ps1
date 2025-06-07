# 以管理员身份运行此脚本

# 1. 找出所有 FriendlyName 包含 "I2C HID" 的 HID 设备
$devices = Get-PnpDevice -Class 'HIDClass' |
    Where-Object { $_.FriendlyName -like '*I2C HID*' -and $_.Status -eq 'OK' }

if ($devices.Count -lt 1) {
    Write-Error "未找到任何 I2C HID 设备。"
    exit 1
}

# 2. 依次重启（禁用→延迟→启用）
foreach ($dev in $devices) {
    Write-Host "重启设备： $($dev.FriendlyName) [$($dev.InstanceId)]"
    Disable-PnpDevice -InstanceId $dev.InstanceId -Confirm:$false
    Start-Sleep -Seconds 2
    Enable-PnpDevice  -InstanceId $dev.InstanceId -Confirm:$false
    Start-Sleep -Seconds 2
}

# 3. 模拟 Alt+Insert 按键
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('%{INSERT}')
Write-Host "已发送 Alt+Insert。"
