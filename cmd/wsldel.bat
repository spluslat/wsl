@echo off
setlocal ENABLEDELAYEDEXPANSION

rem 使用方法: 
rem このバッチファイルは、WSLインスタンスを削除し、関連するフォルダを削除します
rem 引数 (必須): 削除するLinuxディストリビューションの名前
rem 例: wsldel.bat Ubuntu-22.04

rem 引数のチェック
if "%1"=="" (
    echo エラー: 削除対象のLinuxディストリビューション名の指定が必要です
    exit /b
)
rem wslのベースパス
set CONST_BASE_PATH=C:\wsl2
rem インストールフォルダパス
set install_folder=%CONST_BASE_PATH%\instance\%1

set run_cmd_wsl=wsl --unregister %1
set run_cmd_rmdir=rmdir /s /q %install_folder%

rem wsl削除
echo %run_cmd_wsl%を実行します
call %run_cmd_wsl%

rem インストールフォルダの存在チェック
if exist "%install_folder%" (
    echo %run_cmd_rmdir%を実行します
    call %run_cmd_rmdir%
) else (
    echo エラー: %install_folder% は存在しません。
)
