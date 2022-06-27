object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'mCrud - Clientes'
  ClientHeight = 631
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MMPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pButton: TPanel
    Left = 0
    Top = 604
    Width = 1083
    Height = 27
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 496
    ExplicitWidth = 899
    object LName: TLabel
      AlignWithMargins = True
      Left = 927
      Top = 7
      Width = 152
      Height = 16
      Margins.Top = 6
      Align = alRight
      Caption = 'designed Maicon Oliveira - 2022'
      ExplicitLeft = 793
      ExplicitHeight = 13
    end
  end
  object MMPrincipal: TMainMenu
    Left = 16
    Top = 16
    object MNCadastro: TMenuItem
      Caption = 'Cadastro'
      object MNClientes: TMenuItem
        Caption = 'Clientes'
        object Cadastrar1: TMenuItem
          Caption = 'Cadastrar'
          OnClick = Cadastrar1Click
        end
        object Listar1: TMenuItem
          Caption = 'Listar'
          OnClick = Listar1Click
        end
      end
    end
  end
end
