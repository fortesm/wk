unit ClassProdutos;

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
  TProdutos = class(TObject)   // A CLASSE TCONSULTA  HERDA DE TOBJECT
     DSMas : TDataSource;
  private
  public
     function SelectProduto(Prod : string) : TStringlist;
  end;

implementation

Uses UDMPrincipal, View.PedidoVendas;

//MÉTODO DA CLASSE SELECT PRODUTOS QUE IMPLEMENTA A SELEÇÃO DOS PRODUTOS E RETORNA NUM OBJETO TStringList
function TProdutos.SelectProduto(Prod : string) : TStringlist ;
var
  FDSelQry : TFDQuery;
  SQLSelProd, Campo : String;
  Produto : TStringList;
  Retorno : Integer;
begin
  Campo  := '';
  Produto := TStringList.Create;

  if TryStrToInt(Prod, Retorno) then
       Campo :=  'PkCodProd'
  else
       Campo :=  'Descricao';

  SQLSelProd := '';
  SQLSelProd := 'SELECT PkCodProd, Descricao, FORMAT(PrecoVenda,2,''de_DE'') AS PrecoVenda FROM Produtos WHERE ' + Campo + ' = ' + QuotedStr(Trim(Prod));
  FDSelQry := TFDQuery.Create(nil);
  try
    FDSelQry.Connection := DM.FDConnection;
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
