﻿unit View.PedidoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Character, Vcl.Buttons, Vcl.Grids
  ;

type
  TFrmPedidoVendas = class(TForm)
    GroupBox1: TGroupBox;
    EdCod: TLabeledEdit;
    EdDesc: TLabeledEdit;
    EdPreco: TLabeledEdit;
    BtBuscaProd: TSpeedButton;
    StringGrid: TStringGrid;
    LbSubTotal: TLabel;
    BtInsereProd: TSpeedButton;
    BtGravar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LbCodCli: TLabel;
    LbCliente: TLabel;
    Label3: TLabel;
    procedure BtBuscaProdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtInsereProdClick(Sender: TObject);
    procedure StringGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure StringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Cont : Integer;
     procedure GridDeleteRow(RowNumber: Integer; Grid: TstringGrid);
  public
    { Public declarations }
  end;

var
  FrmPedidoVendas: TFrmPedidoVendas;

implementation

Uses Consultas, UDMPrincipal;

{$R *.dfm}

procedure TFrmPedidoVendas.FormShow(Sender: TObject);
begin  Cont := 0; end;

procedure TFrmPedidoVendas.FormCreate(Sender: TObject);
begin
  StringGrid.ColWidths[0] := 50;
  StringGrid.ColWidths[1] := 650;
  StringGrid.ColWidths[2] := 70;

  StringGrid.Cells[0, 0] := 'Cod';
  StringGrid.Cells[1, 0] := 'Produto';
  StringGrid.Cells[2, 0] := 'Valor';
  StringGrid.Cells[3, 0] := 'Qtd';
  StringGrid.Cells[4, 0] := 'Total';
end;

procedure TFrmPedidoVendas.BtBuscaProdClick(Sender: TObject);
begin
  var produto : TStringList;
  var InputStr := InputBox('buscar produto', 'Digite o código ou nome do produto','');
  var cons : TConsulta;

  Cons := TConsulta.Create;   // Instancia o objeto que retorna os registros dos produtos
  Produto := TStringList.Create;
  try
    Produto := Cons.SelectProd(InputStr);
    if produto.Count <> 0 then begin
      EdCod.Text   := Produto[0];
      EdDesc.Text  := Produto[1];
      EdPreco.Text := Produto[2];
    end;
  finally
    FreeAndNil(cons);
    FreeAndNil(Produto);
  end;
end;

procedure TFrmPedidoVendas.BtInsereProdClick(Sender: TObject);
begin   // insere produto na Grid
    if Cont = 0 then
    begin
       Inc(Cont);
       StringGrid.Cells[0, StringGrid.RowCount -1] := EdCod.Text ;
       StringGrid.Cells[1, StringGrid.RowCount -1] := EdDesc.Text ;
       StringGrid.Cells[2, StringGrid.RowCount -1] := EdPreco.Text ;
    end
    else
    begin
       StringGrid.RowCount := StringGrid.RowCount + 1;
       StringGrid.Cells[0, StringGrid.RowCount -1] := EdCod.Text ;
       StringGrid.Cells[1, StringGrid.RowCount -1] := EdDesc.Text ;
       StringGrid.Cells[2, StringGrid.RowCount -1] := EdPreco.Text ;
     end;
end;

procedure TFrmPedidoVendas.StringGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);  // Calcula o total
var
   SubTotal, Vlr : Currency;
   qtd, i : integer;
   S : string;
begin
   SubTotal := 0;
   if (ACol = 3) then
   begin
      if Value <> '' then
         begin
            Vlr := StrToFloat(StringGrid.Cells[2, ARow]);
            qtd := StrToInt(StringGrid.Cells[3, ARow]);
            Vlr := Vlr * qtd;
            StringGrid.Cells[4, ARow] := FormatFloat('##,###,##0.00', Vlr);
         end
      else
         StringGrid.Cells[4, ARow] := '';
   end;
                                      //  Calcula sub total
   for i := 1 to StringGrid.RowCount -1 do
   begin
     S := StringGrid.Cells[4,i];
     if S = '' then  S := '0';
     SubTotal := SubTotal + StrToFloat(S);
   end;
   LbSubTotal.Caption := FormatFloat('##,###,##0.00', SubTotal);
end;

procedure TFrmPedidoVendas.StringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_DELETE then //Se a tecla Delete for pressionada, deleta linha
   begin
     if Application.MessageBox('Deseja Mesmo Excluir a linha atual?',
       PChar('Apagar Registro'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) =
       IDYES then
     begin
        GridDeleteRow(StringGrid.Row, StringGrid);
        StringGridSetEditText(Self,4,1,'s');
     end;
   end;
end;

procedure TFrmPedidoVendas.GridDeleteRow(RowNumber: Integer; Grid: TstringGrid);
var i: Integer;
begin
  Grid.Row := RowNumber;
  if (Grid.Row = Grid.RowCount - 1) then // ùltima linha
      Grid.RowCount := Grid.RowCount - 1
  else
  begin   // Não é a última linha
    for i := RowNumber to Grid.RowCount - 1 do
        Grid.Rows[i] := Grid.Rows[i + 1];
    Grid.RowCount := Grid.RowCount - 1;
  end;
end;


procedure TFrmPedidoVendas.BtGravarClick(Sender: TObject);  // Gravar o Pedido
var  Cons : TConsulta;
begin
   Cons  := TConsulta.Create;
   try
     if Cons.InsertPedido(StrToInt(LbCodCli.Caption),StrToCurr(LbSubTotal.Caption )) then
        ShowMessage('Valor Gravado com sucesso')
     else
       ShowMessage('Falha ao gravar')
   finally
     FreeAndNil(Cons);
   end;
end;


end.
