unit server.model.dao.impl.generic.iterator;

interface

uses
  server.model.dao.interfaces, System.Generics.Collections;
type
  TDAOGenericIterator<T: class, constructor> = class(TInterfacedObject, iDAOGEnericIterator<T>)
  private
    FList : TObjectList<T>;
    FCount : Integer;
  public
    constructor Create(AList : TObjectList<T>);
    class function New(AList : TObjectList<T>) : iDAOGEnericIterator<T>;
    function HasNext : boolean;
    function Next : T;

  end;
implementation

{ TDAOGenericIterator<T> }

constructor TDAOGenericIterator<T>.Create(AList : TObjectList<T>);
begin
  FList := AList;
  FCount := 0;
end;

function TDAOGenericIterator<T>.HasNext: boolean;
begin
  Result := not (FCount = FList.Count);
end;

class function TDAOGenericIterator<T>.New(AList : TObjectList<T>): iDAOGEnericIterator<T>;
begin
  Result := Self.Create(AList);
end;

function TDAOGenericIterator<T>.Next: T;
begin
  Result := FList[FCount];
  Inc(FCount);
end;

end.
