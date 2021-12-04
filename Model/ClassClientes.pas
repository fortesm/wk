unit ClassClientes;

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
  TClientes = class(TObject)
     DSMas : TDataSource;
  private
  public
     function SelectCliente(CodCli : string) : TStringlist;
  end;

implementation

Uses UDMPrincipal, View.PedidoVendas;

function TClientes.SelectCliente(CodCli: string): TStringlist;
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

end.
