@echo off
setlocal ENABLEDELAYEDEXPANSION

rem �g�p���@: 
rem ���̃o�b�`�t�@�C���́A�w�肳�ꂽWSL�f�B�X�g���r���[�V�����ɁA�w�肳�ꂽ���[�U�[�Ń��O�C�����܂�
rem ������ (�K�{): ���s����Linux�f�B�X�g���r���[�V�����̖��O
rem ������ (�I�v�V����): �g�p���郆�[�U�[���i�f�t�H���g��root�j
rem ��: wsllogin.bat Ubuntu-22.04 username

rem �����̃`�F�b�N
if "%1"=="" (
    echo �G���[: Linux�f�B�X�g���r���[�V�������̎w�肪�K�v�ł�
    exit /b 1
)

rem �f�t�H���g�̃��[�U�[��
set user_name=root

rem ������������ꍇ�Auser_name���X�V
if not "%2"=="" set user_name=%2

set run_cmd=wsl -d %1 -u %user_name%
echo %run_cmd%�����s���܂�
call %run_cmd%
