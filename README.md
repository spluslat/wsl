# WSL管理用バッチファイル集

Windows Subsystem for Linux2（WSL2）インスタンスの管理用のバッチファイルです。

## ファイル一覧

| # | バッチファイル | 概要 |
| ---- | ---- | ---- |
| 1 | wsllist.bat | WSLディストリビューションの一覧表示 |
| 2 | wslcreate.bat | WSLインスタンスのインポート |
| 3 | wsllogin.bat | 指定したWSLディストリビューションにユーザーとしてログイン |
| 4 | wslexport.bat | WSLディストリビューションのエクスポート |
| 5 | wsldel.bat | WSLインスタンスの削除 |

## 使用方法

### 1. wsllist.bat
WSLディストリビューションの一覧を表示します。

```powershell
wsllist
```

例:
```powershell
wsllist
```

### 2. wslcreate.bat
WSLインスタンスをインポートします。

```powershell
wslcreate <ディストリビューション名> [エクスポートファイル名]
```
- `<ディストリビューション名>`: インストールするLinuxディストリビューションの名前（必須）
- `[エクスポートファイル名]`: 使用するエクスポートファイルの名前（オプション、拡張子を除く）

例:
```powershell
wslcreate Ubuntu_foo Ubuntu-22.04
```

### 3. wsllogin.bat
指定されたWSLディストリビューションに、指定されたユーザーでログインします。

```powershell
wsllogin <ディストリビューション名> [ユーザー名]
```
- `<ディストリビューション名>`: 実行するLinuxディストリビューションの名前（必須）
- `[ユーザー名]`: 使用するユーザー名（オプション、デフォルトはroot）

例:
```powershell
wsllogin Ubuntu-22.04 username
```

### 4. wslexport.bat
指定されたWSLディストリビューションをエクスポートします。

```powershell
wslexport <ディストリビューション名>
```
- `<ディストリビューション名>`: エクスポートするLinuxディストリビューションの名前（必須）

例:
```powershell
wslexport Ubuntu-22.04
```

### 5. wsldel.bat
WSLインスタンスを削除し、関連するフォルダを削除します。

```powershell
wsldel <ディストリビューション名>
```
- `<ディストリビューション名>`: 削除するLinuxディストリビューションの名前（必須）

例:
```powershell
wsldel Ubuntu-22.04
```
