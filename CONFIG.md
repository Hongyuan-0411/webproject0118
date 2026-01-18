# 配置说明

## API Keys 配置

在上传到 GitHub 之前，请确保移除 `server.js` 中的硬编码 API Keys。

### 方法1：使用环境变量（推荐）

#### Windows PowerShell
```powershell
$env:SUNO_API_KEY="your-suno-api-key"
$env:DASHSCOPE_API_KEY="your-dashscope-api-key"
node server.js
```

#### Windows CMD
```cmd
set SUNO_API_KEY=your-suno-api-key
set DASHSCOPE_API_KEY=your-dashscope-api-key
node server.js
```

#### Linux/Mac
```bash
export SUNO_API_KEY="your-suno-api-key"
export DASHSCOPE_API_KEY="your-dashscope-api-key"
node server.js
```

### 方法2：修改 server.js（不推荐用于生产）

在 `server.js` 文件中找到以下行并替换为你的 API Keys：

```javascript
const DEFAULT_SUNO_API_KEY = 'your-suno-api-key-here';
const DEFAULT_DASHSCOPE_API_KEY = 'your-dashscope-api-key-here';
```

⚠️ **重要**：如果使用此方法，请确保不要将包含真实 API Keys 的代码提交到公开仓库！

## 上传到 GitHub 前的检查清单

- [ ] 移除 `server.js` 中的硬编码 API Keys
- [ ] 确认 `.gitignore` 已正确配置
- [ ] 确认 `data/` 目录不会被提交
- [ ] 确认没有其他敏感信息（如密码、token等）
- [ ] 更新 README.md 中的说明

## 获取 API Keys

### Suno API Key
- 访问 [defapi.org](https://defapi.org) 或相关服务获取

### DashScope API Key
- 访问 [阿里云百炼](https://dashscope.aliyun.com/) 获取
- 格式：`sk-` 开头
