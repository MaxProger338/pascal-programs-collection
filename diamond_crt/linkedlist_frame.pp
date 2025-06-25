unit linkedlist_frame;
interface

type
	Frame = record
		beginf, endf, currentf: word;
	end;

	FrameNodeptr = ^FrameNode;
	FrameNode = record
		next: FrameNodeptr;
		data: Frame;
	end;

procedure CreateList(var myFrameNode: FrameNodeptr; var data: Frame);
procedure DeleteList(myFrameNode: FrameNodeptr);
function  GetSize(myFrameNode: FrameNodeptr): word;
procedure AddFrameNode(var myFrameNode: FrameNodeptr; var data: Frame);
procedure RemoveFrameNode(var myFrameNode: FrameNodeptr);
procedure GetFrameNode(myFrameNode: FrameNodeptr; index: word; var data: Frame);
procedure SetFrameNode(myFrameNode: FrameNodeptr; index: word; var data: Frame);

implementation

{ private }
procedure CreateList(var myFrameNode: FrameNodeptr; var data: Frame);
begin
	new(myFrameNode);
	myFrameNode^.next := nil;
	myFrameNode^.data := data;
end;

procedure DeleteList(myFrameNode: FrameNodeptr);
var
	next: FrameNodeptr;
begin
	if myFrameNode = nil then
		exit;

	next := myFrameNode^.next;
	dispose(myFrameNode);

	if next = nil then
		exit;

	DeleteList(next);
end;

function GetSize(myFrameNode: FrameNodeptr): word;
begin
	if myFrameNode = nil then
	begin
		GetSize := 0;
		exit;
	end;

	if myFrameNode^.next = nil then
	begin
		GetSize := 1;
		exit;
	end;

	GetSize := GetSize(myFrameNode^.next) + 1;
end;

procedure AddFrameNode(var myFrameNode: FrameNodeptr; var data: Frame);
begin
	if myFrameNode = nil then
	begin
		CreateList(myFrameNode, data);
		exit;
	end;

	AddFrameNode(myFrameNode^.next, data);
end;

procedure RemoveFrameNode(var myFrameNode: FrameNodeptr);
begin
	if myFrameNode = nil then
		exit;

	if myFrameNode^.next = nil then
	begin
		dispose(myFrameNode);
		myFrameNode := nil;
		exit;
	end;

	if myFrameNode^.next^.next = nil then
	begin
		dispose(myFrameNode^.next);
		myFrameNode^.next := nil;
		exit;
	end;
		
	RemoveFrameNode(myFrameNode^.next);
end;

procedure GetFrameNode(myFrameNode: FrameNodeptr; index: word; var data: Frame);
var
	size: word;
begin
	size := GetSize(myFrameNode);
	if index >= size then
		halt(1000);

	if index = 0 then
	begin
		data := myFrameNode^.data;
		exit;
	end;

	GetFrameNode(myFrameNode^.next, index - 1, data);
end;

procedure SetFrameNode(myFrameNode: FrameNodeptr; index: word; var data: Frame);
var
	size: word;
begin
	size := GetSize(myFrameNode);
	if index >= size then
		halt(1000);

	if index = 0 then
	begin
		myFrameNode^.data := data;
		exit;
	end;

	SetFrameNode(myFrameNode^.next, index - 1, data);
end;

end.
