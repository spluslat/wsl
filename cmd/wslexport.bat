@echo off
setlocal ENABLEDELAYEDEXPANSION

rem �g�p���@: 
rem ���̃o�b�`�t�@�C���́A�w�肳�ꂽWSL�f�B�X�g���r���[�V�������G�N�X�|�[�g���܂��B
rem ���� (�K�{): �G�N�X�|�[�g����Linux�f�B�X�g���r���[�V�����̖��O
rem ��: wslexport.bat Ubuntu-22.04

rem �����̃`�F�b�N
if "%1"=="" (
    echo �G���[: Linux�f�B�X�g���r���[�V�������̎w�肪�K�v�ł�
    exit /b 1
)

rem wsl�̃x�[�X�p�X
set CONST_BASE_PATH=C:\wsl2

set run_cmd=wsl --export %1 "%CONST_BASE_PATH%\export\%1.tar"
echo %run_cmd%�����s���܂�
call %run_cmd%
