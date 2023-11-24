@echo off
setlocal ENABLEDELAYEDEXPANSION

rem 使用方法: 
rem このバッチファイルは、指定されたWSLディストリビューションに、指定されたユーザーでログインします
rem 第一引数 (必須): 実行するLinuxディストリビューションの名前
rem 第二引数 (オプション): 使用するユーザー名（デフォルトはroot）
rem 例: wsllogin.bat Ubuntu-22.04 username

rem 引数のチェック
if "%1"=="" (
    echo エラー: Linuxディストリビューション名の指定が必要です
    exit /b 1
)

rem デフォルトのユーザー名
set user_name=root

rem 第二引数がある場合、user_nameを更新
if not "%2"=="" set user_name=%2

set run_cmd=wsl -d %1 -u %user_name%
echo %run_cmd%を実行します
call %run_cmd%
