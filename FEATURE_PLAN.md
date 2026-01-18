# 新功能规划文档

## 需求分析

### 新增/修改的设置项

1. **学习目标**（已有，保持不变）
   - 输入框：学习目标prompts

2. **目标重点**（新增）
   - 输入框：需要学习目标的重点突出的内容，需要让孩子学会的内容

3. **音乐风格选项**（修改）
   - 原选项：舒缓钢琴、活泼儿歌、节奏感强、温馨童谣
   - 新选项：欢快、温暖、舒缓、童话、自定义输入

4. **音乐声音选项**（新增）
   - 选项：男生、女生、爸爸、妈妈、自定义输入

5. **绘本风格选项**（新增）
   - 选项：童话、可爱、科幻、童年、自定义输入

6. **角色选择**（修改）
   - 原选项：动物、车辆、卡通人物、其他
   - 新选项：男生、女生、爸爸、妈妈、动物、自定义输入

## 数据流设计

### 前端数据结构
```javascript
{
  userGoal: string,           // 学习目标
  learningFocus: string,       // 目标重点（新增）
  musicStyle: string,          // 音乐风格（修改选项）
  musicVoice: string,          // 音乐声音（新增）
  pictureBookStyle: string,    // 绘本风格（新增）
  characterType: string        // 角色选择（修改选项）
}
```

### API 请求结构
```javascript
// POST /api/decompose-prompt
{
  userGoal: string,
  learningFocus: string,
  musicStyle: string,
  musicVoice: string,
  pictureBookStyle: string,
  characterType: string
}

// POST /api/generate-lyrics
{
  step: object,
  characterName: string,
  musicStyle: string,
  musicVoice: string,        // 新增
  stepNumber: number,
  totalSteps: number
}

// POST /api/generate-image
{
  prompt: string,
  pictureBookStyle: string,  // 新增
  size: string,
  negative_prompt: string
}
```

## 实现计划

### 阶段1：前端UI修改
- [x] 修改左侧面板HTML结构
- [ ] 添加目标重点输入框
- [ ] 更新音乐风格选项
- [ ] 添加音乐声音选项（带自定义）
- [ ] 添加绘本风格选项（带自定义）
- [ ] 更新角色选择选项（带自定义）

### 阶段2：前端逻辑修改
- [ ] 更新 decomposeGoal() 函数
- [ ] 更新 generateStepContent() 函数
- [ ] 更新 generateImageWithPrompt() 函数
- [ ] 处理自定义输入的逻辑

### 阶段3：后端API修改
- [ ] 更新 /api/decompose-prompt 接收新参数
- [ ] 更新 /api/generate-lyrics 接收音乐声音参数
- [ ] 更新 /api/generate-image 接收绘本风格参数

### 阶段4：提示词工程修改
- [ ] 更新 getDecomposePrompt() 整合目标重点
- [ ] 更新 getLyricsPrompt() 整合音乐声音
- [ ] 更新图片生成提示词整合绘本风格
- [ ] 更新音乐生成逻辑整合声音选项

## 技术细节

### 自定义输入处理
- 当选择"自定义输入"时，显示文本输入框
- 自定义值会覆盖预设选项
- 需要验证自定义输入的有效性

### 提示词整合策略
1. **目标重点** → 整合到分解提示词，强调重点内容
2. **音乐声音** → 整合到歌词生成和音乐生成
3. **绘本风格** → 整合到图片生成提示词
4. **角色选择** → 整合到所有相关提示词

## 注意事项

1. 保持向后兼容性（如果可能）
2. 确保所有自定义输入都有验证
3. 更新错误处理逻辑
4. 确保UI布局美观且易用
5. 测试所有新功能的组合
