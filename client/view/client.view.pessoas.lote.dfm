object frmPessoasLote: TfrmPessoasLote
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas em Lote'
  ClientHeight = 468
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 468
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 812
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      ParentBackground = False
      TabOrder = 0
      object lblPage: TLabel
        Left = 10
        Top = 0
        Width = 802
        Height = 57
        Align = alClient
        Caption = 'Cadastro de Pessoas em Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 239
        ExplicitHeight = 19
      end
    end
    object pnlBody: TPanel
      Left = 0
      Top = 57
      Width = 812
      Height = 411
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object CardPanel1: TCardPanel
        Left = 0
        Top = 0
        Width = 812
        Height = 411
        Align = alClient
        ActiveCard = cardGrid
        BevelOuter = bvNone
        Caption = 'CardPanel'
        TabOrder = 0
        object cardGrid: TCard
          Left = 0
          Top = 0
          Width = 812
          Height = 411
          Caption = 'Grid'
          CardIndex = 0
          TabOrder = 0
          object pnlGridTop: TPanel
            Left = 0
            Top = 0
            Width = 812
            Height = 88
            Align = alTop
            BevelOuter = bvNone
            Padding.Left = 20
            Padding.Right = 20
            TabOrder = 0
            object btnNovo: TSpeedButton
              Left = 20
              Top = 0
              Width = 80
              Height = 88
              Align = alLeft
              Caption = 'NOVO'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Layout = blGlyphTop
              ParentFont = False
              OnClick = btnNovoClick
              ExplicitLeft = 0
              ExplicitTop = -23
            end
            object btnEnviar: TSpeedButton
              Left = 100
              Top = 0
              Width = 80
              Height = 88
              Align = alLeft
              Caption = 'ENVIAR'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Layout = blGlyphTop
              ParentFont = False
              OnClick = btnEnviarClick
              ExplicitLeft = 172
              ExplicitTop = 6
            end
            object btnFecharTela: TSpeedButton
              Left = 712
              Top = 0
              Width = 80
              Height = 88
              Align = alRight
              Caption = 'FECHAR'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Layout = blGlyphTop
              ParentFont = False
              OnClick = btnFecharTelaClick
              ExplicitLeft = 590
              ExplicitTop = 6
              ExplicitHeight = 72
            end
          end
          object pnlCardBody: TPanel
            Left = 0
            Top = 88
            Width = 812
            Height = 323
            Align = alClient
            BevelOuter = bvNone
            Padding.Left = 20
            Padding.Right = 20
            Padding.Bottom = 20
            TabOrder = 1
            object pnlGridBottom: TPanel
              Left = 20
              Top = 273
              Width = 772
              Height = 30
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object lblRegistros: TLabel
                Left = 0
                Top = 0
                Width = 772
                Height = 30
                Align = alClient
                Alignment = taRightJustify
                Caption = 'Registros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                ExplicitLeft = 700
                ExplicitWidth = 72
                ExplicitHeight = 18
              end
            end
            object pnlGrid: TPanel
              Left = 20
              Top = 0
              Width = 772
              Height = 273
              Align = alClient
              BevelOuter = bvNone
              Padding.Left = 2
              Padding.Top = 2
              Padding.Right = 2
              Padding.Bottom = 2
              ParentBackground = False
              TabOrder = 1
              object listPessoas: TListView
                Left = 2
                Top = 2
                Width = 768
                Height = 269
                Align = alClient
                Columns = <
                  item
                    Caption = 'ID'
                    Width = 37
                  end
                  item
                    Caption = 'Natureza'
                    Width = 60
                  end
                  item
                    Caption = 'Documento'
                    Width = 70
                  end
                  item
                    Caption = 'Primeiro Nome'
                    Width = 115
                  end
                  item
                    Caption = 'Segundo Nome'
                    Width = 115
                  end
                  item
                    Caption = 'CEP'
                    Width = 65
                  end
                  item
                    Caption = 'UF'
                    Width = 28
                  end
                  item
                    Caption = 'Cidade'
                    Width = 108
                  end
                  item
                    Caption = 'Bairro'
                    Width = 65
                  end
                  item
                    Caption = 'Logradouro'
                    Width = 152
                  end
                  item
                    Caption = 'Complemento'
                    Width = 76
                  end>
                HideSelection = False
                ReadOnly = True
                RowSelect = True
                TabOrder = 0
                ViewStyle = vsReport
                OnDblClick = listPessoasDblClick
              end
            end
          end
        end
        object cardCadastro: TCard
          Left = 0
          Top = 0
          Width = 812
          Height = 411
          Caption = 'Cadastro'
          CardIndex = 1
          TabOrder = 1
          object pnlCadastroBody: TPanel
            Left = 0
            Top = 0
            Width = 812
            Height = 411
            Align = alClient
            BevelOuter = bvNone
            Padding.Left = 20
            Padding.Right = 20
            Padding.Bottom = 20
            TabOrder = 0
            object pnlCadastroCampos: TPanel
              Left = 20
              Top = 0
              Width = 772
              Height = 303
              Align = alClient
              BevelOuter = bvNone
              Padding.Left = 50
              Padding.Top = 20
              Padding.Right = 50
              TabOrder = 0
              object StackPessoa: TStackPanel
                Left = 50
                Top = 20
                Width = 320
                Height = 283
                Align = alLeft
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label1
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtID
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label2
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtNatureza
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label3
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtDocumento
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label5
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtPrimeiroNome
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label4
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtSegundoNome
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label6
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtCEP
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Spacing = 4
                TabOrder = 0
                object Label1: TLabel
                  Left = 0
                  Top = 0
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'ID'
                end
                object edtID: TEdit
                  Left = 0
                  Top = 17
                  Width = 320
                  Height = 21
                  Align = alClient
                  ReadOnly = True
                  TabOrder = 0
                end
                object Label2: TLabel
                  Left = 0
                  Top = 42
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Natureza'
                end
                object edtNatureza: TEdit
                  Left = 0
                  Top = 59
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 1
                end
                object Label3: TLabel
                  Left = 0
                  Top = 84
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Documento'
                end
                object edtDocumento: TEdit
                  Left = 0
                  Top = 101
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 2
                end
                object Label5: TLabel
                  Left = 0
                  Top = 126
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Primeiro Nome'
                end
                object edtPrimeiroNome: TEdit
                  Left = 0
                  Top = 143
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 3
                end
                object Label4: TLabel
                  Left = 0
                  Top = 168
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Segundo Nome'
                end
                object edtSegundoNome: TEdit
                  Left = 0
                  Top = 185
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 4
                end
                object Label6: TLabel
                  Left = 0
                  Top = 210
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'CEP'
                end
                object edtCEP: TEdit
                  Left = 0
                  Top = 227
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 5
                end
              end
              object stackEnderecoIntegracao: TStackPanel
                Left = 402
                Top = 20
                Width = 320
                Height = 283
                Align = alRight
                BevelOuter = bvNone
                ControlCollection = <
                  item
                    Control = Label7
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtUF
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label8
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtCidade
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label9
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtBairro
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label10
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtLogradouro
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end
                  item
                    Control = Label11
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpTop
                  end
                  item
                    Control = edtComplemento
                    HorizontalPositioning = sphpFill
                    VerticalPositioning = spvpFill
                  end>
                Spacing = 4
                TabOrder = 1
                object Label7: TLabel
                  Left = 0
                  Top = 0
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'UF'
                end
                object edtUF: TEdit
                  Left = 0
                  Top = 17
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 0
                end
                object Label8: TLabel
                  Left = 0
                  Top = 42
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Cidade'
                end
                object edtCidade: TEdit
                  Left = 0
                  Top = 59
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 1
                end
                object Label9: TLabel
                  Left = 0
                  Top = 84
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Bairro'
                end
                object edtBairro: TEdit
                  Left = 0
                  Top = 101
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 2
                end
                object Label10: TLabel
                  Left = 0
                  Top = 126
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Logradouro'
                end
                object edtLogradouro: TEdit
                  Left = 0
                  Top = 143
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 3
                end
                object Label11: TLabel
                  Left = 0
                  Top = 168
                  Width = 320
                  Height = 13
                  Align = alTop
                  Caption = 'Complemento'
                end
                object edtComplemento: TEdit
                  Left = 0
                  Top = 185
                  Width = 320
                  Height = 21
                  Align = alClient
                  TabOrder = 4
                end
              end
            end
            object pnlCadastroBottom: TPanel
              Left = 20
              Top = 303
              Width = 772
              Height = 88
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object btnSalvar: TSpeedButton
                Left = 612
                Top = 0
                Width = 80
                Height = 88
                Align = alRight
                Caption = 'SALVAR'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Layout = blGlyphTop
                ParentFont = False
                OnClick = btnSalvarClick
                ExplicitLeft = 606
              end
              object btnExcluir: TSpeedButton
                Left = 0
                Top = 0
                Width = 80
                Height = 88
                Align = alLeft
                Caption = 'EXCLUIR'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Layout = blGlyphTop
                ParentFont = False
                OnClick = btnExcluirClick
                ExplicitTop = -23
                ExplicitHeight = 670
              end
              object btnFechar: TSpeedButton
                Left = 692
                Top = 0
                Width = 80
                Height = 88
                Align = alRight
                Caption = 'FECHAR'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Layout = blGlyphTop
                ParentFont = False
                OnClick = btnFecharClick
                ExplicitLeft = 590
                ExplicitTop = 6
                ExplicitHeight = 72
              end
            end
          end
        end
      end
    end
  end
  object DataSource: TDataSource
    AutoEdit = False
    DataSet = dmPrincipal.FDMemTablePessoa
    Left = 728
    Top = 337
  end
end
