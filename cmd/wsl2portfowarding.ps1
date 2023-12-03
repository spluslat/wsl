# スクリプトを管理者権限で再実行するおまじない
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }

$portsHashTable = @{}
# ポート番号のハッシュテーブルで指定します。
# 指定方法は下記です。
#   Key：Windowsのポート
#   Value：WSL2のポート
# 下記の例では、2222から22、8080から8080に設定します。
$portsHashTable["2222"] = "22"
$portsHashTable["8080"] = "8080"

Write-Host "# ハッシュテーブルチェック"
# ハッシュテーブルチェック
if ($portsHashTable.Count -eq 0) {
  Write-Host "エラー: portsHashTableにポート番号の指定がないため終了します。"
}
Write-Host "...OK"

# WSL2のIPアドレスを取得する
# IPアドレスが取得できない場合、終了します。
Write-Host "# WSL2のIPアドレス取得"
$ip = (wsl hostname -I).trimend()
if( !$ip ){
  Write-Host "エラー: WSL2のIPアドレスが取得できないため終了します。"
  exit;
}
Write-Host "...OK"

# ポートフォワード設定
Write-Host "# ポートフォワード設定"
foreach ($key in $portsHashTable.Keys) {
  $value = $portsHashTable[$key]
  Write-Host "*:${key} -> ${ip}:${value} の設定"
  # 削除
  Invoke-Expression "netsh interface portproxy delete v4tov4 listenaddress=* listenport=${key}";
  # 登録
  Invoke-Expression "netsh interface portproxy add v4tov4 listenaddress=* listenport=${key} connectaddress=${ip} connectport=${value}";
}

# 作成されたポートプロキシの設定を表示します。
Write-Host "# ポートフォワード設定の確認"
Invoke-Expression "netsh interface portproxy show all";

Read-Host -Prompt "処理が全て完了しました。続行するには Enter キーを押してください。"
