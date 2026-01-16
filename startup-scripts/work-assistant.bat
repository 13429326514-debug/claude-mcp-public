@echo off
REM ==========================================
REM Claude Code 工作助手启动脚本
REM ==========================================

REM 设置UTF-8编码
chcp 65001 >nul 2>&1

echo [INFO] 正在启动 Claude Code - 工作助手
echo.

REM === 设置终端窗口 ===
mode con cols=140 lines=100

echo [INFO] 已设置窗口大小
echo [INFO] 切换到项目目录...
echo.

REM === 配置项目目录 ===
REM 请修改下面的路径为你的项目目录
cd /d "G:\claude\plan_helper"

if %errorlevel% neq 0 (
    echo [ERROR] 未找到目录: G:\claude\plan_helper
    echo [ERROR] 请编辑此文件，修改路径为你的项目目录
    pause
    exit /b
)

echo [✓] 目录已找到: %cd%
echo.
echo [INFO] 正在启动 Claude Code...
echo ---------------------------------------------------

REM 启动 Claude Code（跳过权限检查）
claude --dangerously-skip-permissions

echo ---------------------------------------------------
echo [INFO] Claude Code 已关闭
pause
