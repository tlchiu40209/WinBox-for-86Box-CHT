object WaitForm: TWaitForm
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  ClientHeight = 63
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  GlassFrame.Enabled = True
  GlassFrame.SheetOfGlass = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  DesignSize = (
    419
    63)
  TextHeight = 13
  object ProgressBar: TProgressBar
    Left = 16
    Top = 8
    Width = 385
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
end
