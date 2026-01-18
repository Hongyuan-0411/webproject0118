# 音绘星 - 本地服务器启动脚本 (PowerShell)
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "音绘星 - 本地服务器启动脚本" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Node.js 是否安装
$nodePath = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodePath) {
    Write-Host "[错误] 未检测到 Node.js" -ForegroundColor Red
    Write-Host ""
    Write-Host "请先安装 Node.js (版本 >= 18.x)" -ForegroundColor Yellow
    Write-Host "下载地址: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "安装步骤:" -ForegroundColor Yellow
    Write-Host "1. 访问 https://nodejs.org/" -ForegroundColor White
    Write-Host "2. 下载 LTS 版本 (推荐)" -ForegroundColor White
    Write-Host "3. 运行安装程序，一路点击'下一步'" -ForegroundColor White
    Write-Host "4. 安装完成后重启 PowerShell" -ForegroundColor White
    Write-Host "5. 再次运行此脚本" -ForegroundColor White
    Write-Host ""
    Read-Host "按 Enter 键退出"
    exit 1
}

# 显示 Node.js 版本
Write-Host "[信息] 检测到 Node.js:" -ForegroundColor Green
node --version
Write-Host ""

# 检查 server.js 是否存在
if (-not (Test-Path "server.js")) {
    Write-Host "[错误] 找不到 server.js 文件" -ForegroundColor Red
    Write-Host "请确保在项目根目录运行此脚本" -ForegroundColor Yellow
    Read-Host "按 Enter 键退出"
    exit 1
}

Write-Host "[信息] 正在启动服务器..." -ForegroundColor Green
Write-Host "[信息] 服务器地址: http://localhost:5173" -ForegroundColor Green
Write-Host "[信息] 按 Ctrl+C 停止服务器" -ForegroundColor Yellow
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 启动服务器
node server.js
