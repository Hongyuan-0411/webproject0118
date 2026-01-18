@echo off
chcp 65001 >nul
echo ============================================
echo 音绘星 - 本地服务器启动脚本
echo ============================================
echo.

REM 检查 Node.js 是否安装
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Node.js
    echo.
    echo 请先安装 Node.js (版本 ^>= 18.x)
    echo 下载地址: https://nodejs.org/
    echo.
    echo 安装步骤:
    echo 1. 访问 https://nodejs.org/
    echo 2. 下载 LTS 版本 (推荐)
    echo 3. 运行安装程序，一路点击"下一步"
    echo 4. 安装完成后重启命令行
    echo 5. 再次运行此脚本
    echo.
    pause
    exit /b 1
)

REM 显示 Node.js 版本
echo [信息] 检测到 Node.js:
node --version
echo.

REM 检查 server.js 是否存在
if not exist "server.js" (
    echo [错误] 找不到 server.js 文件
    echo 请确保在项目根目录运行此脚本
    pause
    exit /b 1
)

echo [信息] 正在启动服务器...
echo [信息] 服务器地址: http://localhost:5173
echo [信息] 按 Ctrl+C 停止服务器
echo.
echo ============================================
echo.

REM 启动服务器
node server.js

pause
