# Claude Code MCP 配置指南

本仓库提供 Claude Code 的 MCP (Model Context Protocol) 服务器配置参考和最佳实践。

## 📋 目录

- [包含的 MCP 工具](#包含的-mcp-工具)
- [快速安装](#快速安装)
- [详细配置](#详细配置)
- [使用示例](#使用示例)

## 🔧 包含的 MCP 工具

| 工具 | 功能 | 类型 | 说明 |
|------|------|------|------|
| **chrome-devtools** | 浏览器自动化 | stdio | Chrome DevTools 集成 |
| **figma** | 设计工具集成 | stdio | Figma 文件读取和导出 |
| **context7** | 文档查询 | http | 获取编程库文档和示例 |
| **github** | 代码仓库管理 | http | GitHub 操作和协作 |

## 🚀 快速安装

### 步骤 1：克隆仓库

```bash
git clone https://github.com/13429326514-debug/claude-mcp-public.git
cd claude-mcp-public
```

### 步骤 2：编辑配置文件

编辑 `mcp-config.json`，替换以下占位符：

```json
{
  "mcpServers": {
    "figma": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "figma-developer-mcp", "--figma-api-key=YOUR_FIGMA_API_KEY", "--stdio"],
      "env": {}
    },
    "github": {
      "type": "http",
      "url": "https://api.githubcopilot.com/mcp/",
      "headers": {
        "Authorization": "Bearer YOUR_GITHUB_TOKEN"
      }
    }
  }
}
```

**获取 API Keys：**

- **Figma API Key**: https://www.figma.com/developers/api#authentication
- **GitHub Token**: https://github.com/settings/tokens (需要 `repo` 权限)

### 步骤 3：合并配置

找到你的 Claude Code 配置文件：

- **Windows**: `C:\Users\你的用户名\.claude.json`
- **macOS/Linux**: `~/.claude.json`

将 `mcp-config.json` 的内容合并到 `mcpServers` 部分。

### 步骤 4：验证安装

```bash
claude mcp list
```

期望输出：

```
chrome-devtools: npx chrome-devtools-mcp@latest - ✓ Connected
figma: npx -y figma-developer-mcp ... --stdio - ✓ Connected
context7: https://mcp.context7.com/mcp (HTTP) - ✓ Connected
github: https://api.githubcopilot.com/mcp/ (HTTP) - ✓ Connected
```

## 📖 详细配置

### Chrome DevTools

**功能：** 浏览器自动化、网页截图、UI 测试

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "type": "stdio",
      "command": "npx",
      "args": ["chrome-devtools-mcp@latest"],
      "env": {}
    }
  }
}
```

### Figma

**功能：** 设计文件集成、组件导出、设计资源获取

```json
{
  "mcpServers": {
    "figma": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "figma-developer-mcp",
        "--figma-api-key=figd_你的API密钥",
        "--stdio"
      ],
      "env": {}
    }
  }
}
```

### Context7

**功能：** 获取编程库的实时文档和代码示例

```json
{
  "mcpServers": {
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp"
    }
  }
}
```

### GitHub

**功能：** 仓库管理、Issue、PR、代码审查

```json
{
  "mcpServers": {
    "github": {
      "type": "http",
      "url": "https://api.githubcopilot.com/mcp/",
      "headers": {
        "Authorization": "Bearer ghp_你的Token"
      }
    }
  }
}
```

## 💡 使用示例

### 示例 1：查询 React 文档

```
使用 context7 查询 React useEffect 的最新文档和示例
```

### 示例 2：获取 Figma 设计

```
使用 figma 读取我的设计文件并导出组件
```

### 示例 3：浏览器自动化

```
使用 chrome-devtools 打开网页并截图
```

### 示例 4：创建 GitHub Issue

```
使用 github 在我的仓库中创建一个新 Issue
```

## 🛠️ 完整配置示例

参见 `mcp-config.json` 文件获取完整配置模板。

## 📚 参考资源

- [MCP 官方文档](https://modelcontextprotocol.io)
- [Claude Code 文档](https://code.anthropic.com)
- [Figma API 文档](https://www.figma.com/developers/api)

## ❓ 常见问题

### Q: MCP 显示未连接？

**A:** 检查以下几点：
1. `.claude.json` 文件格式是否正确
2. API Key 和 Token 是否正确配置
3. 网络连接是否正常
4. 尝试重启 Claude Code

### Q: 如何添加更多 MCP 工具？

**A:** 访问 [MCP Servers](https://modelcontextprotocol.io/servers) 查找更多工具。

### Q: 配置文件在哪里？

**A:**
- Windows: `C:\Users\你的用户名\.claude.json`
- macOS/Linux: `~/.claude.json`

## 📝 许可证

MIT License - 可自由使用和修改

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**最后更新：** 2025-01-16
