@echo off
setlocal ENABLEDELAYEDEXPANSION

rem 使用方法: 
rem このバッチファイルは、指定されたWSLディストリビューションをエクスポートします。
rem 引数 (必須): エクスポートするLinuxディストリビューションの名前
rem 例: wslexport.bat Ubuntu-22.04

rem 引数のチェック
if "%1"=="" (
    echo エラー: Linuxディストリビューション名の指定が必要です
    exit /b 1
)

rem wslのベースパス
set CONST_BASE_PATH=C:\wsl2

set run_cmd=wsl --export %1 "%CONST_BASE_PATH%\export\%1.tar"
echo %run_cmd%を実行します
call %run_cmd%
