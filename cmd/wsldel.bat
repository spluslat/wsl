@echo off
setlocal ENABLEDELAYEDEXPANSION

rem �g�p���@: 
rem ���̃o�b�`�t�@�C���́AWSL�C���X�^���X���폜���A�֘A����t�H���_���폜���܂�
rem ���� (�K�{): �폜����Linux�f�B�X�g���r���[�V�����̖��O
rem ��: wsldel.bat Ubuntu-22.04

rem �����̃`�F�b�N
if "%1"=="" (
    echo �G���[: �폜�Ώۂ�Linux�f�B�X�g���r���[�V�������̎w�肪�K�v�ł�
    exit /b
)
rem wsl�̃x�[�X�p�X
set CONST_BASE_PATH=C:\wsl2
rem �C���X�g�[���t�H���_�p�X
set install_folder=%CONST_BASE_PATH%\instance\%1

set run_cmd_wsl=wsl --unregister %1
set run_cmd_rmdir=rmdir /s /q %install_folder%

rem wsl�폜
echo %run_cmd_wsl%�����s���܂�
call %run_cmd_wsl%

rem �C���X�g�[���t�H���_�̑��݃`�F�b�N
if exist "%install_folder%" (
    echo %run_cmd_rmdir%�����s���܂�
    call %run_cmd_rmdir%
) else (
    echo �G���[: %install_folder% �͑��݂��܂���B
)
