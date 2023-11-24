@echo off
setlocal ENABLEDELAYEDEXPANSION

rem 使用方法: 
rem このバッチファイルは、WSLインスタンスをインポートするために使用されます。
rem 第一引数 (必須): インストールするLinuxディストリビューションの名前
rem 第二引数 (オプション): 使用するエクスポートファイルの名前（拡張子を除く）
rem 例: wslcreate Ubuntu_foo Ubuntu-22.04

rem 第一引数のチェック
if "%1"=="" (
    echo エラー: インストールするLinuxディストリビューション名の指定が必要です
    exit /b
)

rem wslのベースパス
set CONST_BASE_PATH=C:\wsl2
rem デフォルトのインストールに使用するLinux ディストリビューション名
set export_file=Ubuntu-22.04
rem インストールフォルダパス
set install_folder=%CONST_BASE_PATH%\instance\%1

rem 第二引数がある場合、export_fileを更新
if not "%2"=="" set export_file=%2

set run_cmd=wsl --import %1 "%install_folder%" "%CONST_BASE_PATH%\export\%export_file%.tar"

rem インストールフォルダが既に存在するかチェック
if exist "%install_folder%" (
    echo エラー: %install_folder% は既に存在します。
) else (
    echo %run_cmd%を実行します
    call %run_cmd%
)
