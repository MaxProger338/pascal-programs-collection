program LinkedList;

type
	nodeval = longint;
	nodeptr =  ^TNode;
	TNode = record
		data: nodeval;
		next: nodeptr;
	end;
	
	listsize = longint;
	TList = record
		first, last: nodeptr;
		size: listsize;
	end;

procedure InitList(var list: TList);
begin
	list.first := nil;
	list.last  := nil;
	list.size  := 0;
end;

procedure DeleteList(var list: TList);
var
	next: nodeptr;
begin
	if list.first = nil then exit;
	next := list.first^.next;

	dispose(list.first);
	list.first := next;
	
	DeleteList(list);
	list.size := 0;
end;

procedure AddToBegin(var list: TList; data: nodeval);
var
	newNode: nodeptr;
begin
	new(newNode);
	newNode^.next := list.first;
	newNode^.data := data;

	list.first    := newNode;
	list.size     := list.size + 1
end;

procedure AddToEnd(var list: TList; data: nodeval);
var
	newNode: nodeptr;
begin
	new(newNode);
	newNode^.next := nil;
	newNode^.data := data;
	{ If list is not empty }
	if list.last <> nil 
		{ If the sheet is empty, it will result in an error } 
		then list.last^.next := newNode
		{ if it is empty, then the last element will also be the first }
		else list.first      := newNode;

	list.last := newNode;
	list.size := list.size + 1;
end;

procedure SetAt(var list: TList; data: nodeval; index: listsize);
var
	current: nodeptr;
begin
	if index = 0 then
	begin 
		list.first^.data := data;
		exit
	end;

	current    := list.first;
	list.first := list.first^.next;
	SetAt(list, data, index - 1);
	list.first := current
end;

function GetAt(var list: TList; index: listsize): nodeval;
var
	current: nodeptr;
begin
	if index = 0 then 
	begin
		GetAt := list.first^.data;
		exit
	end;
	
	current    := list.first;
	list.first := list.first^.next;
	GetAt      := GetAt(list, index - 1);
	list.first := current
end;

var
	list: TList;
	n, i: nodeval;
begin
	InitList(list);

	while not SeekEof do
	begin
		read(n);
		AddToEnd(list, n)
	end;

	writeln('---task 1 ------');
	for i := list.size - 1 downto 0 do
		writeln(GetAt(list, i));

	writeln('---task 2 ------');
	for i := 0 to list.size * 2 - 1 do
		writeln(GetAt(list, i mod list.size));
	
	DeleteList(list)
end.
