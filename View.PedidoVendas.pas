unit View.PedidoVendas;

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
    procedure SetaGrid;
    procedure GridDeleteRow(RowNumber: Integer; Grid: TstringGrid);
    function CalcSubTotal : String;
  public
    { Public declarations }
    Modo : Char;     //I : Insert U : Update
    CodPed : String; //Para saber qual nº para o Update
    procedure LimpaTela(Grid: TstringGrid);
  end;

var
  FrmPedidoVendas: TFrmPedidoVendas;

implementation

Uses ClassClientes, ClassProdutos, ClassPedidos, UDMPrincipal;

{$R *.dfm}

procedure TFrmPedidoVendas.FormShow(Sender: TObject);
begin
   Cont := 0;
   StringGridSetEditText(StringGrid,0,0,'');
 end;

procedure TFrmPedidoVendas.SetaGrid;
begin
 StringGrid.FixedRows := 1  ;
  StringGrid.ColWidths[0] := 50;
  StringGrid.ColWidths[1] := 650;
  StringGrid.ColWidths[2] := 70;

  StringGrid.Cells[0, 0] := 'Cod';
  StringGrid.Cells[1, 0] := 'Produto';
  StringGrid.Cells[2, 0] := 'Valor';
  StringGrid.Cells[3, 0] := 'Qtd';
  StringGrid.Cells[4, 0] := 'Total';
end;

procedure TFrmPedidoVendas.FormCreate(Sender: TObject);
begin SetaGrid; end;

procedure TFrmPedidoVendas.BtBuscaProdClick(Sender: TObject);
begin
  var produto : TStringList;
  var InputStr := InputBox('buscar produto', 'Digite o código ou nome do produto','');
  var cons : TProdutos;

  Cons := TProdutos.Create;   // Instancia o objeto que retorna os registros dos produtos
  Produto := TStringList.Create;
  try
    Produto := Cons.SelectProduto(InputStr);
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
    if Cont = 0 then begin
       Inc(Cont);
       StringGrid.Cells[0, StringGrid.RowCount -1] := EdCod.Text ;
       StringGrid.Cells[1, StringGrid.RowCount -1] := EdDesc.Text ;
       StringGrid.Cells[2, StringGrid.RowCount -1] := EdPreco.Text ;
    end
    else begin
       StringGrid.RowCount := StringGrid.RowCount + 1;
       StringGrid.Cells[0, StringGrid.RowCount -1] := EdCod.Text ;
       StringGrid.Cells[1, StringGrid.RowCount -1] := EdDesc.Text ;
       StringGrid.Cells[2, StringGrid.RowCount -1] := EdPreco.Text ;
     end;
end;

function TFrmPedidoVendas.CalcSubTotal : String;  //Calcula o Subtotal
var j : Integer;
    S : string;
    SubTotal : Currency;
begin
   SubTotal := 0;
   S :='';

   for j := 1 to StringGrid.RowCount -1 do
   begin
     S := StringGrid.Cells[4,j];
     if S = '' then
        S := '0';
     SubTotal := SubTotal + StrToFloat(StringReplace(S, '.', '', [rfReplaceAll]));
   end;
   Result := FormatCurr('##,###,##0.00', SubTotal);
end;

procedure TFrmPedidoVendas.StringGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);  // Calcula o total
var
   Vlr : Currency;
   Qtd : integer;
begin
   if (ACol = 3) then
   begin
      if Value <> '' then
         begin
            Vlr := StrToCurr(StringReplace(StringGrid.Cells[2, ARow], '.', '', [rfReplaceAll]));
            Qtd := StrToInt(StringGrid.Cells[3, ARow]);
            Vlr := Vlr * Qtd;
            StringGrid.Cells[4, ARow] := FormatCurr('##,###,##0.00', Vlr);
         end
      else
         StringGrid.Cells[4, ARow] := '';
   end;
   LbSubTotal.Caption := CalcSubTotal;
end;

procedure TFrmPedidoVendas.StringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Modo = 'I' then
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
   end
   else ShowMessage('Você não pode excluir um registro no modo de edição para excluir um pedido para a manutenção de pedidos...');
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

procedure TFrmPedidoVendas.LimpaTela(Grid: TstringGrid);
begin
  for var c := 0 to Pred(Grid.ColCount) do
    for var r := 0 to Pred(Grid.RowCount) do
      Grid.Cells[c, r] := '';

  Grid.RowCount := 2;
  SetaGrid;

  EdCod.Clear;
  EdDesc.Clear;
  EdPreco.Clear;
end;

procedure TFrmPedidoVendas.BtGravarClick(Sender: TObject);  // Gravar o Pedido
var  Cons : TConsulta;
begin
   case Modo of
      'I':
       begin
          Cons  := TConsulta.Create;
          try
            if Cons.InsertPedido(StrToInt(LbCodCli.Caption),StrToCurr(StringReplace(LbSubTotal.Caption, '.', '', [rfReplaceAll]))) then
               ShowMessage('Valor Gravado com sucesso')
            else
               ShowMessage('Falha ao gravar')
          finally
            FreeAndNil(Cons);
          end;
       end;

       'U':
       begin  //update
          Cons  := TConsulta.Create;
          try
            if Cons.UpdatePedido(StrToInt(LbCodCli.Caption),StrToCurr(StringReplace(LbSubTotal.Caption, '.', '', [rfReplaceAll])), CodPed) then
               ShowMessage('Valor Atualizado com sucesso')
            else
               ShowMessage('Falha ao gravar')
          finally
            FreeAndNil(Cons);
          end;
       end;
   end;
end;

end.

