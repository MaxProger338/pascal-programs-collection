unit linkedlist;
interface

type
	Nodeptr = ^Node;
	Node = record
		next: Nodeptr;
		data: pointer;
	end;

procedure CreateList(var myNode: Nodeptr; data: pointer);
procedure DeleteList(myNode: Nodeptr);
function  GetSize(myNode: Nodeptr): word;
procedure AddNode(var myNode: Nodeptr; data: pointer);
procedure RemoveNode(var myNode: Nodeptr);
function  GetNode(myNode: Nodeptr; index: word): pointer;
procedure SetNode(myNode: Nodeptr; index: word; data: pointer);

implementation

{ private }
procedure CreateList(var myNode: Nodeptr; data: pointer);
begin
	new(myNode);
	myNode^.next := nil;
	myNode^.data := data;
end;

procedure DeleteList(myNode: Nodeptr);
var
	next: Nodeptr;
begin
	if myNode = nil then
		exit;

	next := myNode^.next;
	dispose(myNode);

	if next = nil then
		exit;

	DeleteList(next);
end;

function GetSize(myNode: Nodeptr): word;
begin
	if myNode = nil then
	begin
		GetSize := 0;
		exit;
	end;

	if myNode^.next = nil then
	begin
		GetSize := 1;
		exit;
	end;

	GetSize := GetSize(myNode^.next) + 1;
end;

procedure AddNode(var myNode: Nodeptr; data: pointer);
begin
	if myNode = nil then
	begin
		CreateList(myNode, data);
		exit;
	end;

	AddNode(myNode^.next, data);
end;

procedure RemoveNode(var myNode: Nodeptr);
begin
	if myNode = nil then
		exit;

	if myNode^.next = nil then
	begin
		dispose(myNode);
		myNode := nil;
		exit;
	end;

	if myNode^.next^.next = nil then
	begin
		dispose(myNode^.next);
		myNode^.next := nil;
		exit;
	end;
		
	RemoveNode(myNode^.next);
end;

function GetNode(myNode: Nodeptr; index: word): pointer;
var
	size: word;
begin
	size := GetSize(myNode);
	if index >= size then
		halt(1000);

	if index = 0 then
	begin
		GetNode := myNode^.data;
		exit;
	end;

	GetNode := GetNode(myNode^.next, index - 1);
end;

procedure SetNode(myNode: Nodeptr; index: word; data: pointer);
var
	size: word;
begin
	size := GetSize(myNode);
	if index >= size then
		halt(1000);

	if index = 0 then
	begin
		myNode^.data := data;
		exit;
	end;

	SetNode(myNode^.next, index - 1, data);
end;

end.
