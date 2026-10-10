; *** 天融 SkyFusion 安装向导简体中文语言文件 ***
;
; 用途：为 scripts\SkyFusion.iss 提供简体中文安装向导。
; 说明：Inno Setup 6 官方不附带简体中文（Languages\ 目录下没有 ChineseSimplified.isl），
;       因此本文件随仓库一起分发，编译安装包时必须与 SkyFusion.iss 相对位置一致。
; 维护：
;   · 本文件已完整翻译 Default.isl（Inno Setup 6.5.0+ English messages）中的全部条目，
;     因此用 ISCC 编译本安装包不会出现 "message has not been defined for the cn language" 提示。
;   · 未来 Inno Setup 升级若新增消息键，编译时会给出对应提示，按提示补译即可。
;   · 安装包自己的自定义消息（SkyFusionDesktopIcon / SkyFusionAdditionalIcons /
;     SkyFusionLaunchProgram / DotNet48Missing）不在这里，因为 Inno Setup 不允许在 .isl
;     消息文件中使用"语言名前缀"（会报 "A language name may not be specified in a messages
;     file"）；它们以 "cn." 前缀写在 SkyFusion.iss 的 [CustomMessages] 段落中。
; 注意：与英文原文一致，不要把原本没有句号的句子加上句号——Inno Setup 会自动补句号。
;
; 占位符速查：%1 %2 = 参数；[name] = 应用名；[name/ver] = 应用名 + 版本；
;             [gb] [mb] = 磁盘空间数值；%n = 换行；%% = 百分号

[LangOptions]
LanguageName=简体中文
LanguageID=$0804
; 不设置 LanguageCodePage：本文件按官方推荐使用「UTF-8 无 BOM」，
; 界面文本在安装程序内部以 Unicode 保存，去掉该项可避免在非中文区域设置的系统上乱码。
DialogFontName=Microsoft YaHei UI
DialogFontSize=9
WelcomeFontName=Microsoft YaHei UI
WelcomeFontSize=12

[Messages]

; *** 应用标题
SetupAppTitle=安装
SetupWindowTitle=安装 - %1
UninstallAppTitle=卸载
UninstallAppFullTitle=%1 卸载

; *** 通用提示标题
InformationTitle=提示
ConfirmTitle=确认
ErrorTitle=错误

; *** SetupLdr 引导程序
SetupLdrStartupMessage=即将安装 %1，是否继续？
LdrCannotCreateTemp=无法创建临时文件，安装已中止
LdrCannotExecTemp=无法在临时目录中运行文件，安装已中止
HelpTextNote=

; *** 启动错误
LastErrorMessage=%1。%n%n错误 %2：%3
SetupFileMissing=安装目录中缺少文件 %1。请修正该问题，或重新获取一份安装程序。
SetupFileCorrupt=安装文件已损坏，请重新获取一份安装程序。
SetupFileCorruptOrWrongVer=安装文件已损坏，或与本版本安装程序不兼容。请修正该问题，或重新获取一份安装程序。
InvalidParameter=命令行传入了无效参数：%n%n%1
SetupAlreadyRunning=安装程序已在运行。
WindowsVersionNotSupported=本程序不支持当前计算机所运行的 Windows 版本。
WindowsServicePackRequired=本程序需要 %1 Service Pack %2 或更高版本。
NotOnThisPlatform=本程序无法在 %1 上运行。
OnlyOnThisPlatform=本程序必须在 %1 上运行。
OnlyOnTheseArchitectures=本程序只能安装在以下处理器架构的 Windows 上：%n%n%1
WinVersionTooLowError=本程序需要 %1 版本 %2 或更高版本。
WinVersionTooHighError=本程序无法安装在 %1 版本 %2 或更高版本上。
AdminPrivilegesRequired=安装本程序必须以管理员身份登录。
PowerUserPrivilegesRequired=安装本程序必须以管理员身份，或以 Power Users 组成员身份登录。
SetupAppRunningError=安装程序检测到 %1 正在运行。%n%n请关闭它的所有窗口后点击「确定」继续，或点击「取消」退出。
UninstallAppRunningError=卸载程序检测到 %1 正在运行。%n%n请关闭它的所有窗口后点击「确定」继续，或点击「取消」退出。

; *** 启动询问
PrivilegesRequiredOverrideTitle=选择安装模式
PrivilegesRequiredOverrideInstruction=请选择安装模式
PrivilegesRequiredOverrideText1=%1 可以安装给所有用户（需要管理员权限），也可以只安装给你自己。
PrivilegesRequiredOverrideText2=%1 可以只安装给你自己，也可以安装给所有用户（需要管理员权限）。
PrivilegesRequiredOverrideAllUsers=安装给所有用户(&A)
PrivilegesRequiredOverrideAllUsersRecommended=安装给所有用户（推荐）(&A)
PrivilegesRequiredOverrideCurrentUser=仅安装给我(&M)
PrivilegesRequiredOverrideCurrentUserRecommended=仅安装给我（推荐）(&M)

; *** 其它错误
ErrorCreatingDir=安装程序无法创建目录「%1」
ErrorTooManyFilesInDir=无法在目录「%1」中创建文件，因为该目录中的文件数量过多

; *** 安装程序通用
ExitSetupTitle=退出安装
ExitSetupMessage=安装尚未完成。如果现在退出，程序将不会被安装。%n%n你可以稍后再次运行安装程序以完成安装。%n%n确定要退出吗？
AboutSetupMenuItem=关于安装程序(&A)...
AboutSetupTitle=关于安装程序
AboutSetupMessage=%1 版本 %2%n%3%n%n%1 主页：%n%4
AboutSetupNote=
TranslatorNote=

; *** 按钮
ButtonBack=< 上一步(&B)
ButtonNext=下一步(&N) >
ButtonInstall=安装(&I)
ButtonOK=确定
ButtonCancel=取消
ButtonYes=是(&Y)
ButtonYesToAll=全部是(&A)
ButtonNo=否(&N)
ButtonNoToAll=全部否(&O)
ButtonFinish=完成(&F)
ButtonBrowse=浏览(&B)...
ButtonWizardBrowse=浏览(&R)...
ButtonNewFolder=新建文件夹(&M)

; *** 选择安装语言
SelectLanguageTitle=选择安装语言
SelectLanguageLabel=请选择安装过程中使用的语言。

; *** 向导通用文本
ClickNext=点击「下一步」继续，或点击「取消」退出安装。
BeveledLabel=
BrowseDialogTitle=浏览文件夹
BrowseDialogLabel=请在下面的列表中选择一个文件夹，然后点击「确定」。
NewFolderName=新建文件夹

; *** 欢迎页
WelcomeLabel1=欢迎使用 [name] 安装向导
WelcomeLabel2=本向导将在你的计算机上安装 [name/ver]。%n%n继续之前，建议先关闭其它正在运行的程序。

; *** 密码页
WizardPassword=密码
PasswordLabel1=本次安装受密码保护。
PasswordLabel3=请输入密码，然后点击「下一步」继续。密码区分大小写。
PasswordEditLabel=密码(&P)：
IncorrectPassword=你输入的密码不正确，请重试。

; *** 许可协议页
WizardLicense=许可协议
LicenseLabel=继续之前，请先阅读以下重要信息。
LicenseLabel3=请阅读下面的许可协议。你必须接受本协议的条款才能继续安装。
LicenseAccepted=我接受本协议(&A)
LicenseNotAccepted=我不接受本协议(&D)

; *** 信息页
WizardInfoBefore=信息
InfoBeforeLabel=继续之前，请先阅读以下重要信息。
InfoBeforeClickLabel=准备好继续安装时，请点击「下一步」。
WizardInfoAfter=信息
InfoAfterLabel=继续之前，请先阅读以下重要信息。
InfoAfterClickLabel=准备好继续安装时，请点击「下一步」。

; *** 用户信息页
WizardUserInfo=用户信息
UserInfoDesc=请输入你的信息。
UserInfoName=用户名(&U)：
UserInfoOrg=组织(&O)：
UserInfoSerial=序列号(&S)：
UserInfoNameRequired=你必须输入用户名。

; *** 选择目标位置
WizardSelectDir=选择目标位置
SelectDirDesc=[name] 应该安装到哪里？
SelectDirLabel3=安装程序将把 [name] 安装到以下文件夹。
SelectDirBrowseLabel=点击「下一步」继续。如果想安装到其它文件夹，请点击「浏览」。
DiskSpaceGBLabel=至少需要 [gb] GB 可用磁盘空间。
DiskSpaceMBLabel=至少需要 [mb] MB 可用磁盘空间。
CannotInstallToNetworkDrive=安装程序无法安装到网络驱动器。
CannotInstallToUNCPath=安装程序无法安装到 UNC 路径。
InvalidPath=你必须输入带盘符的完整路径，例如：%n%nC:\APP%n%n或以下形式的 UNC 路径：%n%n\\server\share
InvalidDrive=你选择的驱动器或 UNC 共享不存在，或无法访问。请另选一个。
DiskSpaceWarningTitle=磁盘空间不足
DiskSpaceWarning=安装至少需要 %1 KB 可用空间，但所选驱动器仅有 %2 KB 可用。%n%n仍要继续吗？
DirNameTooLong=文件夹名称或路径过长。
InvalidDirName=文件夹名称无效。
BadDirName32=文件夹名称不能包含以下字符：%n%n%1
DirExistsTitle=文件夹已存在
DirExists=文件夹：%n%n%1%n%n已经存在。仍要安装到该文件夹吗？
DirDoesntExistTitle=文件夹不存在
DirDoesntExist=文件夹：%n%n%1%n%n不存在。要创建该文件夹吗？

; *** 选择组件页
; 本安装包没有组件，该页不会出现；补齐译文只为消除编译提示。
WizardSelectComponents=选择组件
SelectComponentsDesc=需要安装哪些组件？
SelectComponentsLabel2=请选择要安装的组件，取消勾选不需要的组件，然后点击「下一步」继续。
FullInstallation=完全安装
CompactInstallation=精简安装
CustomInstallation=自定义安装
NoUninstallWarningTitle=组件已存在
NoUninstallWarning=安装程序检测到以下组件已安装在你的计算机上：%n%n%1%n%n取消勾选这些组件并不会卸载它们。%n%n仍要继续吗？
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceGBLabel=当前选择至少需要 [gb] GB 磁盘空间。
ComponentsDiskSpaceMBLabel=当前选择至少需要 [mb] MB 磁盘空间。

; *** 选择附加任务
WizardSelectTasks=选择附加任务
SelectTasksDesc=需要执行哪些附加任务？
SelectTasksLabel2=请选择在安装 [name] 时要一并执行的附加任务，然后点击「下一步」。

; *** 选择开始菜单文件夹
WizardSelectProgramGroup=选择开始菜单文件夹
SelectStartMenuFolderDesc=安装程序应该把程序的快捷方式放在哪里？
SelectStartMenuFolderLabel3=安装程序将在以下「开始菜单」文件夹中创建程序快捷方式。
SelectStartMenuFolderBrowseLabel=点击「下一步」继续。如果想选择其它文件夹，请点击「浏览」。
MustEnterGroupName=你必须输入文件夹名称。
GroupNameTooLong=文件夹名称或路径过长。
InvalidGroupName=文件夹名称无效。
BadGroupName=文件夹名称不能包含以下字符：%n%n%1
NoProgramGroupCheck2=不创建开始菜单文件夹(&D)

; *** 准备安装页
WizardReady=准备安装
ReadyLabel1=安装程序已准备好，即将在你的计算机上安装 [name]。
ReadyLabel2a=点击「安装」开始安装；如果想检查或修改设置，请点击「上一步」。
ReadyLabel2b=点击「安装」开始安装。
ReadyMemoUserInfo=用户信息：
ReadyMemoDir=目标位置：
ReadyMemoType=安装类型：
ReadyMemoComponents=已选组件：
ReadyMemoGroup=开始菜单文件夹：
ReadyMemoTasks=附加任务：

; *** 下载页（安装包未使用，补齐译文以消除编译提示）
DownloadingLabel2=正在下载文件...
ButtonStopDownload=停止下载(&S)
StopDownload=确定要停止下载吗？
ErrorDownloadAborted=下载已中止
ErrorDownloadFailed=下载失败：%1 %2
ErrorDownloadSizeFailed=获取大小失败：%1 %2
ErrorProgress=进度无效：%2 中的 %1
ErrorFileSize=文件大小无效：期望 %1，实际 %2

; *** 解压页（安装包未使用，补齐译文以消除编译提示）
ExtractingLabel=正在解压文件...
ButtonStopExtraction=停止解压(&S)
StopExtraction=确定要停止解压吗？
ErrorExtractionAborted=解压已中止
ErrorExtractionFailed=解压失败：%1

; *** 压缩包解压失败详情
ArchiveIncorrectPassword=密码不正确
ArchiveIsCorrupted=压缩包已损坏
ArchiveUnsupportedFormat=不支持该压缩包格式

; *** 安装准备中
WizardPreparing=正在准备安装
PreparingDesc=安装程序正在准备在你的计算机上安装 [name]。
PreviousInstallNotCompleted=上一个程序的安装/卸载尚未完成。你需要重启计算机才能完成该操作。%n%n重启后请再次运行安装程序，以完成 [name] 的安装。
CannotContinue=安装程序无法继续。请点击「取消」退出。
ApplicationsFound=以下程序正在使用需要被安装程序更新的文件。建议允许安装程序自动关闭这些程序。
ApplicationsFound2=以下程序正在使用需要被安装程序更新的文件。建议允许安装程序自动关闭这些程序；安装完成后，安装程序会尝试重新启动它们。
CloseApplications=自动关闭这些程序(&A)
DontCloseApplications=不关闭这些程序(&D)
ErrorCloseApplications=安装程序无法自动关闭所有程序。建议你在继续之前手动关闭所有正在使用待更新文件的程序。
PrepareToInstallNeedsRestart=安装程序必须重启你的计算机。重启后请再次运行安装程序，以完成 [name] 的安装。%n%n要立即重启吗？

; *** 正在安装页
WizardInstalling=正在安装
InstallingLabel=请稍候，安装程序正在你的计算机上安装 [name]。

; *** 安装完成页
FinishedHeadingLabel=[name] 安装向导即将完成
FinishedLabelNoIcons=安装程序已在你的计算机上完成 [name] 的安装。
FinishedLabel=安装程序已在你的计算机上完成 [name] 的安装。你可以通过已创建的快捷方式启动该程序。
ClickFinish=点击「完成」退出安装程序。
FinishedRestartLabel=要完成 [name] 的安装，安装程序必须重启你的计算机。要立即重启吗？
FinishedRestartMessage=要完成 [name] 的安装，安装程序必须重启你的计算机。%n%n要立即重启吗？
ShowReadmeCheck=是，我想查看自述文件
YesRadio=是，立即重启计算机(&Y)
NoRadio=否，稍后由我自己重启计算机(&N)
RunEntryExec=运行 %1
RunEntryShellExec=查看 %1

; *** 需要下一张磁盘（安装包为单文件，不会出现）
ChangeDiskTitle=需要下一张磁盘
SelectDiskLabel2=请插入第 %1 张磁盘后点击「确定」。%n%n如果该磁盘上的文件位于下方所示之外的其他文件夹中，请输入正确的路径或点击「浏览」。
PathLabel=路径(&P)：
FileNotInDir2=在「%2」中找不到文件「%1」。请插入正确的磁盘，或选择其它文件夹。
SelectDirectoryLabel=请指定下一张磁盘的位置。

; *** 安装阶段提示
SetupAborted=安装未完成。%n%n请修正问题后重新运行安装程序。
AbortRetryIgnoreSelectAction=请选择操作
AbortRetryIgnoreRetry=重试(&T)
AbortRetryIgnoreIgnore=忽略该错误并继续(&I)
AbortRetryIgnoreCancel=取消安装
RetryCancelSelectAction=请选择操作
RetryCancelRetry=重试(&T)
RetryCancelCancel=取消

; *** 安装状态
StatusClosingApplications=正在关闭应用程序...
StatusCreateDirs=正在创建目录...
StatusExtractFiles=正在解压文件...
StatusDownloadFiles=正在下载文件...
StatusCreateIcons=正在创建快捷方式...
StatusCreateIniEntries=正在写入 INI 配置...
StatusCreateRegistryEntries=正在写入注册表...
StatusRegisterFiles=正在注册文件...
StatusSavingUninstall=正在保存卸载信息...
StatusRunProgram=正在完成安装...
StatusRestartingApplications=正在重新启动应用程序...
StatusRollback=正在回滚更改...

; *** 杂项错误
ErrorInternal2=内部错误：%1
ErrorFunctionFailedNoCode=%1 失败
ErrorFunctionFailed=%1 失败；错误码 %2
ErrorFunctionFailedWithMessage=%1 失败；错误码 %2。%n%3
ErrorExecutingProgram=无法运行文件：%n%1

; *** 注册表错误
ErrorRegOpenKey=打开注册表项出错：%n%1\%2
ErrorRegCreateKey=创建注册表项出错：%n%1\%2
ErrorRegWriteKey=写入注册表项出错：%n%1\%2

; *** INI 错误
ErrorIniEntry=在文件「%1」中创建 INI 条目时出错。

; *** 文件复制错误
FileAbortRetryIgnoreSkipNotRecommended=跳过该文件（不推荐）(&S)
FileAbortRetryIgnoreIgnoreNotRecommended=忽略该错误并继续（不推荐）(&I)
SourceIsCorrupted=源文件已损坏
SourceDoesntExist=源文件「%1」不存在
SourceVerificationFailed=源文件校验失败：%1
VerificationSignatureDoesntExist=签名文件「%1」不存在
VerificationSignatureInvalid=签名文件「%1」无效
VerificationKeyNotFound=签名文件「%1」使用了未知的密钥
VerificationFileNameIncorrect=文件名不正确
VerificationFileTagIncorrect=文件标记不正确
VerificationFileSizeIncorrect=文件大小不正确
VerificationFileHashIncorrect=文件哈希不正确
ExistingFileReadOnly2=现有文件被标记为只读，无法替换。
ExistingFileReadOnlyRetry=去掉只读属性后重试(&R)
ExistingFileReadOnlyKeepExisting=保留现有文件(&K)
ErrorReadingExistingDest=尝试读取现有文件时出错：
FileExistsSelectAction=请选择操作
FileExists2=文件已存在。
FileExistsOverwriteExisting=覆盖现有文件(&O)
FileExistsKeepExisting=保留现有文件(&K)
FileExistsOverwriteOrKeepAll=对后续冲突执行相同操作(&D)
ExistingFileNewerSelectAction=请选择操作
ExistingFileNewer2=现有文件比安装程序要写入的文件更新。
ExistingFileNewerOverwriteExisting=覆盖现有文件(&O)
ExistingFileNewerKeepExisting=保留现有文件（推荐）(&K)
ExistingFileNewerOverwriteOrKeepAll=对后续冲突执行相同操作(&D)
ErrorChangingAttr=尝试更改现有文件属性时出错：
ErrorCreatingTemp=尝试在目标目录中创建文件时出错：
ErrorReadingSource=尝试读取源文件时出错：
ErrorCopying=尝试复制文件时出错：
ErrorDownloading=尝试下载文件时出错：
ErrorExtracting=尝试解压文件时出错：
ErrorReplacingExistingFile=尝试替换现有文件时出错：
ErrorRestartReplace=RestartReplace 失败：
ErrorRenamingTemp=尝试重命名目标目录中的文件时出错：
ErrorRegisterServer=无法注册 DLL/OCX：%1
ErrorRegSvr32Failed=RegSvr32 失败，退出码 %1
ErrorRegisterTypeLib=无法注册类型库：%1

; *** 卸载显示名后缀
UninstallDisplayNameMark=%1（%2）
UninstallDisplayNameMarks=%1（%2，%3）
UninstallDisplayNameMark32Bit=32 位
UninstallDisplayNameMark64Bit=64 位
UninstallDisplayNameMarkAllUsers=所有用户
UninstallDisplayNameMarkCurrentUser=当前用户

; *** 安装后错误
ErrorOpeningReadme=尝试打开自述文件时出错。
ErrorRestartingComputer=安装程序无法重启计算机，请手动重启。

; *** 卸载程序
UninstallNotFound=文件「%1」不存在，无法卸载。
UninstallOpenError=无法打开文件「%1」，无法卸载
UninstallUnsupportedVer=卸载日志文件「%1」的格式无法被当前版本的卸载程序识别，无法卸载
UninstallUnknownEntry=卸载日志中出现了未知条目（%1）
ConfirmUninstall=确定要完全移除 %1 及其所有组件吗？
UninstallOnlyOnWin64=本次安装只能在 64 位 Windows 上卸载。
OnlyAdminCanUninstall=本次安装只能由具有管理员权限的用户卸载。
UninstallStatusLabel=请稍候，正在从你的计算机上移除 %1。
UninstalledAll=已成功从你的计算机上移除 %1。
UninstalledMost=%1 卸载完成。%n%n部分项目无法移除，你可以手动删除它们。
UninstalledAndNeedsRestart=要完成 %1 的卸载，必须重启你的计算机。%n%n要立即重启吗？
UninstallDataCorrupted=「%1」文件已损坏，无法卸载

; *** 卸载阶段
ConfirmDeleteSharedFileTitle=是否删除共享文件？
ConfirmDeleteSharedFile2=系统显示以下共享文件已不再被任何程序使用。要将其删除吗？%n%n如果有程序仍在使用该文件，删除后可能导致这些程序无法正常工作。如果不确定，请选择「否」；把文件留在系统中不会有任何危害。
SharedFileNameLabel=文件名：
SharedFileLocationLabel=位置：
WizardUninstalling=卸载状态
StatusUninstalling=正在卸载 %1...

; *** 关机阻止原因
ShutdownBlockReasonInstallingApp=正在安装 %1。
ShutdownBlockReasonUninstallingApp=正在卸载 %1。
