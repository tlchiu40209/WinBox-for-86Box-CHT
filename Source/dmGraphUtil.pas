(*

    WinBox for 86Box - An alternative manager for 86Box VMs

    Copyright (C) 2021-2022, Laci b�'

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

unit dmGraphUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, Forms,
  ImageList, WinCodec, ComCtrls, ExtCtrls, Generics.Collections,
  ImgList, VirtualImageList, BaseImageCollection, ImageCollection,
  StdCtrls, Registry, Themes, System.Win.TaskbarCore, Vcl.Taskbar;

type
  TScaleOption = (soBiDiRotate, soOverScale);
  TScaleOptions = set of TScaleOption;

const
  DefScaleOptions = [soBiDiRotate, soOverScale];

const
  PROGRESS_NONE = 0;
  PROGRESS_MARQUEE = 1;
  PROGRESS_NORMAL = 2;
  PROGRESS_ERROR = 3;
  PROGRESS_PAUSED = 4;

type
  TIconSet = class(TDataModule)
    ListImages: TImageCollection;
    ListIcons: TVirtualImageList;
    ActionImages: TImageCollection;
    Icons32: TVirtualImageList;
    Icons16: TVirtualImageList;
    IconsMaxDPI: TVirtualImageList;
    procedure DeferStyleChange(Sender: TObject);
  private
    FPath: string;
    FDarkMode: boolean;
    FStyle, FDeferStyle: string;
    procedure SetPath(const Value: string);
    procedure SetStyle(const Value: string);
  protected
    BkupListImages,
    BkupActionImages: TObjectDictionary<string, TWICImage>;

    function BackupImageList(const Images: TImageCollection): TObjectDictionary<string, TWICImage>;
    procedure ChangeImageList(Images: TImageCollection; Path: string); overload;
    procedure ChangeImageList(Images: TImageCollection; List: TObjectDictionary<string, TWICImage>); overload;
  public
    //�tviteli v�ltoz� a TWinBoxMain.Taskbar-hoz - nem mindig assigned!
    Taskbar: TTaskbar;

    //Virtu�lis g�pek sz�n�nek enged�lyez�se/letilt�sa (pl. BiDi-n�l letiltva)
    IsColorsAllowed: boolean;

    //TWinBoxMain.Taskbar - nem mindig assigned!
    procedure UpdateTaskbar(const Progress, Max, Mode: integer);

    //Virtu�lis g�pek sz�n�nek enged�lyez�se/letilt�sa (pl. BiDi-n�l letiltva)
    procedure UpdateColorsAllowed;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //Ha m�r a MainForm is l�tre van hozva, be�ll�tani mindent.
    procedure Initialize(AControl: TControl);

    //K�pek friss�t�se pl. k�prajzol� elj�r�sok cser�je ut�n
    procedure RefreshImages;

    //S�t�t m�d lek�rdez�se �s be�ll�t�sa a registry alapj�n
    function UpdateDarkMode: boolean;

    //T�kr�z�tt k�prajzol� elj�r�sok
    procedure GetBitmapBiDi(ASourceImage: TWICImage; AWidth,
      AHeight: Integer; out ABitmap: TBitmap);
    procedure DrawBiDi(ASourceImage: TWICImage;
      ACanvas: TCanvas; ARect: TRect; AProportional: Boolean);

    //K�p bet�lt�se er�forr�sb�l, vagy f�jlb�l (att�l f�gg)
    procedure LoadImage(const Name: string; Image: TImage;
      const ScaleOptions: TScaleOptions = DefScaleOptions);

    //Ikon megjelen�t�se sk�l�z�si opci�kkal
    procedure DisplayIcon(const Index: integer; Image: TImage;
      const ScaleOptions: TScaleOptions = DefScaleOptions);

    //�jonnan l�trehozott VM-ek ikonj�nak fel�l�r�sa (ha van)
    procedure ExtractTemplIcon(const AName, APath: string);

    //el�rhet� ikonk�szletek lek�r�se
    function GetAvailIconSets(Root: string = ''): TStringList;
    function GetIconSetRoot: string;

    property Path: string read FPath write SetPath;
    property DarkMode: boolean read FDarkMode;
    property Style: string read FStyle write SetStyle;
  end;

  TStyleExtensions = class helper for TStyleManager
  public
    class procedure FixHiddenEdits(Control: TWinControl; const AllLevels, IsSystemStyle: boolean);
    class procedure ChangeControlStyle(Control: TWinControl; AStyleName: string; const AllLevels: boolean);
  end;

  TStylingWinControl = class helper for TWinControl
  public
    procedure ApplyActiveStyle;
    procedure ApplyStyle(const AStyleName: string);
  end;

var
  IconSet: TIconSet;

//PerMonitor v2 implement�ci�
function GetMaxDPI: integer;

//t�lt�cs�k sz�nez�se t�lt�tts�g szerint
procedure ColorProgress(const Control: TProgressBar); inline;
procedure ColorTaskbar(const Taskbar: TTaskbar);

//egyedileg rajzolt ComboBox BiDi-kompatibilis rajzol�sa
procedure ComboDrawBiDi(Canvas: TCanvas; Rect: TRect; ItemText: string);

//sz�nek a h�tt�rsz�n alapj�n
function GetTextColor(const Color: TColor): TColor;
function GetLinkColor(Color: TColor): TColor;

function LoadIconWithScaleDown(hinst: HINST; pszName: LPCWSTR; cx: Integer;
    cy: Integer; var phico: HICON): HResult; stdcall; external 'comctl32.dll';
{$EXTERNALSYM LoadIconWithScaleDown}

procedure ScaleWIC(var Source: TWICImage; const Width, Height: integer;
  const ScaleOptions: TScaleOptions = DefScaleOptions); overload;
procedure DisplayWIC(var Source: TWICImage; Image: TImage;
  const ScaleOptions: TScaleOptions = DefScaleOptions);
procedure LoadImageRes(const Name: string; Image: TImage;
  const ScaleOptions: TScaleOptions = DefScaleOptions);

//�zenet eljuttat�sa a program minden ablak�hoz
procedure BroadcastMessage(Msg: UINT; wParam: WPARAM; lParam: LPARAM);

//Source: https://coderedirect.com/questions/441320/prevent-rtl-tlistview-from-mirroring-check-boxes-and-or-graphics
const
  LAYOUT_RTL                        = $01;
  LAYOUT_BITMAPORIENTATIONPRESERVED = $08;

function GetLayout(DC: HDC): DWORD; stdcall; external 'gdi32.dll';
function SetLayout(DC: HDC; dwLayout: DWORD): DWORD; stdcall; external 'gdi32.dll';

procedure InvariantBiDiLayout(const DC: HDC); inline;

resourcestring
  PfIconSetPath   = 'Iconsets\';
  PathEmuIconSets = 'roms\icons\';

var
  RM_TaskButtonCreated: Cardinal = 0;

implementation

uses uCommUtil, uCommText, uLang;

resourcestring
  PfActionImages   = 'Actions\';
  PfListImages     = 'List\';
  PfDataImages     = 'Others\';
  PfTemplateImages = 'Templates\';
  PfIconInfo = 'iconinfo.txt';

  RegDarkModeKey = 'Software\Microsoft\Windows\CurrentVersion\Themes\Personalize';
  RegDarkModeName = 'AppsUseLightTheme';

const
  PROGRESS_RED    = 90;
  PROGRESS_YELLOW = 75;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function GetMaxDPI: integer;
var
  I: Integer;
begin
  Result := 96;
  for I := 0 to Screen.MonitorCount - 1 do
    if Screen.Monitors[I].PixelsPerInch > Result then
      Result := Screen.Monitors[I].PixelsPerInch;
end;

procedure ComboDrawBiDi(Canvas: TCanvas; Rect: TRect; ItemText: string);
begin
  if LocaleIsBiDi then begin
    Canvas.FillRect(Rect);
    Canvas.TextRect(Rect, ItemText, [tfRtlReading, tfRight]);
  end
  else
    Canvas.TextRect(Rect, Rect.Left, Rect.Top, ItemText);
end;

procedure BroadcastMessage(Msg: UINT; wParam: WPARAM; lParam: LPARAM);
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    Screen.Forms[I].Perform(Msg, wParam, lParam);
end;

//Ez a verzi� vissza�rja a k�pbe az �j Handle-t
procedure ScaleWIC(var Source: TWICImage; const Width, Height: integer;
  const ScaleOptions: TScaleOptions); overload;
var
  Factory: IWICImagingFactory;
  Scaler: IWICBitmapScaler;
  Rotator: IWICBitmapFlipRotator;
begin
  if not Assigned(Source) then
    exit;

  try
    Factory := TWICImage.ImagingFactory;

    if LocaleIsBiDi and (soBiDiRotate in ScaleOptions) then
      try
        Factory.CreateBitmapFlipRotator(Rotator);
        Rotator.Initialize(Source.Handle,
          WICBitmapTransformFlipHorizontal);
      finally
        Source.Handle := IWICBitmap(Rotator);
        Rotator := nil;
      end;

    Factory.CreateBitmapScaler(Scaler);
    Scaler.Initialize(Source.Handle, Width, Height,
      WICBitmapInterpolationModeHighQualityCubic);
  finally
    Source.Handle := IWICBitmap(Scaler);
    Scaler := nil;
    Factory := nil;
  end;
end;

procedure DisplayWIC(var Source: TWICImage; Image: TImage;
  const ScaleOptions: TScaleOptions);
var
  Temp: TWICImage;
  MaxDPI: integer;

  Size: TPoint;
begin
  MaxDPI := GetMaxDPI;

  Temp := TWICImage.Create;
  Temp.Assign(Source);

  if soOverScale in ScaleOptions then begin
    Size.X := Image.Width * MaxDPI div Image.CurrentPPI;
    Size.Y := Image.Height * MaxDPI div Image.CurrentPPI;
  end
  else begin
    Size.X := Image.Width;
    Size.Y := Image.Height;
  end;
  ScaleWIC(Temp, Size.X, Size.Y, ScaleOptions);
  Image.Picture.Assign(Temp);
  Temp.Free;

  if Image.Visible and Assigned(Image.Parent) and Image.Parent.Visible then
    Image.Parent.Invalidate;
end;

procedure LoadImageRes(const Name: string; Image: TImage;
  const ScaleOptions: TScaleOptions);
var
  Bitmap: TWICImage;
  Stream: TResourceStream;
begin
  Bitmap := TWICImage.Create;
  Stream := TResourceStream.Create(hInstance, Name, RT_RCDATA);
  try
    Bitmap.LoadFromStream(Stream);
    DisplayWIC(Bitmap, Image, ScaleOptions);
  finally
    Stream.Free;
    Bitmap.Free;
  end;
end;

function GetTextColor(const Color: TColor): TColor;
begin
  if (Color = clBtnFace) or (Color = clWindow) then
    Result := clWindowText
  else if 0.299 * GetRValue(Color) + 0.587 * GetGValue(Color) +
      0.114 * GetBValue(Color) > 127 then
    Result := clBlack
  else
    Result := clWhite;
end;

function GetLinkColor(Color: TColor): TColor;
var
  R, G, B, A: byte;
const
  VisibleDelta = 15;
begin
  if (Color = clBtnFace) or (Color = clWindow) or (Color = clNone) then
    Result := clHotLight
  else begin
    Color := ColorToRGB(Color);
    R := GetRValue(Color);
    G := GetGValue(Color);
    B := GetBValue(Color);

    A := byte((longword(R) + G + B) div 3);

    if (abs(R - A) + abs(B - A) + abs(G - A)) div 3 > VisibleDelta then
       Result := RGB($FF - R, $FF - G, $FF - B)
    else if A < 128 then
       Result := clWhite
    else
       Result := clBlack;
  end;
end;

procedure ColorProgress(const Control: TProgressBar); inline;
begin
  with Control do
    if Position > PROGRESS_RED then
      State := pbsError
    else if Position > PROGRESS_YELLOW then
      State := pbsPaused
    else
      State := pbsNormal;
end;

procedure ColorTaskbar(const Taskbar: TTaskbar);
begin
  if Assigned(Taskbar) then
    with TaskBar do
      if ProgressValue > PROGRESS_RED then
        ProgressState := TTaskBarProgressState.Error
      else if ProgressValue > PROGRESS_YELLOW then
        ProgressState := TTaskBarProgressState.Paused
      else
        ProgressState := TTaskBarProgressState.Normal;
end;

//Source: https://coderedirect.com/questions/441320/prevent-rtl-tlistview-from-mirroring-check-boxes-and-or-graphics
procedure InvariantBiDiLayout(const DC: HDC);
var
  Layout: DWORD;
begin
  Layout := GetLayout(DC);
  if (Layout and LAYOUT_RTL) <> 0 then
    SetLayout(DC, Layout or LAYOUT_BITMAPORIENTATIONPRESERVED);
end;

{ TIconSet }

function TIconSet.BackupImageList(
  const Images: TImageCollection): TObjectDictionary<string, TWICImage>;
var
  I: integer;
  Clone: TWICImage;
begin
  Result := TObjectDictionary<string, TWICImage>.Create;

  with Images do
    for I := 0 to Images.Count - 1 do
      with Images[I], SourceImages.Items[0] do begin
        Clone := TWICImage.Create;
        Clone.Assign(Image);

        Result.Add(Name, Clone);
      end;
end;

procedure TIconSet.ChangeImageList(Images: TImageCollection;
  List: TObjectDictionary<string, TWICImage>);
var
  I: integer;
  ListImage: TWICImage;
begin
  if not Assigned(List) then
    exit;

  with Images do
    for I := 0 to Images.Count - 1 do
      with Images[I], SourceImages.Items[0] do
        if List.TryGetValue(Name, ListImage) then
          Image.Assign(ListImage);
end;

procedure TIconSet.ChangeImageList(Images: TImageCollection; Path: string);
var
  I: integer;
  FileName: string;
begin
  Path := IncludeTrailingPathDelimiter(Path);

  with Images do
    for I := 0 to Images.Count - 1 do
    with Images[I], SourceImages.Items[0] do begin
      FileName := Path + Name + '.png';

      if FileExists(FileName) then
        Image.LoadFromFile(FileName);
    end;
end;

constructor TIconSet.Create(AOwner: TComponent);
begin
  inherited;
  Taskbar := nil;
  IsColorsAllowed := true;

  FStyle := 'Windows';
  FDeferStyle := '';

  //Induljunk valami olyan sz�veggel amit fixen mindig le kell cser�lni
  FPath := '?';

  //Ments�k le az eredeti k�plist�kat (vissza�ll�t�shoz)
  BkupListImages := BackupImageList(ListImages);
  BkupActionImages := BackupImageList(ActionImages);

  //K�rdezz�k le a s�t�t m�dot
  FDarkMode := false; //a program feh�rb�l indul
  UpdateDarkMode;
end;

//Az AProportional tulajdons�g jelenleg nem t�mogatott ezen a m�don.
procedure TIconSet.DeferStyleChange(Sender: TObject);
begin
  if Application.ModalLevel = 0 then begin
    SetStyle(FDeferStyle);
    Application.OnModalEnd := nil;
  end;
end;

destructor TIconSet.Destroy;
begin
  BkupActionImages.Free;
  BkupListImages.Free;
  inherited;
end;

procedure TIconSet.DisplayIcon(const Index: integer; Image: TImage;
  const ScaleOptions: TScaleOptions);
var
  Source: TWICImage;
begin
  if not Assigned(Image) then
    exit;

  if (Index >= 0) and (Index < ActionImages.Count) then begin
    Source := TWICImage.Create;
    try
      Source.Assign(ActionImages.Images[Index].SourceImages[0].Image);
      DisplayWIC(Source, Image, ScaleOptions);
    finally
      Source.Free;
    end;
  end
  else
    Image.Picture := nil;
end;

procedure TIconSet.DrawBiDi(ASourceImage: TWICImage; ACanvas: TCanvas;
  ARect: TRect; AProportional: Boolean);
begin
  if ARect.IsEmpty then
    Exit;

  if ASourceImage <> nil then begin
    ASourceImage.InterpolationMode := wipmHighQualityCubic;
    ACanvas.StretchDraw(ARect, ASourceImage);
  end;
end;

procedure TIconSet.ExtractTemplIcon(const AName, APath: string);
var
  AFileName: string;
begin
  AFileName := FPath + PfTemplateImages +
    ChangeFileExt(ExtractFileName(AName), '.png');

  if FileExists(AFileName) and FileExists(APath + VmIconFile) then
    CopyFile(PChar(AFileName), PChar(APath + VmIconFile), false);
end;

//Ez a verzi� bitk�pp� konvert�lja a k�p �j Handle-j�t, �s felszabad�tja
function TIconSet.GetAvailIconSets(Root: string): TStringList;
var
  SearchRec: TSearchRec;
  IconInfo: TextFile;
  Description, FileName: string;
begin
  if Root = '' then
    Root := GetIconSetRoot;

  Root := IncludeTrailingPathDelimiter(Root);
  Result := TStringList.Create;

  if FindFirst(Root + '*.*', faAnyFile, SearchRec) = 0 then begin
    repeat
      with SearchRec do
        if (Name <> '.') and (Name <> '..') and
           ((Attr and faDirectory) <> 0) then begin
             Description := Name;
             FileName := Root + Name + PathDelim + PfIconInfo;

             if FileExists(FileName) then begin
               AssignFile(IconInfo, FileName);
               try
                 Reset(IconInfo);
                 ReadLn(IconInfo, Description);
               finally
                 CloseFile(IconInfo);
               end;
             end;

             Result.Add(Name + '=' + Description);
           end;

    until FindNext(SearchRec) <> 0;

    FindClose(SearchRec);
  end;
end;

procedure TIconSet.GetBitmapBiDi(ASourceImage: TWICImage; AWidth,
  AHeight: Integer; out ABitmap: TBitmap);
var
  RotatedImage: TWICImage;
  BufferImage: TWICImage;
  Factory: IWICImagingFactory;
  Rotator: IWICBitmapFlipRotator;
begin
  Factory := TWICImage.ImagingFactory;
  Factory.CreateBitmapFlipRotator(Rotator);
  Rotator.Initialize(ASourceImage.Handle, WICBitmapTransformFlipHorizontal);

  ABitmap := TBitmap.Create;

  RotatedImage := TWICImage.Create;
  RotatedImage.Handle := IWICBitmap(Rotator);

  try
    if (ASourceImage.Width = AWidth) and (ASourceImage.Height = AHeight) then
      ABitmap.Assign(RotatedImage)
    else begin
      BufferImage := RotatedImage.CreateScaledCopy(AWidth, AHeight,
        wipmHighQualityCubic);
      try
        ABitmap.Assign(BufferImage);
      finally
        BufferImage.Free;
      end;
    end;
  finally
    RotatedImage.Free;
  end;

  if ABitmap.PixelFormat = pf32bit then
    ABitmap.AlphaFormat := afIgnored;
end;


function TIconSet.GetIconSetRoot: string;
begin
  Result := ExtractFilePath(paramstr(0)) + PfIconSetPath;
end;

procedure TIconSet.Initialize(AControl: TControl);
const
  ListIconSize = 42;
var
  MaxDPI: integer;
begin
  //�ll�tsuk be a DPI-nek megfelel�en a lista m�reteket
  with AControl do begin
    Icons16.SetSize(GetSystemMetrics(SM_CXSMICON),
                    GetSystemMetrics(SM_CYSMICON));

    Icons32.SetSize(GetSystemMetrics(SM_CXICON),
                    GetSystemMetrics(SM_CYICON));

    ListIcons.SetSize(ListIconSize * CurrentPPI div 96,
                      ListIconSize * CurrentPPI div 96);

    MaxDPI := GetMaxDPI;
    IconsMaxDPI.SetSize(32 * MaxDPI div 96,
                        32 * MaxDPI div 96);
  end;
end;

procedure TIconSet.LoadImage(const Name: string; Image: TImage;
  const ScaleOptions: TScaleOptions);
var
  FileName: string;
  Bitmap: TWICImage;
begin
  FileName := FPath + PfDataImages + Name + '.png';

  if (FPath = '') or not FileExists(FileName) then
    dmGraphUtil.LoadImageRes(Name, Image, ScaleOptions)
  else begin
    Bitmap := TWICImage.Create;
    try
      Bitmap.LoadFromFile(FileName);
      DisplayWIC(Bitmap, Image, ScaleOptions);
    finally
      Bitmap.Free;
    end;
  end;
end;

procedure TIconSet.RefreshImages;
begin
  UpdateColorsAllowed;

  if LocaleIsBiDi then begin
    ListImages.OnDraw := DrawBiDi;
    ListImages.OnGetBitmap := GetBitmapBiDi;

    ActionImages.OnDraw := DrawBiDi;
    ActionImages.OnGetBitmap := GetBitmapBiDi;
  end
  else begin
    ListImages.OnDraw := nil;
    ListImages.OnGetBitmap := nil;

    ActionImages.OnDraw := nil;
    ActionImages.OnGetBitmap := nil;
  end;

  Icons16.UpdateImageList;
  ListIcons.UpdateImageList;

  ActionImages.OnDraw := nil;
  ActionImages.OnGetBitmap := nil;

  Icons32.UpdateImageList;
end;

procedure TIconSet.SetPath(const Value: string);
begin
  if ((FPath = '') and (Value = '')) or
     (FPath = IncludeTrailingPathDelimiter(Value)) then
    exit;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  try
    ChangeImageList(ListImages, BkupListImages);
    ChangeImageList(ActionImages, BkupActionImages);

    if Value = '' then
      FPath := ''
    else begin
      FPath := IncludeTrailingPathDelimiter(Value);
      ChangeImageList(ListImages, FPath + PfListImages);
      ChangeImageList(ActionImages, FPath + PfActionImages);
    end;

    ListImages.Change;
    ActionImages.Change;
    RefreshImages;
    BroadcastMessage(UM_ICONSETCHANGED, 0, 0);
  finally
    Screen.Cursor := crArrow;
  end;
end;

procedure TIconSet.SetStyle(const Value: string);
var
  Success: boolean;
  I: integer;
  S: string;
begin
  if LocaleIsBiDi then
    exit;

  //A licenszel�s megk�veteli hogy csak az adott platformon lehessen
  //  haszn�lni a st�lust
  if (pos('Windows10', Value) <> 0) and
     (Win32MajorVersion < 10) then
    exit;

  (* fut�s k�zben nem v�ltunk t�m�t, �gy nem kell ez a k�d
  if Application.ModalLevel <> 0 then begin
    FDeferStyle := Value;
    Application.OnModalEnd := DeferStyleChange;
    MessageBox(Application.Handle, _P(StrDeferStyleChange),
      PChar(Application.Title), MB_ICONINFORMATION or MB_OK);
    exit;
  end;
    t�bb bug j�r vele mint haszon *)

  Success := false;
  if (Value <> '') then begin
    for S in TStyleManager.StyleNames do
      if S = Value then begin
        Success := true;
        break;
      end;

    if Success then
      FStyle := Value;
  end
  else if IconSet.DarkMode and (Win32MajorVersion >= 10) then
    FStyle := 'Windows10 DarkExplorer'
  else
    FStyle := 'Windows';

  for I := 0 to Screen.FormCount - 1 do begin
    TStyleManager.ChangeControlStyle(Screen.Forms[I], FStyle, true);
    Screen.Forms[I].Perform(CM_STYLECHANGED, 0, 0);
  end;

  UpdateColorsAllowed;
end;

procedure TIconSet.UpdateColorsAllowed;
begin
  IsColorsAllowed := not LocaleIsBiDi; //and
    //StyleServices(Application.MainForm).IsSystemStyle;
end;

function TIconSet.UpdateDarkMode: boolean;
var
  OldMode: boolean;
begin
  OldMode := FDarkMode;

  FDarkMode := false;
  with TRegistry.Create(KEY_READ) do
    try
      if OpenKey(RegDarkModeKey, false) then
           try
             FDarkMode := ValueExists(RegDarkModeName) and not ReadBool(RegDarkModeName);
           finally;
             CloseKey;
           end;
    finally
       Free;
    end;

  Result := OldMode <> FDarkMode;
end;

procedure TIconSet.UpdateTaskbar(const Progress, Max, Mode: integer);
begin
  if Assigned(Taskbar) and (Taskbar.Tag <> 0) then
    with Taskbar do begin
      if Progress <> -1 then
        ProgressValue := Progress;

      if Max <> -1 then
        ProgressMaxValue := Max;

      if Mode <> -1 then
        ProgressState := TTaskBarProgressState(Mode);
    end;
end;

{ TStyleExtensions }

class procedure TStyleExtensions.ChangeControlStyle(Control: TWinControl;
  AStyleName: string; const AllLevels: boolean);
var
  I: Integer;
begin
  if Assigned(Control) then begin
    Control.StyleName := AStyleName;
    StyleServices(Control).ApplyThemeChange;

    for I := 0 to Control.ControlCount - 1 do begin
      if AllLevels and (Control.Controls[I] is TWinControl) then
        ChangeControlStyle(Control.Controls[I] as TWinControl, AStyleName, true)
      else begin
        Control.StyleName := AStyleName;
        StyleServices(Control.Controls[I]).ApplyThemeChange;
      end;
    end;
  end;
end;

class procedure TStyleExtensions.FixHiddenEdits(Control: TWinControl;
  const AllLevels, IsSystemStyle: boolean);
var
  I: Integer;
begin
  if Assigned(Control) then
    for I := 0 to Control.ControlCount - 1 do begin
      if Control.Controls[I] is TEdit then
        with Control.Controls[I] as TEdit do
          if BorderStyle = bsNone then begin
            StyleElements := [];

            if IsSystemStyle then begin
              ParentColor := true;
              ParentFont := true;
            end
            else begin
              Color :=
                StyleServices(Control).GetSystemColor(clBtnFace);
              Font.Color :=
                StyleServices(Control).GetStyleFontColor(sfTextLabelNormal);
            end;
          end;

      if AllLevels and (Control.Controls[I] is TWinControl) and
         ((Control.Controls[I] as TWinControl).ControlCount > 0) then
           FixHiddenEdits(Control.Controls[I] as TWinControl,
             AllLevels, IsSystemStyle);
    end;
end;

{ TStylingWinControl }

procedure TStylingWinControl.ApplyActiveStyle;
begin
  ApplyStyle(IconSet.Style);
end;

procedure TStylingWinControl.ApplyStyle(const AStyleName: string);
begin
  if LocaleIsBiDi then
    exit;

  TStyleManager.ChangeControlStyle(Self, AStyleName, true);
  Perform(CM_STYLECHANGED, 0, 0);
end;


initialization
  RM_TaskButtonCreated := RegisterWindowMessage('TaskbarButtonCreated');

end.
