# �X�N���v�g���Ǘ��Ҍ����ōĎ��s���邨�܂��Ȃ�
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }

$portsHashTable = @{}
# �|�[�g�ԍ��̃n�b�V���e�[�u���Ŏw�肵�܂��B
# �w����@�͉��L�ł��B
#   Key�FWindows�̃|�[�g
#   Value�FWSL2�̃|�[�g
# ���L�̗�ł́A2222����22�A8080����8080�ɐݒ肵�܂��B
$portsHashTable["2222"] = "22"
$portsHashTable["8080"] = "8080"

Write-Host "# �n�b�V���e�[�u���`�F�b�N"
# �n�b�V���e�[�u���`�F�b�N
if ($portsHashTable.Count -eq 0) {
  Write-Host "�G���[: portsHashTable�Ƀ|�[�g�ԍ��̎w�肪�Ȃ����ߏI�����܂��B"
}
Write-Host "...OK"

# WSL2��IP�A�h���X���擾����
# IP�A�h���X���擾�ł��Ȃ��ꍇ�A�I�����܂��B
Write-Host "# WSL2��IP�A�h���X�擾"
$ip = (wsl hostname -I).trimend()
if( !$ip ){
  Write-Host "�G���[: WSL2��IP�A�h���X���擾�ł��Ȃ����ߏI�����܂��B"
  exit;
}
Write-Host "...OK"

# �|�[�g�t�H���[�h�ݒ�
Write-Host "# �|�[�g�t�H���[�h�ݒ�"
foreach ($key in $portsHashTable.Keys) {
  $value = $portsHashTable[$key]
  Write-Host "*:${key} -> ${ip}:${value} �̐ݒ�"
  # �폜
  Invoke-Expression "netsh interface portproxy delete v4tov4 listenaddress=* listenport=${key}";
  # �o�^
  Invoke-Expression "netsh interface portproxy add v4tov4 listenaddress=* listenport=${key} connectaddress=${ip} connectport=${value}";
}

# �쐬���ꂽ�|�[�g�v���L�V�̐ݒ��\�����܂��B
Write-Host "# �|�[�g�t�H���[�h�ݒ�̊m�F"
Invoke-Expression "netsh interface portproxy show all";

Read-Host -Prompt "�������S�Ċ������܂����B���s����ɂ� Enter �L�[�������Ă��������B"
