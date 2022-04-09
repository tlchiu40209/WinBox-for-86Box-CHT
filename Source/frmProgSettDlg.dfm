object ProgSettDlg: TProgSettDlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Programbe'#225'll'#237't'#225'sok'
  ClientHeight = 537
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = Reload
  PixelsPerInch = 96
  DesignSize = (
    460
    537)
  TextHeight = 13
  object pcPages: TPageControl
    Left = 8
    Top = 8
    Width = 444
    Height = 479
    ActivePage = tabAppearance
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 0
    object tabVMs: TTabSheet
      Caption = 'Virtu'#225'lis g'#233'pek'
      DesignSize = (
        436
        433)
      object grpNewVMs: TGroupBox
        Left = 19
        Top = 16
        Width = 401
        Height = 401
        Anchors = [akLeft, akTop, akRight]
        Caption = #218'j virtu'#225'lis g'#233'pek'
        TabOrder = 0
        DesignSize = (
          401
          401)
        object imgNewVM: TImage
          Left = 14
          Top = 24
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbDefaultPath: TLabel
          Left = 60
          Top = 24
          Width = 318
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Itt megadhatja hogy az '#250'j virtu'#225'lis g'#233'pek a sz'#225'm'#237't'#243'g'#233'pen melyik ' +
            'meghajt'#243'n, '#233's milyen k'#246'nyt'#225'rban ker'#252'ljenek kialak'#237't'#225'sra.'
          WordWrap = True
        end
        object lbPath: TLabel
          Left = 24
          Top = 72
          Width = 145
          Height = 25
          AutoSize = False
          Caption = '&El'#233'r'#233'si '#250't:'
          FocusControl = edPath
        end
        object lbEraseProt: TLabel
          Left = 24
          Top = 188
          Width = 342
          Height = 27
          AutoSize = False
          Caption = 'F'#225'jl&t'#246'rl'#233's-v'#233'delem:'
          FocusControl = cbEraseProt
        end
        object imgInfo: TImage
          Left = 14
          Top = 349
          Width = 32
          Height = 35
          Anchors = [akLeft, akBottom]
          Stretch = True
        end
        object lbOnlyNewVM: TLabel
          Left = 60
          Top = 354
          Width = 321
          Height = 54
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = 
            'Ezek a be'#225'll'#237't'#225'sok csak az '#250'jonnan l'#233'trehozott virtu'#225'lis g'#233'peket' +
            ' '#233'rintik, a m'#225'r megl'#233'v'#337'ek eset'#233'n semmit nem v'#225'ltoztatnak.'
          WordWrap = True
        end
        object lbEraseProtNote: TLabel
          Left = 24
          Top = 152
          Width = 343
          Height = 41
          AutoSize = False
          Caption = 
            'A f'#225'jlt'#246'rl'#233's-v'#233'delemmel megakad'#225'lyozhatja hogy a program kezel'#337'f' +
            'el'#252'l'#233'n bel'#252'l v'#233'letlen'#252'l t'#246'r'#246'lje a v'#233'dett virtu'#225'lis g'#233'pek f'#225'jlait' +
            '.'
          WordWrap = True
        end
        object lbDisplaySettings: TLabel
          Left = 25
          Top = 251
          Width = 119
          Height = 13
          Caption = '&Megjelen'#237't'#233'si be'#225'll'#237't'#225'sok:'
        end
        object lkAppearance: TLabel
          Left = 24
          Top = 293
          Width = 355
          Height = 13
          Cursor = crHandPoint
          HelpType = htKeyword
          HelpKeyword = 'tabAppearance'
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #218'j virtu'#225'lis g'#233'pek tov'#225'bbi megjelen'#237't'#233'si be'#225'll'#237't'#225'sai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = lbLinkClick
        end
        object lkLanguage: TLabel
          Left = 24
          Top = 310
          Width = 355
          Height = 13
          Cursor = crHandPoint
          HelpType = htKeyword
          HelpKeyword = 'tabLanguage'
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #218'j virtu'#225'lis g'#233'pek nyelvi be'#225'll'#237't'#225'sai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = lbLinkClick
        end
        object lkIconSet: TLabel
          Left = 25
          Top = 327
          Width = 355
          Height = 13
          Cursor = crHandPoint
          HelpType = htKeyword
          HelpKeyword = 'tabUI'
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #218'j virtu'#225'lis g'#233'pek ikonk'#233'szlet be'#225'll'#237't'#225'sai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = lbLinkClick
        end
        object btnPath: TButton
          Tag = 1
          Left = 333
          Top = 86
          Width = 42
          Height = 26
          Caption = '&...'
          TabOrder = 1
          OnClick = btnBrowseClick
        end
        object edPath: TEdit
          Left = 24
          Top = 91
          Width = 303
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 0
          Text = 'edPath'
        end
        object btnDefPath: TButton
          Tag = 1
          Left = 112
          Top = 118
          Width = 106
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 2
          OnClick = btnDefaultClick
        end
        object btnOpenPath: TButton
          Tag = 1
          Left = 224
          Top = 118
          Width = 142
          Height = 25
          Caption = 'K'#246'nyvt'#225'r meg&nyit'#225'sa...'
          TabOrder = 3
          OnClick = btnOpenClick
        end
        object cbEraseProt: TComboBox
          Left = 24
          Top = 206
          Width = 351
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 4
          Text = 'Bekapcsol'#225's csak a frissen import'#225'lt g'#233'pekn'#233'l'
          Items.Strings = (
            'Kikapcsol'#225's minden '#250'j/import'#225'lt virtu'#225'lis g'#233'pn'#233'l'
            'Bekapcsol'#225's csak a frissen import'#225'lt g'#233'pekn'#233'l'
            'Bekapcsol'#225's minden '#250'j/import'#225'lt virtu'#225'lis g'#233'pn'#233'l')
        end
        object btnDefEraseProt: TButton
          Tag = 9
          Left = 260
          Top = 234
          Width = 106
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 5
          OnClick = btnDefaultClick
        end
        object cbDefFullscreen: TCheckBox
          Left = 25
          Top = 269
          Width = 342
          Height = 17
          Caption = 
            #218'j virtu'#225'lis g'#233'pek ind'#237't'#225'sa alapbe'#225'll'#237't'#225's szerint &teljes k'#233'pern' +
            'y'#337'n'
          TabOrder = 6
        end
      end
    end
    object tabGeneral: TTabSheet
      Caption = #193'ltal'#225'nos'
      ImageIndex = 3
      DesignSize = (
        436
        433)
      object grpDefEmulator: TGroupBox
        Left = 16
        Top = 16
        Width = 402
        Height = 217
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Alap'#233'rtelmezett emul'#225'tor'
        TabOrder = 0
        DesignSize = (
          402
          217)
        object imgEmulator: TImage
          Left = 16
          Top = 24
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbDefEmulator: TLabel
          Left = 59
          Top = 24
          Width = 321
          Height = 41
          AutoSize = False
          Caption = 
            'Ezen a f'#252'l'#246'n megadhatja a virtu'#225'lis g'#233'pek '#225'ltal alap'#233'rtelmezette' +
            'n haszn'#225'lt 86Box emul'#225'tor adatait.'
          WordWrap = True
        end
        object lbAffectedVMs: TLabel
          Left = 24
          Top = 151
          Width = 361
          Height = 41
          AutoSize = False
          Caption = 
            'Ez a be'#225'll'#237't'#225's csak azokat a g'#233'peket '#233'rinti, amik az alapbe'#225'll'#237't' +
            #225's szerinti emul'#225'tort haszn'#225'lj'#225'k. Ett'#337'l elt'#233'rhet a virtu'#225'lis g'#233'p' +
            'ek profil be'#225'll'#237't'#225'sain'#225'l.'
          WordWrap = True
        end
        object lb86BoxPath: TLabel
          Left = 24
          Top = 71
          Width = 153
          Height = 26
          AutoSize = False
          Caption = '&El'#233'r'#233'si '#250't:'
          FocusControl = ed86Box
        end
        object lbVersion: TLabel
          Left = 208
          Top = 71
          Width = 176
          Height = 26
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'v3.0.0.1024'
        end
        object lkEmulatorUpdate: TLabel
          Left = 24
          Top = 188
          Width = 357
          Height = 13
          Cursor = crHandPoint
          HelpType = htKeyword
          HelpKeyword = 'tabAutoUpdate'
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Az emul'#225'tor automatikus friss'#237't'#233'si be'#225'll'#237't'#225'sai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = lbLinkClick
        end
        object btn86Box: TButton
          Tag = 2
          Left = 341
          Top = 89
          Width = 42
          Height = 26
          Caption = '&...'
          TabOrder = 1
          OnClick = btnBrowseClick
        end
        object ed86Box: TEdit
          Left = 24
          Top = 90
          Width = 311
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 0
          Text = 'ed86Box'
          OnChange = ed86BoxChange
        end
        object btnDef86Box: TButton
          Tag = 2
          Left = 120
          Top = 117
          Width = 106
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 2
          OnClick = btnDefaultClick
        end
        object btnOpen86Box: TButton
          Tag = 2
          Left = 232
          Top = 117
          Width = 142
          Height = 25
          Caption = 'K'#246'nyvt'#225'r meg&nyit'#225'sa...'
          TabOrder = 3
          OnClick = btnOpenClick
        end
      end
      object grpBehavior: TGroupBox
        Left = 18
        Top = 239
        Width = 402
        Height = 170
        Anchors = [akLeft, akTop, akRight]
        Caption = 'A program viselked'#233'se'
        TabOrder = 1
        DesignSize = (
          402
          170)
        object lbLaunchTimeout: TLabel
          Left = 14
          Top = 60
          Width = 151
          Height = 20
          AutoSize = False
          Caption = 'Emul'#225'tor ind'#237't'#225'si &id'#337't'#250'll'#233'p'#233's:'
        end
        object lbMilliseconds: TLabel
          Left = 291
          Top = 60
          Width = 92
          Height = 20
          AutoSize = False
          Caption = 'ezredm'#225'sodp.'
        end
        object lbTrayBehavior: TLabel
          Left = 14
          Top = 32
          Width = 119
          Height = 21
          AutoSize = False
          Caption = '&'#201'rtes'#237't'#233'si ter'#252'leti ikon:'
          FocusControl = cbTrayBehavior
        end
        object lbTaskbarProgress: TLabel
          Left = 14
          Top = 88
          Width = 120
          Height = 13
          AutoSize = False
          Caption = '&Terhel'#233'sjelz'#233's a t'#225'lc'#225'n:'
        end
        object lkProgramUpdate: TLabel
          Left = 14
          Top = 141
          Width = 373
          Height = 13
          Cursor = crHandPoint
          HelpType = htKeyword
          HelpKeyword = 'tabAutoUpdate'
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'A program automatikus friss'#237't'#233'si be'#225'll'#237't'#225'sai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = lbLinkClick
        end
        object spLaunchTimeout: TSpinEdit
          Left = 171
          Top = 57
          Width = 111
          Height = 22
          MaxValue = 60000
          MinValue = 1000
          TabOrder = 0
          Value = 5000
        end
        object cbTrayBehavior: TComboBox
          Left = 139
          Top = 28
          Width = 246
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'Nincs '#233'rtes'#237't'#233'si ter'#252'leti ikon, kis m'#233'ret a t'#225'lc'#225'n'
          Items.Strings = (
            'Nincs '#233'rtes'#237't'#233'si ter'#252'leti ikon, kis m'#233'ret a t'#225'lc'#225'n'
            'Ikon az '#233'rtes'#237't'#233'si ter'#252'leten, kis m'#233'ret a t'#225'lc'#225'n'
            'Kis m'#233'ret az '#233'rtes'#237't'#233'si ter'#252'leten lev'#337' ikonra'
            'Bez'#225'r'#225's az '#233'rtes'#237't'#233'si ter'#252'leten lev'#337' ikonra')
        end
        object cbMinimizeOnStart: TCheckBox
          Left = 14
          Top = 114
          Width = 369
          Height = 17
          Caption = 'A WinBox &kis m'#233'ret'#369'v'#233' t'#233'tele egy virtu'#225'lis g'#233'p elind'#237't'#225'sakor'
          TabOrder = 2
        end
        object cbTaskbarProgress: TComboBox
          Left = 140
          Top = 85
          Width = 245
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'Kikapcsolva'
          Items.Strings = (
            'Kikapcsolva'
            'Processzorterhel'#233's megjelen'#237't'#233'se'
            'Lefoglalt mem'#243'ria megjelen'#237't'#233'se'
            'Fut'#243' virtu'#225'lis g'#233'pek megjelen'#237't'#233'se')
        end
      end
    end
    object tabAutoUpdate: TTabSheet
      Caption = 'Automatikus friss'#237't'#233'sek'
      ImageIndex = 9
      DesignSize = (
        436
        433)
      object grpEmulatorUpdates: TGroupBox
        Left = 18
        Top = 136
        Width = 402
        Height = 273
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Emul'#225'tor friss'#237't'#233'sek'
        TabOrder = 0
        DesignSize = (
          402
          273)
        object lbArtifact: TLabel
          Left = 23
          Top = 29
          Width = 354
          Height = 28
          AutoSize = False
          Caption = 'Let'#246'lt'#233'sre kijel'#246'lt 86Box forr'#225's&t'#237'pus:'
          FocusControl = edArtifact
        end
        object imgInfo2: TImage
          Left = 23
          Top = 224
          Width = 32
          Height = 32
          Anchors = [akLeft, akBottom]
          Stretch = True
        end
        object lbArtfSwitchNote: TLabel
          Left = 66
          Top = 227
          Width = 321
          Height = 54
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = 
            'Ha azonnal le szeretn'#233' cser'#233'lni a jelenlegi forr'#225'st'#237'pust, ezen a' +
            'blak bez'#225'r'#225'sa ut'#225'n futtassa v'#233'gig az emul'#225'tor friss'#237't'#337' modult.'
          WordWrap = True
          ExplicitTop = 236
        end
        object cbAutoUpdate: TCheckBox
          Left = 23
          Top = 173
          Width = 300
          Height = 17
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Emul'#225'tor friss'#237't'#233'sek keres'#233'se &automatikusan'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbGetSource: TCheckBox
          Left = 23
          Top = 196
          Width = 265
          Height = 17
          Anchors = [akLeft, akRight, akBottom]
          Caption = '&Forr'#225'sk'#243'd let'#246'lt'#233'se, ha lehets'#233'ges'
          TabOrder = 2
        end
        object edArtifact: TEdit
          Left = 23
          Top = 49
          Width = 353
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = '86Box-Windows-32'
          OnChange = edArtifactChange
        end
        object tvArtifact: TTreeView
          Left = 23
          Top = 76
          Width = 353
          Height = 84
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          HideSelection = False
          Indent = 19
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 3
          OnChange = tvArtifactChange
          Items.NodeData = {
            03020000005C000000000000000000000000000000FFFFFFFF00000000000000
            0002000000011FDA006A002000640069006E0061006D0069006B007500730020
            00FA006A007200610066006F0072006400ED007400F300200028006200E90074
            00610029004A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            00020000000116570069006E0064006F007700730020002D0020007800360034
            0020002800360034002D006200690074002900520000000000000000000000FF
            FFFFFFFFFFFFFF000000000000000000000000011A3800360042006F0078002D
            004E00440052002D00440065006200750067002D00570069006E0064006F0077
            0073002D0036003400460000000000000000000000FFFFFFFFFFFFFFFF000000
            00000000000000000001143800360042006F0078002D004E00440052002D0057
            0069006E0064006F00770073002D00360034004A0000000000000000000000FF
            FFFFFFFFFFFFFF0000000000000000020000000116570069006E0064006F0077
            00730020002D00200078003800360020002800330032002D0062006900740029
            00520000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
            00011A3800360042006F0078002D004E00440052002D00440065006200750067
            002D00570069006E0064006F00770073002D0033003200460000000000000000
            000000FFFFFFFFFFFFFFFF00000000000000000000000001143800360042006F
            0078002D004E00440052002D00570069006E0064006F00770073002D00330032
            0068000000000000000000000001000000FFFFFFFF0000000000000000020000
            0001255200E900670069002000640069006E0061006D0069006B007500730020
            00FA006A007200610066006F0072006400ED007400F3002000280061006A00E1
            006E006C006F007400740029004A0000000000000000000000FFFFFFFFFFFFFF
            FF0000000000000000020000000116570069006E0064006F007700730020002D
            00200078003600340020002800360034002D0062006900740029004A00000000
            00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000116380036
            0042006F0078002D00440065006200750067002D00570069006E0064006F0077
            0073002D00360034003E0000000000000000000000FFFFFFFFFFFFFFFF000000
            00000000000000000001103800360042006F0078002D00570069006E0064006F
            00770073002D00360034004A0000000000000000000000FFFFFFFFFFFFFFFF00
            00000000000000020000000116570069006E0064006F007700730020002D0020
            0078003800360020002800330032002D0062006900740029004A000000000000
            0000000000FFFFFFFFFFFFFFFF00000000000000000000000001163800360042
            006F0078002D00440065006200750067002D00570069006E0064006F00770073
            002D00330032003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001103800360042006F0078002D00570069006E0064006F0077
            0073002D0033003200}
        end
      end
      object grpProgramUpdates: TGroupBox
        Left = 16
        Top = 17
        Width = 402
        Height = 113
        Caption = 'Programfriss'#237't'#233'sek'
        TabOrder = 1
        object lbWinBoxUpdate: TLabel
          Left = 23
          Top = 27
          Width = 354
          Height = 26
          AutoSize = False
          Caption = 'A WinBox &friss'#237't'#233'seinek kezel'#233'se:'
          FocusControl = cbWinBoxUpdate
        end
        object cbWinBoxUpdate: TComboBox
          Left = 23
          Top = 45
          Width = 353
          Height = 21
          Style = csDropDownList
          ItemIndex = 3
          TabOrder = 0
          Text = 'Telep'#237't'#337' let'#246'lt'#233'se, automatikus telep'#237't'#233's'
          Items.Strings = (
            'Ne keressen '#250'j WinBox verzi'#243'kat'
            'K'#233'zi let'#246'lt'#233'si lehet'#337's'#233'g, egy'#233'ni friss'#237't'#233's'
            'Telep'#237't'#337' let'#246'lt'#233'se, v'#233'gigk'#237's'#233'rt telep'#237't'#233's'
            'Telep'#237't'#337' let'#246'lt'#233'se, automatikus telep'#237't'#233's')
        end
        object btnDefWinBoxUpd: TButton
          Tag = 10
          Left = 144
          Top = 72
          Width = 106
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 1
          OnClick = btnDefaultClick
        end
        object btnPortWinBoxUpd: TButton
          Tag = 11
          Left = 256
          Top = 72
          Width = 110
          Height = 25
          Caption = '&Hordozhat'#243' m'#243'd'
          TabOrder = 2
          OnClick = btnDefaultClick
        end
      end
    end
    object tabAppearance: TTabSheet
      Caption = 'Megjelen'#233's'
      ImageIndex = 1
      DesignSize = (
        436
        433)
      object grpAppearance: TGroupBox
        Left = 18
        Top = 16
        Width = 402
        Height = 400
        Anchors = [akLeft, akTop, akRight]
        Caption = #218'j g'#233'pek megjelen'#233'se'
        TabOrder = 0
        object imgDisplay: TImage
          Left = 18
          Top = 24
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbDefaultDisplay: TLabel
          Left = 32
          Top = 89
          Width = 353
          Height = 28
          AutoSize = False
          Caption = 
            'Fix m'#233'retez'#233's'#369' ablak (pl. 960x720), '#233's 4:3 k'#233'par'#225'ny teljes k'#233'per' +
            'ny'#337'n. '
          Layout = tlCenter
          WordWrap = True
        end
        object lbFullscreenSizing: TLabel
          Left = 32
          Top = 238
          Width = 154
          Height = 27
          AutoSize = False
          Caption = '&Teljes k'#233'perny'#337's m'#233'retez'#233's: '
          FocusControl = cbFullscreenSizing
        end
        object lbWindowSizing: TLabel
          Left = 32
          Top = 211
          Width = 154
          Height = 21
          AutoSize = False
          Caption = '&Ablak m'#233'retez'#233'si m'#243'd:'
        end
        object lbAppearance: TLabel
          Left = 64
          Top = 16
          Width = 321
          Height = 49
          AutoSize = False
          Caption = 
            'Itt megadhatja hogy '#250'j 86Box g'#233'pek milyen megjelen'#233'ssel legyenek' +
            ' l'#233'trehozva. Ez k'#233's'#337'bb szem'#233'lyre szabhat'#243' g'#233'penk'#233'nt.'
          Layout = tlCenter
          WordWrap = True
        end
        object rbDefaultDisplay: TRadioButton
          Left = 18
          Top = 71
          Width = 367
          Height = 17
          Caption = '&Alap'#233'rtelmezett megjelent'#237't'#233'si be'#225'll'#237't'#225'sok'
          TabOrder = 0
          OnClick = UpdateApperance
        end
        object rbCustomDisplay: TRadioButton
          Left = 18
          Top = 120
          Width = 351
          Height = 17
          Caption = '&Egy'#233'ni m'#233'retez'#233'si be'#225'll'#237't'#225'sok'
          TabOrder = 1
          OnClick = UpdateApperance
        end
        object clbCustomOptions: TCheckListBox
          Left = 32
          Top = 143
          Width = 337
          Height = 58
          ItemHeight = 13
          Items.Strings = (
            'R'#246'gz'#237'tett 4:3 k'#233'par'#225'ny megtart'#225'sa'
            'T'#250'lp'#225'szt'#225'z'#225's enged'#233'lyez'#233'se (mint EGA/VGA)'
            'M'#233'retez'#233's a rendszer DPI '#233'rt'#233'k'#233're'
            'Line'#225'ris sk'#225'l'#225'z'#225's alkalmaz'#225'sa (ha lehets'#233'ges)'
            'Kontraszt megn'#246'vel'#233'se (monokr'#243'm kijelz'#337'n'#233'l)'
            #193'llapotsori ikonok friss'#237't'#233'se'
            #193'llapotsor elrejt'#233'se'
            'Inform'#225'ci'#243'k megjelen'#237't'#233'se teljes k'#233'perny'#337're v'#225'lt'#225'skor'
            'Kil'#233'p'#233'si meger'#337's'#237't'#233's k'#233'r'#233'se'
            'Discord t'#225'mogat'#225's enged'#233'lyez'#233'se')
          TabOrder = 2
          OnClickCheck = CustomDisplayChange
        end
        object cbFullscreenSizing: TComboBox
          Left = 192
          Top = 234
          Width = 177
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 4
          Text = 'R'#246'gz'#237'tett 4:3 k'#233'par'#225'ny'
          OnChange = CustomDisplayChange
          Items.Strings = (
            'Ny'#250'jt'#225's'
            'R'#246'gz'#237'tett 4:3 k'#233'par'#225'ny'
            'Eredeti k'#233'par'#225'ny megtart'#225'sa'
            'Csak eg'#233'sz sz'#225'm'#250' nagy'#237't'#225's')
        end
        object cbWindowSizing: TComboBox
          Left = 192
          Top = 207
          Width = 177
          Height = 21
          Style = csDropDownList
          ItemIndex = 2
          TabOrder = 3
          Text = 'R'#246'gz'#237'tett felbont'#225's a sablonb'#243'l'
          OnChange = CustomDisplayChange
          Items.Strings = (
            'Pillanatnyi felbont'#225's szerint'
            'Szabadon '#225'tm'#233'retezhet'#337
            'R'#246'gz'#237'tett felbont'#225's a sablonb'#243'l'
            'Eredeti k'#233'p 0,5x kicsiny'#237't'#233'se'
            'Eredeti k'#233'p 1,5x nagy'#237't'#225'sa'
            'Eredeti k'#233'p 2x nagy'#237't'#225'sa')
        end
        object rbManualOptions: TRadioButton
          Left = 18
          Top = 261
          Width = 351
          Height = 17
          Caption = '&K'#233'zi megad'#225's'#250' be'#225'll'#237't'#225'sok'
          TabOrder = 5
          OnClick = UpdateApperance
        end
        object mmManualOptions: TMemo
          Left = 32
          Top = 284
          Width = 217
          Height = 58
          Lines.Strings = (
            'window_remember 0'
            'force_43 0'
            'enable_overscan 0'
            'video_filter_method 1'
            'vid_cga_contrast 0'
            'dpi_scale 1'
            'vid_cga_contrast'
            'update_icons 1'
            'confirm_exit 1'
            'enable_discord 0')
          ScrollBars = ssVertical
          TabOrder = 6
          WordWrap = False
        end
        object rbNoDisplayOptions: TRadioButton
          Left = 18
          Top = 356
          Width = 327
          Height = 17
          Caption = '&Ne ker'#252'ljenek l'#233'trehoz'#225'sra megjelen'#237't'#233'si be'#225'll'#237't'#225'sok'
          TabOrder = 8
          OnClick = UpdateApperance
        end
        object btnManOptLoad: TButton
          Left = 255
          Top = 282
          Width = 114
          Height = 25
          Caption = '&Bet'#246'lt'#233's f'#225'jlb'#243'l...'
          TabOrder = 7
          OnClick = btnManOptLoadClick
        end
      end
    end
    object tabUI: TTabSheet
      Caption = 'Kezel'#337'fel'#252'let'
      ImageIndex = 6
      object grpPositionData: TGroupBox
        Left = 16
        Top = 296
        Width = 404
        Height = 121
        Caption = 'Helyzet, m'#233'ret '#233's elrendez'#233's'
        TabOrder = 0
        DesignSize = (
          404
          121)
        object lbPositionCurrentDesc: TLabel
          Left = 20
          Top = 28
          Width = 245
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Jelenlegi m'#233'ret '#233's poz'#237'ci'#243':'
        end
        object lbPositionSavedDesc: TLabel
          Left = 20
          Top = 66
          Width = 237
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Mentett m'#233'ret '#233's poz'#237'ci'#243':'
        end
        object lbPositionCurrent: TLabel
          Left = 40
          Top = 47
          Width = 217
          Height = 13
          Hint = '(alap'#233'rt.)'
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lbPositionCurrent'
        end
        object lbPositionSaved: TLabel
          Left = 40
          Top = 85
          Width = 225
          Height = 13
          Hint = '(alap'#233'rt.)'
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lbPositionSaved'
        end
        object btnPositionClear: TButton
          Left = 271
          Top = 66
          Width = 113
          Height = 25
          Caption = 'Ala&p'#233'rtelmezett'
          TabOrder = 0
          OnClick = btnPositionClick
        end
        object btnPositionSave: TButton
          Tag = 7
          Left = 271
          Top = 35
          Width = 113
          Height = 25
          Caption = #193'llapot &ment'#233'se '#9660
          DropDownMenu = pmPosition
          TabOrder = 1
          OnClick = btnCustomDropDown
        end
      end
      object grpIconSets: TGroupBox
        Left = 16
        Top = 16
        Width = 404
        Height = 274
        Caption = 'Ikonk'#233'szletek'
        TabOrder = 1
        object lbProgIconSet: TLabel
          Left = 20
          Top = 64
          Width = 365
          Height = 25
          AutoSize = False
          Caption = 'A &program '#225'ltal haszn'#225'lt ikonk'#233'szlet:'
          FocusControl = cbProgIconSet
        end
        object lbEmuIconSet: TLabel
          Left = 20
          Top = 135
          Width = 365
          Height = 25
          AutoSize = False
          Caption = 'Az &emul'#225'tor '#225'ltal haszn'#225'lt ikonk'#233'szlet:'
          FocusControl = cbEmuIconSet
        end
        object lbEmuIconSetNote: TLabel
          Left = 20
          Top = 224
          Width = 361
          Height = 41
          AutoSize = False
          Caption = 
            'Az emul'#225'tor ikonk'#233'szlet'#233're vonatkoz'#243' be'#225'll'#237't'#225's csak az '#250'j virtu'#225 +
            'lis g'#233'peket '#233'rinti, a megl'#233'v'#337' virtu'#225'lis g'#233'pek be'#225'll'#237't'#225'saira ninc' +
            's semmilyen hat'#225'sa.'
          WordWrap = True
        end
        object lbIconSetDesc: TLabel
          Left = 64
          Top = 16
          Width = 329
          Height = 49
          AutoSize = False
          Caption = 
            'Ezen a helyen kiv'#225'laszthatja a program '#233's az emul'#225'tor '#225'ltal hasz' +
            'n'#225'lni k'#237'v'#225'nt ikonk'#233'szletet a list'#225'kban el'#233'rhet'#337'ek k'#246'z'#252'l.'
          Layout = tlCenter
          WordWrap = True
        end
        object imgIconSet: TImage
          Left = 20
          Top = 23
          Width = 32
          Height = 32
          Stretch = True
        end
        object cbProgIconSet: TComboBox
          Left = 40
          Top = 83
          Width = 321
          Height = 22
          Hint = '(A program alap'#233'rtelmezett ikonk'#233'szlete)'
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = cbProgIconSetDrawItem
        end
        object btnDefProgIconSet: TButton
          Tag = 7
          Left = 248
          Top = 111
          Width = 105
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 1
          OnClick = btnDefaultClick
        end
        object cbEmuIconSet: TComboBox
          Left = 40
          Top = 154
          Width = 321
          Height = 22
          Hint = '(A program alap'#233'rtelmezett ikonk'#233'szlete)'
          Style = csOwnerDrawFixed
          TabOrder = 2
          OnDrawItem = cbProgIconSetDrawItem
        end
        object btnDefEmuIconSet: TButton
          Tag = 8
          Left = 248
          Top = 182
          Width = 105
          Height = 25
          Caption = 'A&lap'#233'rtelmezett'
          TabOrder = 3
          OnClick = btnDefaultClick
        end
      end
    end
    object tabLanguage: TTabSheet
      Caption = 'Nyelv'
      ImageIndex = 5
      object grpLanguage: TGroupBox
        Left = 16
        Top = 16
        Width = 404
        Height = 393
        Caption = 'Nyelvi be'#225'll'#237't'#225'sok'
        TabOrder = 0
        DesignSize = (
          404
          393)
        object imgLanguage: TImage
          Left = 18
          Top = 24
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbLanguage: TLabel
          Left = 61
          Top = 24
          Width = 324
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Ebben a szekci'#243'ban m'#243'dos'#237'thatja a program '#233's az emul'#225'tor nyelvve' +
            'l kapcsolatos viselked'#233'si be'#225'll'#237't'#225'sait.'
          WordWrap = True
        end
        object lbProgLang: TLabel
          Left = 18
          Top = 73
          Width = 167
          Height = 24
          AutoSize = False
          Caption = 'A &program nyelve:'
          FocusControl = cbProgLang
        end
        object lbEmuLang: TLabel
          Left = 18
          Top = 162
          Width = 199
          Height = 23
          AutoSize = False
          Caption = 'Az emul'#225'tor nyelve:'
        end
        object lbEmuLangAvail: TLabel
          Left = 40
          Top = 234
          Width = 193
          Height = 23
          AutoSize = False
          Caption = 'Jelenleg &el'#233'rhet'#337' nyelvek:'
          FocusControl = cbEmuLang
        end
        object cbProgLang: TComboBox
          Left = 32
          Top = 96
          Width = 329
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 0
          Text = '(A rendszer alap'#233'rtelmezett nyelve)'
          OnChange = UpdateLangRadio
          Items.Strings = (
            '(A rendszer alap'#233'rtelmezett nyelve)')
        end
        object btnDefProgLang: TButton
          Tag = 5
          Left = 246
          Top = 123
          Width = 115
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 1
          OnClick = btnDefaultClick
        end
        object rbEmuLangSync: TRadioButton
          Left = 32
          Top = 181
          Width = 353
          Height = 17
          Caption = 'A &WinBox nyelvi be'#225'll'#237't'#225'sainak haszn'#225'lata (ha lehets'#233'ges)'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = UpdateLangRadio
        end
        object rbEmuLangFix: TRadioButton
          Left = 32
          Top = 203
          Width = 353
          Height = 17
          Caption = 'Haszn'#225'lni &k'#237'v'#225'nt nyelv kiv'#225'laszt'#225'sa az al'#225'bbi list'#225'b'#243'l:'
          TabOrder = 3
          OnClick = UpdateLangRadio
        end
        object cbEmuLang: TComboBox
          Left = 40
          Top = 253
          Width = 321
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = '(A rendszer alap'#233'rtelmezett nyelve)'
          Items.Strings = (
            '(A rendszer alap'#233'rtelmezett nyelve)')
        end
        object rbEmuLangFree: TRadioButton
          Left = 32
          Top = 315
          Width = 361
          Height = 17
          Caption = '&Ne ker'#252'ljenek m'#243'dos'#237't'#225'sra az emul'#225'tor nyelvi be'#225'll'#237't'#225'sai'
          TabOrder = 5
          OnClick = UpdateLangRadio
        end
        object btnDefEmuLang: TButton
          Tag = 6
          Left = 248
          Top = 280
          Width = 113
          Height = 25
          Caption = 'A&lap'#233'rtelmezett'
          TabOrder = 6
          OnClick = btnDefaultClick
        end
        object cbEmuLangForced: TCheckBox
          Left = 18
          Top = 345
          Width = 375
          Height = 17
          Caption = 
            'Az emul'#225'tor nyelvi be'#225'll'#237't'#225'sainak &fel'#252'lb'#237'r'#225'l'#225'sa minden virtu'#225'li' +
            's g'#233'pn'#233'l'
          TabOrder = 7
        end
      end
    end
    object tabStyles: TTabSheet
      Caption = 'T'#233'm'#225'k'
      ImageIndex = 7
      object grpThemes: TGroupBox
        Left = 16
        Top = 15
        Width = 404
        Height = 402
        Caption = 'T'#233'm'#225'k, sz'#237'nek, '#233's st'#237'lusok'
        TabOrder = 0
        DesignSize = (
          404
          402)
        object lbStyleName: TLabel
          Left = 40
          Top = 179
          Width = 59
          Height = 13
          AutoSize = False
          Caption = '&St'#237'lus:'
        end
        object lbStyleColor: TLabel
          Left = 40
          Top = 125
          Width = 59
          Height = 13
          AutoSize = False
          Caption = '&T'#233'masz'#237'n:'
        end
        object lbStylePreview: TLabel
          Left = 26
          Top = 214
          Width = 45
          Height = 13
          Caption = '&El'#337'n'#233'zet:'
          FocusControl = pnStylePreview
        end
        object lbStyleDesc: TLabel
          Left = 68
          Top = 16
          Width = 302
          Height = 52
          AutoSize = False
          Caption = 
            'Ezen az oldalon elv'#233'gezheti a s'#246't'#233't m'#243'd be'#225'll'#237't'#225'sait, illetve eg' +
            'yedi t'#233'm'#225'kkal teljesen '#225'tszabhatja a program kin'#233'zet'#233't.'
          Layout = tlCenter
          WordWrap = True
        end
        object imgStyle: TImage
          Left = 20
          Top = 26
          Width = 32
          Height = 32
          Stretch = True
        end
        object bvStylePreview: TBevel
          Left = 26
          Top = 233
          Width = 344
          Height = 152
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object lbStyleNoPreview: TLabel
          Left = 26
          Top = 233
          Width = 344
          Height = 152
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          Caption = '(nem el'#233'rhet'#337')'
          Layout = tlCenter
        end
        object cbStyleName: TComboBox
          Left = 105
          Top = 176
          Width = 257
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = UpdateStyleControls
        end
        object rbStyleSystem: TRadioButton
          Left = 20
          Top = 73
          Width = 370
          Height = 17
          Caption = 
            'A &rendszer t'#233'ma '#233's sz'#237'nbe'#225'll'#237't'#225'sainak megfelel'#337' st'#237'lus haszn'#225'la' +
            'ta'
          TabOrder = 1
          OnClick = UpdateStyleControls
        end
        object rbStyleColor: TRadioButton
          Left = 20
          Top = 98
          Width = 370
          Height = 17
          Caption = 
            'A rendszer t'#233'm'#225'ja szerinti, de r'#246'gz'#237'tett &sz'#237'n-'#252'zemm'#243'd haszn'#225'lat' +
            'a'
          TabOrder = 2
          OnClick = UpdateStyleControls
        end
        object cbStyleColor: TComboBox
          Left = 105
          Top = 122
          Width = 257
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'Vil'#225'gos alkalmaz'#225's-'#252'zemm'#243'd'
          OnChange = UpdateStyleControls
          Items.Strings = (
            'Vil'#225'gos alkalmaz'#225's-'#252'zemm'#243'd'
            'S'#246't'#233't alkalmaz'#225's-'#252'zemm'#243'd')
        end
        object rbStyleCustom: TRadioButton
          Left = 20
          Top = 152
          Width = 370
          Height = 17
          Caption = 'A rendszer t'#233'm'#225'j'#225't'#243'l elt'#233'r'#337', r'#246'gz'#237'tett &egyedi st'#237'lus haszn'#225'lata'
          TabOrder = 4
          OnClick = UpdateStyleControls
        end
        object pnStylePreview: TPanel
          Left = 25
          Top = 233
          Width = 345
          Height = 152
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvLowered
          ParentBackground = False
          TabOrder = 5
          DesignSize = (
            345
            152)
          object lbQuadEq: TLabel
            AlignWithMargins = True
            Left = 13
            Top = 8
            Width = 328
            Height = 26
            Margins.Left = 12
            Margins.Top = 7
            Align = alTop
            Caption = 'M'#225'sodfok'#250' egyenlet megold'#225'sa'#13#10'ax^2+bx+c=0'
            WordWrap = True
            ExplicitWidth = 151
          end
          object lbQuadEqA: TLabel
            Left = 14
            Top = 45
            Width = 14
            Height = 13
            Caption = '&a='
            FocusControl = spQuadEqA
          end
          object lbQuadEqB: TLabel
            Left = 129
            Top = 45
            Width = 14
            Height = 13
            Caption = '&b='
          end
          object lbQuadEqC: TLabel
            Left = 246
            Top = 45
            Width = 13
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '&c='
          end
          object spQuadEqA: TSpinEdit
            Left = 34
            Top = 40
            Width = 65
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 2
          end
          object spQuadEqC: TSpinEdit
            Left = 265
            Top = 40
            Width = 65
            Height = 22
            Anchors = [akTop, akRight]
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 3
          end
          object spQuadEqB: TSpinEdit
            Left = 149
            Top = 40
            Width = 65
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 5
          end
          object mmQuadEq: TMemo
            Left = 14
            Top = 68
            Width = 316
            Height = 71
            Anchors = [akLeft, akTop, akRight, akBottom]
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object btnQuadEqSolve: TButton
            Left = 244
            Top = 9
            Width = 88
            Height = 25
            Anchors = [akTop, akRight]
            Caption = '&Megold'#225's'
            TabOrder = 4
            OnClick = btnQuadEqSolveClick
          end
        end
      end
    end
    object tabTools: TTabSheet
      Caption = 'Eszk'#246'z'#246'k'
      ImageIndex = 2
      object grpTools: TGroupBox
        Left = 16
        Top = 16
        Width = 402
        Height = 240
        Caption = 'Eszk'#246'zlista'
        TabOrder = 0
        DesignSize = (
          402
          240)
        object imgTools: TImage
          Left = 18
          Top = 23
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbTools: TLabel
          Left = 64
          Top = 18
          Width = 317
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Ezen az oldalon defini'#225'lhat parancsokat, vagy programokat, melye' +
            'ket gyakran haszn'#225'l a virtu'#225'lis g'#233'pek kapcs'#225'n, '#233's '#237'gy a WinBox m' +
            'en'#252'j'#233'b'#337'l k'#246'nnyen el'#337' tudja h'#237'vni majd azokat.'
          WordWrap = True
          ExplicitWidth = 303
        end
        object lvTools: TListView
          Left = 18
          Top = 72
          Width = 365
          Height = 123
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'N'#233'v'
              Width = 130
            end
            item
              AutoSize = True
              Caption = 'El'#233'r'#233'si '#250't'
            end>
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnSelectItem = lvToolsSelectItem
        end
        object btnToolAdd: TButton
          Tag = 1
          Left = 18
          Top = 201
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = '&Hozz'#225'ad'#225's'
          TabOrder = 1
          OnClick = btnToolsClick
        end
        object btnToolClear: TButton
          Tag = 4
          Left = 310
          Top = 201
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Ki'#252'r'#237't'#233's'
          TabOrder = 4
          OnClick = btnToolsClick
        end
        object btnToolDelete: TButton
          Tag = 3
          Left = 229
          Top = 201
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&T'#246'rl'#233's'
          TabOrder = 3
          OnClick = btnToolsClick
        end
        object btnToolModify: TButton
          Tag = 2
          Left = 99
          Top = 201
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = '&M'#243'dos'#237't'#225's'
          TabOrder = 2
          OnClick = btnToolsClick
        end
      end
      object grpToolProperties: TGroupBox
        Tag = 5
        Left = 16
        Top = 262
        Width = 402
        Height = 155
        Caption = #218'j/kiv'#225'lasztott elem tulajdons'#225'gai'
        TabOrder = 1
        DesignSize = (
          402
          155)
        object lbToolName: TLabel
          Left = 18
          Top = 28
          Width = 55
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = '&N'#233'v:'
        end
        object lbToolPath: TLabel
          Left = 18
          Top = 56
          Width = 55
          Height = 25
          Alignment = taRightJustify
          AutoSize = False
          Caption = '&El'#233'r'#233'si '#250't:'
        end
        object edToolName: TEdit
          Left = 85
          Top = 24
          Width = 203
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object mmToolPath: TMemo
          Left = 85
          Top = 53
          Width = 292
          Height = 84
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ScrollBars = ssVertical
          TabOrder = 2
          WantReturns = False
        end
        object btnToolBrowse: TButton
          Tag = 5
          Left = 294
          Top = 22
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Tall'#243'z'#225's...'
          TabOrder = 1
          OnClick = btnBrowseClick
        end
      end
    end
    object tabSpecial: TTabSheet
      Caption = 'Speci'#225'lis'
      ImageIndex = 4
      object grpExtraPaths: TGroupBox
        Left = 16
        Top = 16
        Width = 404
        Height = 177
        Caption = 'Tov'#225'bbi el'#233'r'#233'si '#250'tvonalak'
        TabOrder = 0
        DesignSize = (
          404
          177)
        object lbExtraPaths: TLabel
          Left = 58
          Top = 24
          Width = 319
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Defini'#225'lhat egy mapp'#225't, amelyben a WinBox virtu'#225'lis g'#233'p sablonok' +
            'at fog keresni, a telep'#237't'#233'si mapp'#225'ban lev'#337'eken fel'#252'l.'
          WordWrap = True
        end
        object imgExtraPaths: TImage
          Left = 16
          Top = 24
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbCustomTemplates: TLabel
          Left = 29
          Top = 80
          Width = 197
          Height = 25
          AutoSize = False
          Caption = 'Egyedi &sablonok helye:'
          FocusControl = edCustomTemplates
        end
        object btnCustomTemplates: TButton
          Tag = 3
          Left = 341
          Top = 94
          Width = 42
          Height = 26
          Caption = '&...'
          TabOrder = 1
          OnClick = btnBrowseClick
        end
        object edCustomTemplates: TEdit
          Left = 29
          Top = 99
          Width = 306
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 0
          Text = 'edCustomTemplates'
        end
        object btnOpenCustomTemplates: TButton
          Tag = 3
          Left = 232
          Top = 126
          Width = 142
          Height = 25
          Caption = 'K'#246'nyvt'#225'r meg&nyit'#225'sa...'
          TabOrder = 3
          OnClick = btnOpenClick
        end
        object btnDefCustomTemplates: TButton
          Tag = 3
          Left = 120
          Top = 126
          Width = 106
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 2
          OnClick = btnDefaultClick
        end
      end
      object grpDebug: TGroupBox
        Left = 16
        Top = 199
        Width = 404
        Height = 218
        Caption = 'Hibakeres'#233's'
        TabOrder = 1
        object lbDebug: TLabel
          Left = 58
          Top = 28
          Width = 321
          Height = 37
          AutoSize = False
          Caption = 
            'Az emul'#225'tor fut'#225's'#225'hoz megadhat glob'#225'lis hibakeres'#233'si opci'#243'kat, m' +
            'elyek alap'#233'rtelmezett konfigur'#225'ci'#243' eset'#233'n lesznek '#233'rv'#233'nyesek.'
          WordWrap = True
        end
        object imgDebug: TImage
          Left = 16
          Top = 27
          Width = 32
          Height = 32
          Stretch = True
        end
        object lbLogging: TLabel
          Left = 16
          Top = 75
          Width = 95
          Height = 31
          Alignment = taRightJustify
          AutoSize = False
          Caption = '&Napl'#243'z'#225's:'
          FocusControl = cbLogging
        end
        object lbGlobalLog: TLabel
          Left = 16
          Top = 112
          Width = 97
          Height = 33
          Alignment = taRightJustify
          AutoSize = False
          Caption = '&Glob'#225'lis napl'#243'f'#225'jl:'
          FocusControl = edGlobalLog
        end
        object btnGlobalLog: TButton
          Tag = 4
          Left = 341
          Top = 105
          Width = 42
          Height = 26
          Caption = '&...'
          TabOrder = 2
          OnClick = btnBrowseClick
        end
        object cbLogging: TComboBox
          Left = 117
          Top = 71
          Width = 265
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = 'Glob'#225'lisan, mindent egyetlen napl'#243'f'#225'jlba'
          OnChange = cbLoggingChange
          Items.Strings = (
            'Kikapcsolva'
            'Glob'#225'lisan, mindent egyetlen napl'#243'f'#225'jlba'
            'Glob'#225'lisan, ind'#237't'#225'sonk'#233'nt gener'#225'lt f'#225'jlokba'
            'G'#233'penk'#233'nt, munkak'#246'nyvt'#225'ronk'#233'nt egy f'#225'jlba'
            'G'#233'penk'#233'nt, ind'#237't'#225'sonk'#233'nt gener'#225'lt f'#225'jlokba')
        end
        object cbDebugMode: TCheckBox
          Left = 20
          Top = 160
          Width = 324
          Height = 17
          Caption = 'Az 86Box ind'#237't'#225'sa &hibakeres'#233'si '#252'zemm'#243'dban'
          TabOrder = 4
        end
        object cbCrashDump: TCheckBox
          Left = 20
          Top = 183
          Width = 324
          Height = 17
          Caption = '&'#214'sszeoml'#225'si mem'#243'riak'#233'pek l'#233'trehoz'#225's'#225'nak enged'#233'lyez'#233'se'
          TabOrder = 5
        end
        object edGlobalLog: TEdit
          Left = 119
          Top = 108
          Width = 216
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 1
          Text = 'edGlobalLog'
        end
        object btnDefGlobalLog: TButton
          Tag = 4
          Left = 264
          Top = 137
          Width = 110
          Height = 25
          Caption = '&Alap'#233'rtelmezett'
          TabOrder = 3
          OnClick = btnDefaultClick
        end
      end
    end
  end
  object btnOK: TButton
    Left = 276
    Top = 497
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 357
    Top = 497
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&M'#233'gse'
    ModalResult = 2
    TabOrder = 3
  end
  object btnImport: TButton
    Left = 28
    Top = 497
    Width = 101
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Import'#225'l'#225's '#9660
    DropDownMenu = pmImport
    TabOrder = 1
    OnClick = btnCustomDropDown
  end
  object pmImport: TPopupMenu
    Left = 144
    Top = 464
    object miImport86Mgr: TMenuItem
      Caption = '86Box &Manager be'#225'll'#237't'#225'sok '#225'tv'#233'tele'
      OnClick = miImport86MgrClick
    end
    object miImportWinBox: TMenuItem
      Caption = '&WinBox Reloaded be'#225'll'#237't'#225'sok '#225'tv'#233'tele'
      OnClick = miImportWinBoxClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miDefaults: TMenuItem
      Caption = '&Gy'#225'ri be'#225'll'#237't'#225'sok vissza'#225'll'#237't'#225'sa'
      OnClick = miDefaultsClick
    end
  end
  object od86Box: TOpenDialog
    DefaultExt = '.exe'
    FileName = '86Box.exe'
    Filter = 
      '86Box bin'#225'risok (86Box*.exe)|86Box*.*|Futtathat'#243' f'#225'jlok (*.exe; ' +
      '*.com; *.bat; *.cmd)|*.exe; *.com; *.bat; *.cmd|Minden f'#225'jl (*.*' +
      ')|*.*'
    Left = 200
    Top = 464
  end
  object odTools: TOpenDialog
    DefaultExt = '.exe'
    Filter = 
      'Futtathat'#243' f'#225'jlok (*.exe; *.com; *.bat; *.cmd)|*.exe; *.com; *.b' +
      'at; *.cmd|Minden f'#225'jl (*.*)|*.*'
    Left = 256
    Top = 464
  end
  object odLogFiles: TOpenDialog
    DefaultExt = '.log'
    Filter = 
      'Napl'#243'f'#225'jlok (*.log)|*.log|Sz'#246'vegf'#225'jlok (*.txt)|*.txt|Minden f'#225'jl' +
      ' (*.*)|*.*'
    Left = 304
    Top = 464
  end
  object odConfigFiles: TOpenDialog
    DefaultExt = '.cfg'
    FileName = '86box.cfg'
    Filter = 
      '86Box konfigur'#225'ci'#243's f'#225'jlok (86box.cfg)|86box.cfg|Minden f'#225'jl (*.' +
      '*)|*.*'
    Left = 360
    Top = 464
  end
  object pmPosition: TPopupMenu
    Left = 80
    Top = 464
    object miCompleteState: TMenuItem
      Tag = 7
      Caption = 'A f'#337'ablak teljes &'#225'llapot'#225'nak ment'#233'se'
      OnClick = btnPositionClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miPositionOnly: TMenuItem
      Tag = 1
      Caption = 'Csak a f'#337'ablak helyzet'#233'nek ment'#233'se'
      OnClick = btnPositionClick
    end
    object miSizeOnly: TMenuItem
      Tag = 2
      Caption = 'Csak a f'#337'ablak m'#233'reteinek ment'#233'se'
      OnClick = btnPositionClick
    end
    object miLayoutOnly: TMenuItem
      Tag = 4
      Caption = 'Csak a f'#337'ablak elrendez'#233's'#233'nek ment'#233'se'
      OnClick = btnPositionClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miDefaults2: TMenuItem
      Caption = 'Gy'#225'ri be'#225'll'#237't'#225'sok vissza'#225'll'#237't'#225'sa'
      OnClick = btnPositionClick
    end
  end
end
