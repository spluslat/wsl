@echo off
setlocal ENABLEDELAYEDEXPANSION

rem �g�p���@: 
rem ���̃o�b�`�t�@�C���́AWSL�C���X�^���X���C���|�[�g���邽�߂Ɏg�p����܂��B
rem ������ (�K�{): �C���X�g�[������Linux�f�B�X�g���r���[�V�����̖��O
rem ������ (�I�v�V����): �g�p����G�N�X�|�[�g�t�@�C���̖��O�i�g���q�������j
rem ��: wslcreate Ubuntu_foo Ubuntu-22.04

rem �������̃`�F�b�N
if "%1"=="" (
    echo �G���[: �C���X�g�[������Linux�f�B�X�g���r���[�V�������̎w�肪�K�v�ł�
    exit /b
)

rem wsl�̃x�[�X�p�X
set CONST_BASE_PATH=C:\wsl2
rem �f�t�H���g�̃C���X�g�[���Ɏg�p����Linux �f�B�X�g���r���[�V������
set export_file=Ubuntu-22.04
rem �C���X�g�[���t�H���_�p�X
set install_folder=%CONST_BASE_PATH%\instance\%1

rem ������������ꍇ�Aexport_file���X�V
if not "%2"=="" set export_file=%2

set run_cmd=wsl --import %1 "%install_folder%" "%CONST_BASE_PATH%\export\%export_file%.tar"

rem �C���X�g�[���t�H���_�����ɑ��݂��邩�`�F�b�N
if exist "%install_folder%" (
    echo �G���[: %install_folder% �͊��ɑ��݂��܂��B
) else (
    echo %run_cmd%�����s���܂�
    call %run_cmd%
)
