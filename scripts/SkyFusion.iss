; ============================================================================
; 天融 SkyFusion · Inno Setup 安装包脚本
; ----------------------------------------------------------------------------
; 编译命令（UNICODE 版 Inno Setup 6）：
;   ISCC.exe scripts\SkyFusion.iss
; 输出：dist\SkyFusion-Setup-<版本>.exe
;
; 【重要】Source 指向的目录必须是"与版本号一致"的离线包：
;   当前 = dist\天融SkyFusion-v1.2.1-Win10-11离线版
; 历史上这里曾指向 dist\SkyFusion-Win7-Audio（那是 v1.1.0 的旧包），
; 导致 1.2.1 的脚本会把 1.1.0 的程序打进去。改版本号时请一并核对本文件路径。
;
; 打包口径（与维护者确认）：只做 Windows 10 / 11 免运行时安装版，
;   不捆绑 .NET Framework 4.8 离线安装包（见下方 BundleDotNet48 开关）。
; ============================================================================

#define MyAppName "天融 SkyFusion"
#define MyAppShortName "SkyFusion"
#define MyAppVersion "1.2.1"
#define MyAppExeName "SkyFusion.exe"

; 打包源目录（相对本 .iss 所在目录），必须与 MyAppVersion 对应的离线包一致
#define BundleDir "..\dist\天融SkyFusion-v1.2.1-Win10-11离线版"

; 是否捆绑 .NET Framework 4.8 离线安装包。
;   取消下面这行的注释即可切换为"Win7 完整离线安装版"（安装包体积会从约 82 MB 涨到约 180 MB）。
;   注意：开启后需要把 NDP48 离线安装包放到下面的 DotNet48Source 路径。
; #define BundleDotNet48
#define DotNet48Source "..\artifacts\dotnet48\NDP48-x86-x64-AllOS-ENU.exe"

[Setup]
; AppId 保持不变，1.0.3 / 1.1.0 的老用户可以直接覆盖升级，不会被装成两个软件。
AppId={{A9F21C18-4B2A-4E5D-BB3A-C3A62A77F1C8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher=天融 SkyFusion
AppPublisherURL=https://github.com/p1816057-cpu/SkyFusion
AppSupportURL=https://github.com/p1816057-cpu/SkyFusion
AppUpdatesURL=https://github.com/p1816057-cpu/SkyFusion/releases/latest
DefaultDirName={autopf}\{#MyAppShortName}
DefaultGroupName={#MyAppShortName}
DisableProgramGroupPage=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
; 安装到 Program Files 需要管理员权限；程序自身仍是 asInvoker（见 app.manifest），不做提权。
PrivilegesRequired=admin
OutputDir=..\dist
OutputBaseFilename=SkyFusion-Setup-{#MyAppVersion}
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
; 让向导第一步就询问语言（英文在前 = 默认英文，不会自动切换）
ShowLanguageDialog=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
SetupIconFile=..\src\AudioConverter\Assets\app.ico

[Languages]
; 英文为第一项：未做语言匹配时会默认落在英文上。
Name: "en"; MessagesFile: "compiler:Default.isl"
; 简体中文：Inno Setup 6 官方不带该语言文件，因此随仓库一起分发。
; 若该文件缺失，编译仍可通过（走英文向导），便于在新机器上先跑通构建。
#if FileExists(AddBackslash(SourcePath) + "languages\ChineseSimplified.isl")
Name: "cn"; MessagesFile: "languages\ChineseSimplified.isl"
#endif

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#BundleDir}\{#MyAppExeName}";  DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\SkyFusion.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\使用说明.txt";         DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\LICENSE";               DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\THIRD-PARTY-NOTICES.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\FFmpeg-LICENSE.txt";    DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\FFmpeg-README.txt";     DestDir: "{app}"; Flags: ignoreversion
Source: "{#BundleDir}\ffmpeg\bin\ffmpeg.exe";  DestDir: "{app}\ffmpeg\bin"; Flags: ignoreversion
Source: "{#BundleDir}\ffmpeg\bin\ffprobe.exe"; DestDir: "{app}\ffmpeg\bin"; Flags: ignoreversion

#ifdef BundleDotNet48
Source: "{#DotNet48Source}"; DestDir: "{app}\运行库"; DestName: "NDP48-x86-x64-AllOS-ENU.exe"; Flags: ignoreversion
#endif

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[CustomMessages]
; 顶层 = 英文原文（默认语言）；"cn." 前缀 = 简体中文覆盖。
; 语言前缀必须写在主脚本里：Inno Setup 不允许在 .isl 消息文件中出现语言名。
; 不使用 Inno Setup 预定义的 CreateDesktopIcon / AdditionalIcons，
; 这样自定义文案对本项目维护者更直观，也避免与 .isl 里的定义互相覆盖。
SkyFusionDesktopIcon=Create a &desktop shortcut
SkyFusionAdditionalIcons=Additional shortcuts:
SkyFusionLaunchProgram=Launch {#MyAppName}
DotNet48Missing=Setup detected that .NET Framework 4.8 is not installed on this computer.%n%n{#MyAppName} requires .NET Framework 4.8 to run:%n- Windows 10 version 1903 or later and Windows 11 include it already.%n- Windows 7 SP1 requires .NET Framework 4.8 plus update KB4490628, KB4474419 and KB4019990.%n%nContinue the installation anyway? (The application may fail to start.)

cn.SkyFusionDesktopIcon=创建桌面快捷方式(&D)
cn.SkyFusionAdditionalIcons=附加快捷方式：
cn.SkyFusionLaunchProgram=启动 天融 SkyFusion
cn.DotNet48Missing=检测到本机未安装 .NET Framework 4.8。%n%n天融 SkyFusion 需要 .NET Framework 4.8 才能运行：%n· Windows 10 1903 及更高版本、Windows 11 已自带，无需安装；%n· Windows 7 SP1 需要自行安装 .NET Framework 4.8，并安装 KB4490628、KB4474419、KB4019990 三个系统补丁。%n%n仍要继续安装吗？（安装后程序可能无法启动）

; Inno Setup 预定义的自定义消息：本安装包没有用到，但为消除编译时
; "Custom message ... has not been defined for the cn language" 提示而一并翻译。
cn.NameAndVersion=%1 版本 %2
cn.AdditionalIcons=附加快捷方式：
cn.CreateDesktopIcon=创建桌面快捷方式(&D)
cn.CreateQuickLaunchIcon=创建快速启动栏快捷方式(&Q)
cn.ProgramOnTheWeb=%1 官方网站
cn.UninstallProgram=卸载 %1
cn.LaunchProgram=启动 %1
cn.AssocFileExtension=把 %1 关联到 %2 文件扩展名(&A)
cn.AssocingFileExtension=正在把 %1 关联到 %2 文件扩展名...
cn.AutoStartProgramGroupDescription=启动：
cn.AutoStartProgram=自动启动 %1
cn.AddonHostProgramNotFound=在您选择的文件夹中找不到 %1。%n%n仍要继续吗？

[Code]
const
  { .NET Framework 4.8 的 Release 门槛值，见微软官方文档 "Determine which .NET Framework versions are installed" }
  DotNet48Release = 528040;

{ .NET 4.8 检测：HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full 下的 Release 值 }
function IsDotNet48Installed(): Boolean;
var
  release: Cardinal;
begin
  Result := RegQueryDWordValue(HKLM,
    'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Release', release)
    and (release >= DotNet48Release);
end;

{ 提示 .NET 4.8 缺失（仅未捆绑运行库时使用） }
procedure WarnMissingDotNet48;
var
  answer: Integer;
begin
  answer := MsgBox(CustomMessage('DotNet48Missing'), mbConfirmation, MB_YESNO);
  if answer = IDNO then
    Abort;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep <> ssPostInstall then
    Exit;

  if IsDotNet48Installed() then
    Exit;

#ifdef BundleDotNet48
  { 捆绑模式：静默安装随包的 .NET 4.8 离线安装程序 }
  begin
    var installerPath: String;
    var resultCode: Integer;

    installerPath := ExpandConstant('{app}\运行库\NDP48-x86-x64-AllOS-ENU.exe');
    if not FileExists(installerPath) then
      Exit;

    if MsgBox('SkyFusion needs Microsoft .NET Framework 4.8.' + #13#10 +
              'Do you want to install it automatically now?', mbConfirmation, MB_YESNO) = IDYES then
    begin
      if Exec(installerPath, '/q /norestart', '', SW_SHOW, ewWaitUntilTerminated, resultCode) then
      begin
        if IsDotNet48Installed() then
          MsgBox('.NET Framework 4.8 has been installed successfully.', mbInformation, MB_OK)
        else
          MsgBox('The installation may need a restart. Please restart the computer and then run SkyFusion.',
                 mbInformation, MB_OK);
      end
      else
        MsgBox('Automatic installation failed. Please install .NET Framework 4.8 manually.',
               mbError, MB_OK);
    end
    else
    begin
      ShellExec('', installerPath, '', '', SW_SHOW, ewWaitUntilTerminated, resultCode);
    end;
  end;
#else
  { 非捆绑模式：只提示，不代装 }
  WarnMissingDotNet48;
#endif
end;
