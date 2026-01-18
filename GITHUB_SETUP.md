# GitHub 上传指南

## 步骤1：初始化 Git 仓库

在项目根目录打开终端，执行：

```bash
# 初始化 Git 仓库
git init

# 添加所有文件（.gitignore 会自动排除敏感文件）
git add .

# 提交
git commit -m "Initial commit: 音绘星项目"
```

## 步骤2：在 GitHub 创建仓库

1. 登录 GitHub
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库名称（如：yinhuixing）
4. 选择 Public 或 Private
5. **不要**勾选 "Initialize this repository with a README"（因为我们已经有了）
6. 点击 "Create repository"

## 步骤3：连接并推送

GitHub 会显示连接命令，类似这样：

```bash
# 添加远程仓库（将 YOUR_USERNAME 和 REPO_NAME 替换为你的实际值）
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 推送代码
git branch -M main
git push -u origin main
```

## 步骤4：验证

访问你的 GitHub 仓库页面，确认所有文件都已上传。

## 注意事项

- ✅ `.gitignore` 已配置，会自动排除：
  - `data/` 目录（生成的内容）
  - `.env` 文件（如果使用）
  - `node_modules/`（如果有）
  
- ⚠️ 注意：API Keys 已包含在代码中，如果这是公开仓库，请考虑使用环境变量

## 后续更新

如果之后需要更新代码：

```bash
git add .
git commit -m "更新说明"
git push
```
