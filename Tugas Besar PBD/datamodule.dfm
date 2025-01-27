object mydm: Tmydm
  OldCreateOrder = False
  Left = 522
  Top = 183
  Height = 454
  Width = 362
  object zq_karyawan: TZQuery
    Connection = flogin.ZConn
    OnDeleteError = zq_karyawanDeleteError
    OnPostError = zq_karyawanPostError
    Active = True
    SQL.Strings = (
      'select * from karyawan')
    Params = <>
    Left = 24
    Top = 24
    object zq_karyawanid_karyawan: TIntegerField
      FieldName = 'id_karyawan'
      Required = True
    end
    object zq_karyawannik: TStringField
      FieldName = 'nik'
      Required = True
    end
    object zq_karyawannama_lengkap: TStringField
      FieldName = 'nama_lengkap'
      Required = True
      Size = 100
    end
    object zq_karyawanjenis_kelamin: TStringField
      FieldName = 'jenis_kelamin'
      Required = True
      Size = 1
    end
    object zq_karyawanalamat: TStringField
      FieldName = 'alamat'
      Size = 100
    end
    object zq_karyawanno_telp: TStringField
      FieldName = 'no_telp'
      Size = 15
    end
    object zq_karyawanemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object zq_karyawanid_jabatan: TIntegerField
      FieldName = 'id_jabatan'
    end
    object zq_karyawantanggal_masuk: TDateField
      FieldName = 'tanggal_masuk'
      Required = True
    end
    object zq_karyawanstatus: TStringField
      FieldName = 'status'
      Size = 11
    end
    object zq_karyawanblob: TBlobField
      FieldName = 'blob'
    end
    object zq_karyawannama_jabatan: TStringField
      FieldKind = fkLookup
      FieldName = 'nama_jabatan'
      LookupDataSet = zq_jabatan
      LookupKeyFields = 'id_jabatan'
      LookupResultField = 'nama_jabatan'
      KeyFields = 'id_jabatan'
      Size = 50
      Lookup = True
    end
    object zq_karyawantarifjabatan: TIntegerField
      FieldKind = fkLookup
      FieldName = 'tarifjabatan'
      LookupDataSet = zq_jabatan
      LookupKeyFields = 'id_jabatan'
      LookupResultField = 'tarif_perjam'
      KeyFields = 'id_jabatan'
      Lookup = True
    end
    object zq_karyawantotal_hari_kerja: TIntegerField
      FieldName = 'total_hari_kerja'
    end
    object zq_karyawantotal_jam_kerja: TFloatField
      FieldName = 'total_jam_kerja'
    end
  end
  object zq_pengguna: TZQuery
    Connection = flogin.ZConn
    Active = True
    SQL.Strings = (
      'select * from pengguna')
    Params = <>
    Left = 88
    Top = 24
    object zq_penggunaid_pengguna: TIntegerField
      FieldName = 'id_pengguna'
      Required = True
    end
    object zq_penggunausername: TStringField
      FieldName = 'username'
      Required = True
      Size = 50
    end
    object zq_penggunapassword: TStringField
      FieldName = 'password'
      Required = True
      Size = 255
    end
    object zq_penggunaid_karyawan: TIntegerField
      FieldName = 'id_karyawan'
    end
    object zq_penggunarole: TStringField
      FieldName = 'role'
      Size = 5
    end
    object zq_penggunanama_karyawan: TStringField
      FieldKind = fkLookup
      FieldName = 'nama _karyawan'
      LookupDataSet = zq_karyawan
      LookupKeyFields = 'id_karyawan'
      LookupResultField = 'nama_lengkap'
      KeyFields = 'id_karyawan'
      Size = 50
      Lookup = True
    end
  end
  object zq_penggajian: TZQuery
    Connection = flogin.ZConn
    OnPostError = zq_penggajianPostError
    SQL.Strings = (
      'select * from penggajian')
    Params = <>
    MasterFields = 'id_karyawan'
    MasterSource = ds_karyawan
    LinkedFields = 'id_karyawan'
    Left = 152
    Top = 24
    object zq_penggajianid_gaji: TIntegerField
      FieldName = 'id_gaji'
      Required = True
    end
    object zq_penggajianno_slip: TStringField
      FieldName = 'no_slip'
      Required = True
    end
    object zq_penggajianid_karyawan: TIntegerField
      FieldName = 'id_karyawan'
      Required = True
    end
    object zq_penggajianperiode_gaji: TDateField
      FieldName = 'periode_gaji'
      Required = True
    end
    object zq_penggajiantotal_jam: TFloatField
      FieldName = 'total_jam'
      Required = True
    end
    object zq_penggajiantotal_gaji: TFloatField
      FieldName = 'total_gaji'
      Required = True
    end
    object zq_penggajiantanggal_bayar: TDateField
      FieldName = 'tanggal_bayar'
    end
    object zq_penggajiantanggal_cetak: TDateTimeField
      FieldName = 'tanggal_cetak'
    end
    object zq_penggajianstatus: TStringField
      FieldName = 'status'
      Size = 7
    end
    object zq_penggajianid_absensi: TIntegerField
      FieldName = 'id_absensi'
    end
  end
  object zq_jabatan: TZQuery
    Connection = flogin.ZConn
    Active = True
    SQL.Strings = (
      'select * from jabatan')
    Params = <>
    Left = 216
    Top = 24
    object zq_jabatanid_jabatan: TIntegerField
      FieldName = 'id_jabatan'
      Required = True
    end
    object zq_jabatannama_jabatan: TStringField
      FieldName = 'nama_jabatan'
      Required = True
      Size = 50
    end
    object zq_jabatantarif_perjam: TFloatField
      FieldName = 'tarif_perjam'
      Required = True
    end
  end
  object zq_absensi: TZQuery
    Connection = flogin.ZConn
    OnCalcFields = zq_absensiCalcFields
    BeforePost = zq_absensiBeforePost
    Active = True
    SQL.Strings = (
      'select * from absensi')
    Params = <>
    Left = 280
    Top = 24
    object zq_absensiid_absensi: TIntegerField
      FieldName = 'id_absensi'
      Required = True
    end
    object zq_absensiid_karyawan: TIntegerField
      FieldName = 'id_karyawan'
      Required = True
    end
    object zq_absensitanggal: TDateField
      FieldName = 'tanggal'
      Required = True
    end
    object zq_absensijam_masuk: TTimeField
      FieldName = 'jam_masuk'
      Required = True
    end
    object zq_absensitotal_jam: TFloatField
      FieldName = 'total_jam'
    end
    object zq_absensijam_keluar: TTimeField
      FieldName = 'jam_keluar'
    end
    object zq_absensikalkulasitotaljam: TFloatField
      FieldKind = fkCalculated
      FieldName = 'kalkulasitotaljam'
      Calculated = True
    end
    object zq_absensikalkulasitotaljamkerjabulanini: TFloatField
      FieldKind = fkCalculated
      FieldName = 'kalkulasitotaljamkerjabulan ini'
      Calculated = True
    end
    object zq_absensiketerangan: TStringField
      FieldName = 'keterangan'
      Size = 50
    end
  end
  object ds_karyawan: TDataSource
    DataSet = zq_karyawan
    Left = 24
    Top = 88
  end
  object ds_pengguna: TDataSource
    DataSet = zq_pengguna
    Left = 88
    Top = 88
  end
  object ds_penggajian: TDataSource
    DataSet = zq_penggajian
    Left = 152
    Top = 88
  end
  object ds_jabatan: TDataSource
    DataSet = zq_jabatan
    Left = 216
    Top = 88
  end
  object ds_absensi: TDataSource
    DataSet = zq_absensi
    Left = 280
    Top = 88
  end
  object find_karyawan: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds_karyawan
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 24
    Top = 152
  end
  object find_pengguna: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds_pengguna
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 88
    Top = 152
  end
  object find_penggajian: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds_penggajian
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 152
    Top = 152
  end
  object find_jabatan: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds_jabatan
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 216
    Top = 152
  end
  object find_absensi: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds_absensi
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 280
    Top = 152
  end
  object filter_karyawan: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = zq_karyawan
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 24
    Top = 216
  end
  object filter_pengguna: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = zq_pengguna
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 88
    Top = 216
  end
  object filter_penggajian: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = zq_penggajian
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 152
    Top = 216
  end
  object filter_jabatan: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = zq_jabatan
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 216
    Top = 216
  end
  object filter_absensi: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = zq_absensi
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 280
    Top = 216
  end
  object rpt_karyawan: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45659.963978136600000000
    ReportOptions.LastChange = 45659.964553703710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 280
    Datasets = <
      item
        DataSet = rptdb_karyawan
        DataSetName = 'rptdb_karyawan'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 52479
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 980.410082000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 980.410082000000000000
        object Memo2: TfrxMemoView
          Width = 978.897637795276000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 81.012218300298700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_karyawan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 81.012218300298700000
          Width = 22.181916915558000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'nik')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 103.194135215857000000
          Width = 92.585392343198500000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'nama_lengkap')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 195.779527559055000000
          Width = 87.763236491990200000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'jenis_kelamin')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          Left = 283.542764051045000000
          Width = 44.363833831115900000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'alamat')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 327.906597882161000000
          Width = 49.185989682324200000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'no_telp')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          Left = 377.092587564485000000
          Width = 36.648384469182700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'email')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          Left = 413.740972033668000000
          Width = 67.510181916915600000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_jabatan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          Left = 481.251153950584000000
          Width = 97.407548194406700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tanggal_masuk')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          Left = 578.658702144990000000
          Width = 41.470540320391000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'status')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          Left = 620.129242465381000000
          Width = 89.692098832473500000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'nama_jabatan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo14: TfrxMemoView
          Left = 709.821341297855000000
          Width = 73.296768938365500000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tarifjabatan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          Left = 783.118110236220000000
          Width = 98.371979364648400000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'total_hari_kerja')
          ParentFont = False
          Style = 'Header'
        end
        object Memo16: TfrxMemoView
          Left = 881.490089600869000000
          Width = 97.407548194406700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'total_jam_kerja')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 980.410082000000000000
        DataSet = rptdb_karyawan
        DataSetName = 'rptdb_karyawan'
        RowCount = 0
        object Memo17: TfrxMemoView
          Width = 81.012218300298700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_karyawan'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."id_karyawan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          Left = 81.012218300298700000
          Width = 22.181916915558000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nik'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."nik"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          Left = 103.194135215857000000
          Width = 92.585392343198500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_lengkap'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."nama_lengkap"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          Left = 195.779527559055000000
          Width = 87.763236491990200000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jenis_kelamin'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."jenis_kelamin"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo21: TfrxMemoView
          Left = 283.542764051045000000
          Width = 44.363833831115900000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'alamat'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."alamat"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo22: TfrxMemoView
          Left = 327.906597882161000000
          Width = 49.185989682324200000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_telp'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."no_telp"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo23: TfrxMemoView
          Left = 377.092587564485000000
          Width = 36.648384469182700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'email'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."email"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo24: TfrxMemoView
          Left = 413.740972033668000000
          Width = 67.510181916915600000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_jabatan'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."id_jabatan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo25: TfrxMemoView
          Left = 481.251153950584000000
          Width = 97.407548194406700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal_masuk'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."tanggal_masuk"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo26: TfrxMemoView
          Left = 578.658702144990000000
          Width = 41.470540320391000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'status'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."status"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo27: TfrxMemoView
          Left = 620.129242465381000000
          Width = 89.692098832473500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_jabatan'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."nama_jabatan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo28: TfrxMemoView
          Left = 709.821341297855000000
          Width = 73.296768938365500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tarifjabatan'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."tarifjabatan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo29: TfrxMemoView
          Left = 783.118110236220000000
          Width = 98.371979364648400000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total_hari_kerja'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."total_hari_kerja"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo30: TfrxMemoView
          Left = 881.490089600869000000
          Width = 97.407548194406700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total_jam_kerja'
          DataSet = rptdb_karyawan
          DataSetName = 'rptdb_karyawan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_karyawan."total_jam_kerja"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 980.410082000000000000
        object Memo31: TfrxMemoView
          Align = baWidth
          Width = 980.410082000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo32: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo33: TfrxMemoView
          Align = baRight
          Left = 904.819482000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object rpt_pengguna: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45670.879349745400000000
    ReportOptions.LastChange = 45670.879570706000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 88
    Top = 280
    Datasets = <
      item
        DataSet = rptdb_pengguna
        DataSetName = 'rptdb_pengguna'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 52479
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 87.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_pengguna')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 87.000000000000000000
          Width = 105.050170137919000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'username')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 192.050170137919000000
          Width = 292.429700984663000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'password')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 484.479871122581000000
          Width = 84.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_karyawan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          Left = 568.479871122581000000
          Width = 29.621810530468700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'role')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 598.101681653050000000
          Width = 142.685719921753000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'nama _karyawan')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = rptdb_pengguna
        DataSetName = 'rptdb_pengguna'
        RowCount = 0
        object Memo9: TfrxMemoView
          Width = 87.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_pengguna'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."id_pengguna"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          Left = 87.000000000000000000
          Width = 105.050170137919000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'username'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."username"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Left = 192.050170137919000000
          Width = 292.429700984663000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'password'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."password"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          Left = 484.479871122581000000
          Width = 84.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_karyawan'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."id_karyawan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Left = 568.479871122581000000
          Width = 29.621810530468700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'role'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."role"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Left = 598.101681653050000000
          Width = 142.685719921753000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama _karyawan'
          DataSet = rptdb_pengguna
          DataSetName = 'rptdb_pengguna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_pengguna."nama _karyawan"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object rpt_penggajian: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45659.965730590300000000
    ReportOptions.LastChange = 45659.966233761570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 152
    Top = 280
    Datasets = <
      item
        DataSet = rptdb_penggajian
        DataSetName = 'rptdb_penggajian'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 53.223097112860900000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_gaji')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 53.223097112860900000
          Width = 73.572178477690300000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'no_slip')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 126.795275590551000000
          Width = 84.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_karyawan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 210.795275590551000000
          Width = 82.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'periode_gaji')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          Left = 292.795275590551000000
          Width = 65.611548556430400000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'total_jam')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 358.406824146982000000
          Width = 65.611548556430400000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'total_gaji')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          Left = 424.018372703412000000
          Width = 94.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tanggal_bayar')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          Left = 518.018372703412000000
          Width = 102.706036745407000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tanggal_cetak')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          Left = 620.724409448819000000
          Width = 45.934383202099700000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'status')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          Left = 666.658792650919000000
          Width = 74.128608923884500000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_absensi')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = rptdb_penggajian
        DataSetName = 'rptdb_penggajian'
        RowCount = 0
        object Memo13: TfrxMemoView
          Width = 53.223097112860900000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_gaji'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."id_gaji"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Left = 53.223097112860900000
          Width = 73.572178477690300000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_slip'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."no_slip"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          Left = 126.795275590551000000
          Width = 84.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_karyawan'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."id_karyawan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          Left = 210.795275590551000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'periode_gaji'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."periode_gaji"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          Left = 292.795275590551000000
          Width = 65.611548556430400000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total_jam'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."total_jam"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          Left = 358.406824146982000000
          Width = 65.611548556430400000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total_gaji'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."total_gaji"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          Left = 424.018372703412000000
          Width = 94.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal_bayar'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."tanggal_bayar"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          Left = 518.018372703412000000
          Width = 102.706036745407000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal_cetak'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."tanggal_cetak"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo21: TfrxMemoView
          Left = 620.724409448819000000
          Width = 45.934383202099700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'status'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."status"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo22: TfrxMemoView
          Left = 666.658792650919000000
          Width = 74.128608923884500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_absensi'
          DataSet = rptdb_penggajian
          DataSetName = 'rptdb_penggajian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_penggajian."id_absensi"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Memo23: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo24: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object rpt_jabatan: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45670.878723321760000000
    ReportOptions.LastChange = 45670.878979641200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 216
    Top = 280
    Datasets = <
      item
        DataSet = rptdb_jabatan
        DataSetName = 'rptdb_jabatan'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 52479
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 216.000000000000000000
      PaperHeight = 279.000000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.787880000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.787880000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.787880000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574803200000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_jabatan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 78.000000000000000000
          Width = 372.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'nama_jabatan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 450.000000000000000000
          Width = 80.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tarif_perjam')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.787880000000000000
        DataSet = rptdb_jabatan
        DataSetName = 'rptdb_jabatan'
        RowCount = 0
        object Memo6: TfrxMemoView
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_jabatan'
          DataSet = rptdb_jabatan
          DataSetName = 'rptdb_jabatan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_jabatan."id_jabatan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          Left = 78.000000000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_jabatan'
          DataSet = rptdb_jabatan
          DataSetName = 'rptdb_jabatan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_jabatan."nama_jabatan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 450.000000000000000000
          Width = 80.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tarif_perjam'
          DataSet = rptdb_jabatan
          DataSetName = 'rptdb_jabatan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_jabatan."tarif_perjam"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.787880000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          Width = 740.787880000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo10: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 665.197280000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object rpt_absensi: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45659.967863692100000000
    ReportOptions.LastChange = 45659.968229166700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 280
    Datasets = <
      item
        DataSet = rptdb_absensi
        DataSetName = 'rptdb_absensi'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574803000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 76.505502863278500000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_absensi')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 76.505502863278500000
          Width = 84.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'id_karyawan')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 160.505502863278000000
          Width = 69.929715461703700000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'tanggal')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 230.435218324982000000
          Width = 77.402201145311400000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'jam_masuk')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          Left = 307.837419470293000000
          Width = 73.217609162491100000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'total_jam')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 381.055028632785000000
          Width = 76.505502863278500000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'jam_keluar')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          Left = 457.560531496063000000
          Width = 283.226870078740000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'keterangan')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = rptdb_absensi
        DataSetName = 'rptdb_absensi'
        RowCount = 0
        object Memo10: TfrxMemoView
          Width = 76.505502863278500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_absensi'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."id_absensi"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Left = 76.505502863278500000
          Width = 84.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_karyawan'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."id_karyawan"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          Left = 160.505502863278000000
          Width = 69.929715461703700000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."tanggal"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Left = 230.435218324982000000
          Width = 77.402201145311400000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jam_masuk'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."jam_masuk"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Left = 307.837419470293000000
          Width = 73.217609162491100000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'total_jam'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."total_jam"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          Left = 381.055028632785000000
          Width = 76.505502863278500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'jam_keluar'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."jam_keluar"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          Left = 457.560531496063000000
          Width = 283.226870078740000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'keterangan'
          DataSet = rptdb_absensi
          DataSetName = 'rptdb_absensi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[rptdb_absensi."keterangan"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Memo17: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo18: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo19: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object rptdb_karyawan: TfrxDBDataset
    UserName = 'rptdb_karyawan'
    CloseDataSource = False
    DataSource = ds_karyawan
    Left = 24
    Top = 344
  end
  object rptdb_pengguna: TfrxDBDataset
    UserName = 'rptdb_pengguna'
    CloseDataSource = False
    DataSource = ds_pengguna
    Left = 88
    Top = 344
  end
  object rptdb_penggajian: TfrxDBDataset
    UserName = 'rptdb_penggajian'
    CloseDataSource = False
    DataSource = ds_penggajian
    Left = 152
    Top = 344
  end
  object rptdb_jabatan: TfrxDBDataset
    UserName = 'rptdb_jabatan'
    CloseDataSource = False
    DataSource = ds_jabatan
    Left = 216
    Top = 344
  end
  object rptdb_absensi: TfrxDBDataset
    UserName = 'rptdb_absensi'
    CloseDataSource = False
    DataSource = ds_absensi
    Left = 280
    Top = 344
  end
end
