unit ur_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRCtrls, QuickRpt, Vcl.ExtCtrls;

type
  Tr_vendas = class(TForm)
    QRP: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData1: TQRSysData;
    q_vendas: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   r_vendas: Tr_vendas;

   par : boolean;

implementation

{$R *.dfm}

procedure Tr_vendas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if not par then
     begin
          DetailBand1.Color := $00E1E1E1;
     end
     else begin
          DetailBand1.Color := clWhite;
     end;

     par := not par;


end;

procedure Tr_vendas.QRPBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     par:= false;
     q_vendas.Open;
end;

end.
