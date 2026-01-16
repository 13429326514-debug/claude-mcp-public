@echo off
echo ========================================
echo   Claude MCP 配置安装向导
echo ========================================
echo.

REM 检查 Claude 配置文件
set CLAUDE_CONFIG=%USERPROFILE%\.claude.json

if not exist "%CLAUDE_CONFIG%" (
    echo [错误] 未找到 Claude 配置文件
    echo        位置: %CLAUDE_CONFIG%
    echo.
    echo 请先安装 Claude Code
    pause
    exit /b 1
)

echo [✓] 找到 Claude 配置文件
echo     %CLAUDE_CONFIG%
echo.

REM 检查配置文件是否存在
if not exist "mcp-config.json" (
    echo [错误] 未找到 mcp-config.json
    echo        请确保在仓库根目录运行此脚本
    pause
    exit /b 1
)

echo [✓] 找到 MCP 配置文件
echo.

REM 显示配置说明
echo ========================================
echo   配置说明
echo ========================================
echo.
echo 1. 编辑 mcp-config.json
echo    - 将 YOUR_FIGMA_API_KEY 替换为你的 Figma API Key
echo    - 将 YOUR_GITHUB_TOKEN 替换为你的 GitHub Token
echo.
echo 2. 获取 API Keys:
echo    - Figma: https://www.figma.com/developers/api
echo    - GitHub: https://github.com/settings/tokens
echo.
echo ========================================
echo.

choice /C YN /M "是否已配置好 API Keys？"

if errorlevel 2 goto :skip_config

echo.
echo [提示] 正在打开配置编辑器...
notepad "mcp-config.json"

:skip_config
echo.
echo ========================================
echo   合并配置到 .claude.json
echo ========================================
echo.
echo 请按以下步骤操作:
echo.
echo 1. 打开文件: %CLAUDE_CONFIG%
echo 2. 找到 "mcpServers" 部分
echo 3. 将 mcp-config.json 中的配置合并进去
echo.
echo 按任意键打开配置文件...
pause > nul

notepad "%CLAUDE_CONFIG%"

echo.
echo ========================================
echo   验证安装
echo ========================================
echo.
echo 运行以下命令验证 MCP 配置:
echo.
echo     claude mcp list
echo.

choice /C YN /M "是否现在验证安装？"

if errorlevel 2 goto :skip_verify

echo.
claude mcp list

:skip_verify
echo.
echo ========================================
echo   安装完成！
echo ========================================
echo.
echo 如需帮助，请查看 README.md
echo.
pause
