@echo off
setlocal enabledelayedexpansion

set "REPOS_PATH=%1"
set "REVISION=%2"

:: 假設 ProjectName 已經被定義
set "ProjectName=YourProjectName"

:: 使用 svnlook 獲取更改的路徑（這裡僅作為示例，並不直接用於獲取URL）
for /f "tokens=*" %%i in ('svnlook changed --revision %REVISION% %REPOS_PATH%') do (
    set "CHANGED_PATH=%%i"
)

:: 假設 CHANGED_PATH 能反映到具體的工作副本路徑
set "GIT_REPO_PATH=F:\_project\%ProjectName%\%CHANGED_PATH:~4%"

:: 切換到 GIT_REPO_PATH 目錄
cd "%GIT_REPO_PATH%"

:: 使用 svn info 獲取 SVN URL
for /f "tokens=2*" %%a in ('svn info ^| findstr /C:"URL"') do set "SVN_URL=%%b"

:: 檢查 SVN URL 中是否包含 "trunk"
echo !SVN_URL! | findstr /C:"trunk" > nul
if !ERRORLEVEL! equ 0 (
    echo SVN URL contains "trunk". Performing Git operations...
    git add .
    git commit -m "Auto-commit from SVN revision %REVISION% for %ProjectName% with URL !SVN_URL!"
    git push origin main
) else (
    echo SVN URL does not contain "trunk". Skipping Git operations...
)

endlocal
