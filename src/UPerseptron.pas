unit UPerseptron;

interface

const
  ReceptorCount=12;
  ResultCount=4096;//2^12

type
TRPerseptron = record
  PResult: word;
  AReceptors: array [1..ReceptorCount] of byte;
  AResult: array [1..ResultCount] of word;
  ASymbols: array [1..ResultCount] of string;
  AConnections: array [1..ResultCount,1..ReceptorCount] of byte;
end;

implementation

end.

