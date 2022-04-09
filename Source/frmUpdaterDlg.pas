﻿(*

    WinBox for 86Box - An alternative manager for 86Box VMs

    Copyright (C) 2020-2021, Laci bá'

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*)

unit frmUpdaterDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Graphics, ComCtrls, StdCtrls, ExtCtrls, Dialogs, Zip,
  Threading, uLang, uCommText;

type
  TUpdaterDlg = class(TForm, ILanguageSupport)
    AskUpdateDialog: TTaskDialog;
    imgIcon: TImage;
    lbDescription: TLabel;
    lbProgress: TLabel;
    pbProgress: TProgressBar;
    lbFileName: TLabel;
    lbInformation: TLabel;
    lbTitle: TLabel;
    lbFooter: TLabel;
    pnBottom: TPanel;
    bvFooter: TBevel;
    imgFooter: TImage;
    btnTerminate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AskUpdateDialogHyperlinkClicked(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
  private
    //[local]
    LocalDate, BuildDate: TDateTime;
    Build: integer;
    ChangeLog: TStringList;

    //[atomic]
    Cancelled: integer;

    //[thread]
    ZipStart: Cardinal;
    ZipText: string;
    Thread: ITask;
    Repository, EmulatorPath: string;
    GetSource: boolean;
    procedure DoUpdate;
    procedure Progress(const Text, FileName: string; const Position: integer = -1);
    procedure ZipProgress(Sender: TObject; FileName: string;
      Header: TZipHeader; Position: Int64);

    procedure WMStyleChanged(var Msg: TMessage); message WM_STYLECHANGED;
    procedure UMIconsChanged(var Msg: TMessage); message UM_ICONSETCHANGED;
  protected
    InitialHeight, InitialPPI: integer;
  public
    procedure Refresh;
    function AskUpdateAction: boolean;
    function AskAutoUpdate: boolean;

    procedure GetTranslation(Language: TLanguage); stdcall;
    procedure Translate; stdcall;
    procedure FlipBiDi; stdcall;
  end;

var
  UpdaterDlg: TUpdaterDlg;

implementation

{$R *.dfm}

uses uConfigMgr, uCommUtil, uWebUtils, dmGraphUtil, DateUtils,
     IOUtils, ShellAPI, Themes;

resourcestring
  StrProgressCleanUp    = 'UpdateDlg.Progress.CleanUp';
  StrProgressExtract    = 'UpdateDlg.Progress.Extract';
  StrProgressRemovePrev = 'UpdateDlg.Progress.RemovePrev';
  StrProgressDownload   = 'UpdateDlg.Progress.Download';
  StrProgressPrepare    = 'UpdateDlg.Progress.Preparing';
  UrlRepoRoms           = 'https://github.com/86Box/roms';
  UrlRepo86Box          = 'https://github.com/86Box/86Box';
  File86BoxSrc          = '86box-source.zip';
  File86BoxRoms         = '86box-roms.zip';
  FileJenkins           = '86box-jenkins.zip';
  FileEmpty             = '-';
  DlgFooterText         = 'UpdateDlg.FooterText';
  DlgAskAllowUpdate     = 'UpdateDlg.AskAllowUpdate';
  DlgAskLocalNewer      = 'UpdateDlg.AskLocalNewer';
  DlgAskUnknown         = 'UpdateDlg.AskUnknownVer';
  DlgAskFirstDownload   = 'UpdateDlg.AskFirstDownload';
  DlgDetailsInfo        = 'UpdateDlg.DetailsInfo';

function jenkinsGetBuild(URL: string; const Build: integer): string;
var
  List: TStringList;
  I: integer;
begin
  List := uWebUtils.jenkinsGetBuild(URL, Build);

  Result := '';
  case List.Count of
    1: Result := List[0];
    else
      for I := 0 to List.Count - 1 do
        if pos(Config.Artifact, List[I]) <> 0 then begin
          Result := List[I];
          break;
        end;
  end;

  List.Free;
end;


function TUpdaterDlg.AskUpdateAction: boolean;
var
  Path: array [0..52] of char;
  S: string;
  I: integer;
  List: TStringList;
begin
  with AskUpdateDialog do begin
    Caption := Application.Title;
    Title := Language.ReadString('UpdateDlg', 'lbTitle', Title);

    if LocaleIsBiDi then
      Flags := Flags + [tfRtlLayout]
    else
      Flags := Flags - [tfRtlLayout];

    if Build = -1 then
      raise Exception.Create(_T(ECantAccessServer))
    else if not FileExists(Config.EmulatorPath) then begin
      Text := _T(DlgAskFirstDownload);
      Flags := Flags + [tfUseHiconMain];
      MainIcon := tdiInformation;
      FooterText := '';
    end
    else if LocalDate = 0 then begin
      Text := _T(DlgAskUnknown);
      Flags := Flags - [tfUseHiconMain];
      MainIcon := tdiWarning;
      FooterText := _T(DlgFooterText);
    end
    else if CompareDateTime(LocalDate, BuildDate) >= 0 then begin
      Text := _T(DlgAskLocalNewer);
      Flags := Flags - [tfUseHiconMain];
      MainIcon := tdiWarning;
      FooterText := _T(DlgFooterText);
    end
    else begin
      Text := _T(DlgAskAllowUpdate);
      Flags := Flags + [tfUseHiconMain];
      MainIcon := tdiNone;
      FooterText := _T(DlgFooterText);
    end;

    PathCompactPathExW(@Path[0], PChar(ExtractFilePath(Config.EmulatorPath)), High(Path), 0);
    Path[High(Path)] := #0;

    ExpandedText := _T(DlgDetailsText, [Config.Repository, String(Path)]);

    if (Build <> -1) and (BuildDate <> 0) then
      ExpandedText := ExpandedText + #13#10#13#10 +
        _T(DlgDetailsInfo, [Build, DateTimeToStr(BuildDate)]);

    if (ChangeLog.Count > 0) and (MainIcon = tdiNone) then begin
      List := TStringList.Create;
      try
        ExpandedText := ExpandedText + #13#10#13#10 + _T(DlgDetailsChanges);
        for S in ChangeLog do begin
          List.Clear;
          List.Text := WrapText(S, #13#10, ['.',' ',#9,'-'], 65);
          for I := 0 to List.Count - 1 do begin
            if I = 0 then
              ExpandedText := ExpandedText + #13#10'    ' + List[I]
            else
              ExpandedText := ExpandedText + #13#10'       ' + List[I];
          end;
        end;
      finally
        List.Free;
      end;
    end;

    Execute;
    Result := ModalResult = mrYes;
  end;
end;

procedure TUpdaterDlg.AskUpdateDialogHyperlinkClicked(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(AskUpdateDialog.URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TUpdaterDlg.btnTerminateClick(Sender: TObject);
begin
  if btnTerminate.Caption = btnTerminate.Hint then
    ModalResult := mrCancel
  else begin
    AtomicExchange(Cancelled, 1);
    pbProgress.State := pbsPaused;
    IconSet.UpdateTaskbar(-1, -1, PROGRESS_PAUSED);
  end;
end;

procedure TUpdaterDlg.DoUpdate;
var
  TempFolder,
  DescName,
  BaseFolder,
  URL: string;

  Capture: Exception;
  Zip: TZipFile;

  I: integer;

  procedure CheckCancel;
  begin
    if Cancelled <> 0 then begin
      ModalResult := mrCancel;
      raise Exception.Create(_T('A műveletet a felhasználó megszakította.'));
    end;
  end;

  procedure DoInitialize;
  begin
    DescName := 'wbox_' + FormatDateTime('yy_mm_dd_hh_mm', Now) + '\';
    TempFolder := IncludeTrailingPathDelimiter(TPath.GetTempPath) + DescName;
    ForceDirectories(TempFolder);

    BaseFolder := ExtractFilePath(EmulatorPath);
    ForceDirectories(BaseFolder);

    URL := jenkinsGetBuild(Repository, Build);
  end;

begin
  try
    Progress(_T(StrProgressPrepare), FileEmpty, 0);
    DoInitialize;

    Progress(_T(StrProgressDownload), DescName + FileJenkins, 20);
    httpsGet(URL, TempFolder + FileJenkins);
    CheckCancel;

    Progress(_T(StrProgressDownload), DescName + File86BoxRoms, 30);
    gitClone(UrlRepoRoms, TempFolder + File86BoxRoms);
    CheckCancel;

    if GetSource then begin
      Progress(_T(StrProgressDownload), DescName + File86BoxSrc, 40);
      gitClone(UrlRepo86Box, TempFolder + File86BoxSrc);
      CheckCancel;
    end;

    if DirectoryExists(BaseFolder + 'roms\') then begin
      Progress(_T(StrProgressRemovePrev), 'roms\', 43);
      DeleteWithShell(BaseFolder + 'roms\');
      CheckCancel;
    end;

    if GetSource and DirectoryExists(BaseFolder + 'source\') then begin
      Progress(_T(StrProgressRemovePrev), 'source\', 46);
      DeleteWithShell(BaseFolder + 'source\');
      CheckCancel;
    end;

    ZipStart := GetTickCount;
    ZipText := _T(StrProgressExtract);
    Zip := TZipFile.Create;
    try
      Zip.OnProgress := ZipProgress;

      Zip.Open(TempFolder + FileJenkins, zmRead);
      for I := 0 to Zip.FileCount - 1 do begin
        URL := BaseFolder + StringReplace(Zip.FileNames[I], '/', '\', [rfReplaceAll]);
        if FileExists(URL) then begin
          Progress(_T(StrProgressRemovePrev), ExtractFileName(URL), 50);
          DeleteWithShell(URL, true);
        end;
      end;
      Zip.ExtractAll(BaseFolder);
      Zip.Close;
      CheckCancel;

      Progress(ZipText, '-', 66);
      Zip.Open(TempFolder + File86BoxRoms, zmRead);
      Zip.ExtractAll(BaseFolder);
      Zip.Close;
      FileSetDate(EmulatorPath, DateTimeToFileDate(Now));
      CheckCancel;

      if GetSource then begin
        Progress(ZipText, '-', 82);
        Zip.Open(TempFolder + File86BoxSrc, zmRead);
        Zip.ExtractAll(BaseFolder);
        Zip.Close;
        CheckCancel;
      end;
    finally
      Zip.Free;
    end;

    if not RenameFile(BaseFolder + 'roms-master', BaseFolder + 'roms') then
      RaiseLastOSError;

    if GetSource and not RenameFile(BaseFolder + '86box-master', BaseFolder + 'source')  then
      RaiseLastOSError;

    CheckCancel;

    Progress(_T(StrProgressCleanUp), DescName, 99);
    DeleteWithShell(ExcludeTrailingPathDelimiter(TempFolder), false);
    
    Progress(_T(StrProgressCleanUp), DescName, 100);

    TThread.Queue(TThread.CurrentThread,
      procedure
      begin
        ModalResult := mrOK;
      end);
  except
    Capture := AcquireExceptionObject as Exception;
    TThread.Queue(TThread.CurrentThread,
      procedure
      begin
        pbProgress.State := pbsError;
        IconSet.UpdateTaskbar(-1, -1, PROGRESS_ERROR);
        btnTerminate.Caption := btnTerminate.Hint;
        raise Capture;
      end);
  end;
end;

function TUpdaterDlg.AskAutoUpdate: boolean;
begin
  if not Config.AutoUpdate then
    Result := false
  else begin
    Refresh;
    if (Build <> -1) and (not
          FileExists(Config.EmulatorPath) or
          ((LocalDate <> 0) and
           (CompareDateTime(LocalDate, BuildDate) < 0))) then
      Result := AskUpdateAction
    else
      Result := false;
  end;
end;

procedure TUpdaterDlg.FlipBiDi;
begin
  SetCommCtrlBiDi(Handle, LocaleIsBiDi);
end;

procedure TUpdaterDlg.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
var
  Icon: TIcon;
  Handle: HICON;
begin
  if Succeeded(LoadIconWithScaleDown(0, MakeIntResource(IDI_WARNING),
      GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON), Handle)) then begin
        Icon := TIcon.Create;
        Icon.ReleaseHandle;
        Icon.Handle := Handle;
        imgFooter.Picture.Assign(Icon);
        Icon.Free;
      end;

  ClientHeight := InitialHeight * NewDPI div InitialPPI;
end;

procedure TUpdaterDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (pbProgress.Position < 100) and (pbProgress.State <> pbsError) then
    Action := caNone;

  IconSet.UpdateTaskbar(0, -1, PROGRESS_NONE);
end;

procedure TUpdaterDlg.FormCreate(Sender: TObject);
begin
  Thread := nil;

  ApplyActiveStyle;
  Perform(UM_ICONSETCHANGED, 0, 0);

  InitialHeight := ClientHeight;
  InitialPPI := CurrentPPI;

  FormAfterMonitorDpiChanged(Self, 96, CurrentPPI);

  ChangeLog := TStringList.Create;
end;

procedure TUpdaterDlg.FormDestroy(Sender: TObject);
begin
  ChangeLog.Free;
end;

procedure TUpdaterDlg.FormShow(Sender: TObject);
begin
  Translate;
  if LocaleIsBiDi then
    FlipBiDi;

  Cancelled := 0;
  pbProgress.Position := 0;
  pbProgress.State := pbsNormal;

  IconSet.UpdateTaskbar(0, pbProgress.Max, PROGRESS_NORMAL);

  Thread := nil;
  Thread := TTask.Create(DoUpdate);

  EmulatorPath := Config.EmulatorPath;
  Repository := Config.Repository;
  GetSource := Config.GetSource;

  Thread.Start;
end;

procedure TUpdaterDlg.Progress(const Text, FileName: string;
  const Position: integer);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      lbInformation.Caption := Text;
      lbFileName.Caption := FileName;

      if Position <> -1 then begin
        pbProgress.Position := Position;
        IconSet.UpdateTaskbar(Position, -1, -1);
      end;
    end);
end;

procedure TUpdaterDlg.Refresh;
var
  List: TStringList;
begin
  if not CheckForAccess(Config.Repository) then begin
    LocalDate := 0;
    BuildDate := 0;
    Build := -1;
    exit;
  end;

  if FileExists(Config.EmulatorPath) then
    LocalDate := GetFileTime(Config.EmulatorPath)
  else
    LocalDate := 0;

   Build := jenkinsLastBuild(Config.Repository);
   if Build = -1 then begin
     BuildDate := 0;
     List := nil;
   end
   else begin
     BuildDate := jenkinsGetDate(Config.Repository, Build);
     List := jenkinsGetChangelog(Config.Repository, Build);
   end;

   if Assigned(List) then begin
     ChangeLog.Assign(List);
     FreeAndNil(List);
   end
   else
     ChangeLog.Clear;
end;

procedure TUpdaterDlg.GetTranslation(Language: TLanguage);
begin
  Language.GetTranslation('UpdateDlg', Self);
end;

procedure TUpdaterDlg.Translate;
begin
  Language.Translate('UpdateDlg', Self);
  Caption := Application.Title;
end;

procedure TUpdaterDlg.UMIconsChanged(var Msg: TMessage);
begin
  with IconSet do begin
    IconsMaxDPI.GetIcon(27, AskUpdateDialog.CustomMainIcon);
    DisplayIcon(26, imgIcon, DefScaleOptions - [soBiDiRotate]);
  end;
end;

procedure TUpdaterDlg.WMStyleChanged(var Msg: TMessage);
begin
  Color := StyleServices(Self).GetSystemColor(clWindow);
end;

procedure TUpdaterDlg.ZipProgress(Sender: TObject; FileName: string;
  Header: TZipHeader; Position: Int64);
var
  Time: Cardinal;
begin
  Time := GetTickCount;
  if (Time - ZipStart) > 150 then begin
    Progress(format(ZipText, [FileName]), ExtractFileName(FileName), -1);
    ZipStart := Time;
  end;
end;

end.
