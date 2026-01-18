# 本地部署指南

## 快速开始

### 方式一：使用启动脚本（推荐）

#### Windows 用户：

1. **安装 Node.js**（如果还没安装）
   - 访问：https://nodejs.org/
   - 下载 LTS 版本（推荐 v18 或更高）
   - 运行安装程序，一路点击"下一步"
   - 安装完成后**重启命令行/PowerShell**

2. **启动服务器**
   - **方式 A**：双击 `启动服务器.bat` 文件
   - **方式 B**：在 PowerShell 中运行 `.\启动服务器.ps1`
   - **方式 C**：在命令行中运行 `启动服务器.bat`

3. **访问网页**
   - 打开浏览器访问：http://localhost:5173

### 方式二：手动启动

1. **检查 Node.js 是否安装**
   ```bash
   node --version
   ```
   如果没有输出或报错，请先安装 Node.js（参考方式一的步骤 1）

2. **启动服务器**
   ```bash
   node server.js
   ```

3. **访问网页**
   - 打开浏览器访问：http://localhost:5173

## 详细说明

### 系统要求

- **Node.js**: >= 18.x
- **操作系统**: Windows / macOS / Linux
- **浏览器**: Chrome / Firefox / Edge (最新版本)

### 端口说明

- 默认端口：**5173**
- 如需修改端口，请编辑 `server.js` 文件，修改 `PORT` 变量，或设置环境变量：
  ```bash
  # Windows PowerShell
  $env:PORT=3000
  node server.js
  
  # Windows CMD
  set PORT=3000
  node server.js
  
  # Linux/Mac
  export PORT=3000
  node server.js
  ```

### API Keys 配置（可选）

项目已经内置了默认的 API Keys，可以直接使用。如需使用自己的 API Keys：

#### 方式一：环境变量（推荐）

```bash
# Windows PowerShell
$env:SUNO_API_KEY="your-suno-api-key"
$env:DASHSCOPE_API_KEY="your-dashscope-api-key"

# Windows CMD
set SUNO_API_KEY=your-suno-api-key
set DASHSCOPE_API_KEY=your-dashscope-api-key

# Linux/Mac
export SUNO_API_KEY="your-suno-api-key"
export DASHSCOPE_API_KEY="your-dashscope-api-key"
```

#### 方式二：修改 server.js（仅用于本地开发）

编辑 `server.js` 文件，找到以下行并修改：

```javascript
const DEFAULT_SUNO_API_KEY = 'your-suno-api-key';
const DEFAULT_DASHSCOPE_API_KEY = 'your-dashscope-api-key';
```

⚠️ **注意**：不要将包含真实 API Keys 的代码提交到 Git 仓库。

### 停止服务器

在运行服务器的命令行窗口中按 `Ctrl + C` 即可停止服务器。

### 常见问题

#### 1. 提示"未检测到 Node.js"

**解决方案**：
- 确认已安装 Node.js：访问 https://nodejs.org/ 下载安装
- 安装后需要**重启命令行/PowerShell**才能生效
- 如果已安装，检查 Node.js 是否添加到 PATH 环境变量

#### 2. 端口 5173 被占用

**解决方案**：
- 修改端口：设置 `PORT` 环境变量为其他端口（如 3000、8080）
- 或关闭占用该端口的其他程序

#### 3. 无法访问 http://localhost:5173

**解决方案**：
- 确认服务器已成功启动（命令行应显示服务器启动信息）
- 检查防火墙是否阻止了本地端口
- 尝试使用 `127.0.0.1:5173` 替代 `localhost:5173`

#### 4. API 调用失败

**解决方案**：
- 检查 API Keys 是否正确配置
- 查看服务器日志中的错误信息
- 确认网络连接正常

## 开发模式

如果需要修改代码后自动重启服务器，可以使用 nodemon（需要先安装）：

```bash
# 安装 nodemon（全局安装，只需安装一次）
npm install -g nodemon

# 使用 nodemon 启动服务器（代码修改后会自动重启）
nodemon server.js
```

## 生产部署

如需部署到生产环境，请参考：
- [VERCEL_DEPLOY.md](VERCEL_DEPLOY.md) - Vercel 部署指南
- [GITHUB_SETUP.md](GITHUB_SETUP.md) - GitHub Pages 部署指南

## 需要帮助？

如果遇到问题：
1. 查看服务器日志中的错误信息
2. 检查 [README.md](README.md) 和 [CONFIG.md](CONFIG.md)
3. 提交 GitHub Issue
