unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Edit3: TEdit;
    Label3: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

uses Unit2;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
if Edit1.Text = '' then
begin
 ShowMessage('Nama Satuan tidak boleh kosong!');
  Exit;
  end else
  if DataModule2.ZQry1.Locate('nama', Edit1.Text,[])then
  begin
    ShowMessage('Nama Satuan'+Edit1.Text+' sudah ada didalam sistem');
    end;
  if Edit2.Text = '' then
  begin
    ShowMessage('Diskripsi tidak boleh kosong!');
    exit;
  end;
    begin // simpan
    with DataModule2.ZQry1 do
    begin
      SQL.Clear;
      SQL.Add('insert into satuan values(null,"'+Edit1.Text+'","'+Edit2.Text+'")');
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
  with DataModule2.ZQry1 do
  begin
    SQL.Clear;
    SQL.Add('delete from satuan where id = "'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from satuan');
    Open;
  end;
  ShowMessage('Data berhasil dihapus');
end else
begin
  ShowMessage('Data berhasil dihapus!');
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if Edit1.Text = '' then
begin
  ShowMessage('Nama Satuan tidak boleh kosong!');
  end else
  if Edit1.Text = DataModule2.ZQry1.Fields[1].AsString then
  begin
    ShowMessage('Nama satuan'+Edit1.text+'Tidak ada Perubahan');
  end else
  begin
    with DataModule2.ZQry1 do
    begin
      SQL.Clear;
      SQL.Add('update satuan set nama="'+Edit1.Text+'", diskripsi="'+Edit2.Text+'" where id = "'+a+'"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil diubah');
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Edit1.clear;
Edit2.clear;
end;

end.
