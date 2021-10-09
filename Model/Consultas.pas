﻿unit Consultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Character,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConsulta = class(TObject)
     DSMas : TDataSource;
  private
     //  FDSelQry : TFDQuery;
  public
     function SelectProd(Prod : string) : TStringlist;
     function SelectCliente(CodCli : string) : TStringlist;
     function InsertPedido(CodCli : Integer; VTotal : Currency):Boolean;
  end;

implementation

Uses UDMPrincipal, View.PedidoVendas;

{ TConsulta }

function TConsulta.InsertPedido(CodCli : Integer; VTotal : Currency):Boolean;
var
  FDInsQry, FDInsQryDet, QryGetId : TFDQuery;
  Str: TStringBuilder;
  LastId :Integer;
begin
   Result := False;
   Str := TStringBuilder.Create;

   FDInsQry := TFDQuery.Create(nil);
   FDInsQryDet := TFDQuery.Create(nil);
   QryGetId := TFDQuery.Create(nil);

   FDInsQry.Connection := DM.FDConnection;
   FDInsQryDet.Connection :=  DM.FDConnection;
   QryGetId .Connection :=  DM.FDConnection;
  // DM.FDConnection.StartTransaction;
   try
     // Query pedido
     Str.Clear;
     Str.Append('INSERT INTO ');
     Str.Append('pedidosdadosgerais ');
     Str.Append('( DataEmisao,');
     Str.Append(' FkCodCli,  ');
     Str.Append(' ValorTotal)');
     Str.Append('VALUES (');
     Str.Append(' :pDataEmisao,');
     Str.Append(' :pFkCodCli,');
     Str.Append(' :pValorTotal);');

     FDInsQry.SQL.Clear;
     FDInsQry.SQL.Add(Str.ToString);

     FDInsQry.ParamByName('pDataEmisao').AsDate := Date; //StrToDate(FormatDateTime('DD/MM/YYYY', Date));
     FDInsQry.ParamByName('pFkCodCli').AsInteger := CodCli;
     FDInsQry.ParamByName('pValorTotal').AsCurrency := VTotal;

     //FDInsQry.SQL.SaveToFile('C:\Projetos\Projeto WK\Win32\Debug\Teste.sql');
     FDInsQry.ExecSQL;

     QryGetId.SQl.Clear;
     QryGetId.SQl.Add('Select Last_Insert_Id() as NumPedido');    //Select Last_Insert_Id() as NumPedido   // Select MAX(NumPedido) as NumPedido FROM pedidosdadosgerais
     QryGetId.Open;
     LastId := QryGetId.FieldByName('NumPedido').AsInteger;

     //================================================================
     // Query Detalhes do pedido
     for var i := 1 to FrmPedidoVendas.StringGrid.RowCount -1 do
     begin
         Str.Clear;
         Str.Append('INSERT INTO ');
         Str.Append('pedidosprodutos ');
         Str.Append('(   FkNumeroPedido,');
         Str.Append('    FkCodProd,');
         Str.Append('    Qtd,');
         Str.Append('    VlrUnitario,');
         Str.Append('    VlrTotal) ');
         Str.Append(' VALUES ( ');
         Str.Append('   :pFkNumeroPedido,');
         Str.Append('   :pFkCodProd,');
         Str.Append('   :pQtd, ');
         Str.Append('   :pVlrUnitario, ');
         Str.Append('   :pVlrTotal);');

         FDInsQryDet.SQL.Clear;
         FDInsQryDet.SQL.Add(Str.ToString);

         FDInsQryDet.ParamByName('pFkNumeroPedido').AsInteger := LastId ;
         FDInsQryDet.ParamByName('pFkCodProd').AsInteger := StrToInt(FrmPedidoVendas.StringGrid.Cells[0,i]);
         FDInsQryDet.ParamByName('pQtd').AsInteger:=  StrToInt(FrmPedidoVendas.StringGrid.Cells[3,i]);
         FDInsQryDet.ParamByName('pVlrUnitario').AsCurrency :=  StrToCurr(FrmPedidoVendas.StringGrid.Cells[2,i]);
         FDInsQryDet.ParamByName('pVlrTotal').AsCurrency := StrToCurr(FrmPedidoVendas.StringGrid.Cells[4,i]);

         FDInsQryDet.ExecSQL;
     end;
    // DM.FDConnection.Commit;
     Result := True;
   except
   //  DM.FDConnection.Rollback;
     raise;
     Result := False;
   end;
end;


function TConsulta.SelectCliente(CodCli: string): TStringlist;
var
  FDSelQry : TFDQuery;
  SQLSelCli : String;
  Cliente : TStringList;
begin
  Cliente := TStringList.Create;

  SQLSelCli := '';
  SQLSelCli := 'SELECT PKCodCli, Nome FROM clientes WHERE PKCodCli = ' + QuotedStr(Trim(CodCli));
  FDSelQry := TFDQuery.Create(nil);
  try
    FDSelQry.Connection:= DM.FDConnection;
    FDSelQry.SQL.Clear;
    FDSelQry.SQL.Add(SQLSelCli);
    FDSelQry.Open;

    if not FDSelQry.IsEmpty then
    begin
       Cliente.Add(FDSelQry.FieldByName('PKCodCli').AsString);
       Cliente.Add(FDSelQry.FieldByName('Nome').AsString);
    end
    else ShowMessage('Registro não encontrado!');
  except
    on E: Exception do
         ShowMessage('Erro: Ao tentar realizar a consulta' + E.Message );
  end;
  Result := Cliente;
end;

function TConsulta.SelectProd(Prod : string) :TStringlist ;
var
  FDSelQry : TFDQuery;
  SQLSelProd : String;
  Produto : TStringList;
begin
  Produto := TStringList.Create;

  SQLSelProd := '';
  SQLSelProd := 'SELECT PkCodProd, Descricao, FORMAT(PrecoVenda,2,''de_DE'') AS PrecoVenda FROM Produtos WHERE Descricao = ' + QuotedStr(Trim(Prod));
  FDSelQry := TFDQuery.Create(nil);

  try
    FDSelQry.Connection:= DM.FDConnection;
    FDSelQry.SQL.Clear;
    FDSelQry.SQL.Add(SQLSelProd);
    FDSelQry.Open;

    if not FDSelQry.IsEmpty then
    begin
       Produto.Add(FDSelQry.FieldByName('PkCodProd').AsString);
       Produto.Add(FDSelQry.FieldByName('Descricao').AsString);
       Produto.Add(FDSelQry.FieldByName('PrecoVenda').AsString);
    end
    else ShowMessage('Registro não encontrado!');
  Except
    on E: Exception do
         ShowMessage('Erro: Ao tentar realizar a consulta' + E.Message );
  end;
  Result := Produto;
end;


end.