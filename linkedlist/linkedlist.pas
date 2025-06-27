program LinkedList;

type
	nodeval = Pointer;
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

{ Init the list (zero first, last pointers and its size) }
procedure LSTInit(var list: TList);
begin
	list.first := nil;
	list.last  := nil;
	list.size  := 0
end;

{ Delete the list (if it is empty, she does nothing) }
procedure LSTDelete(var list: TList);
var
	next: nodeptr;
begin
	if list.first = nil then exit;
	next := list.first^.next;

	dispose(list.first);
	list.first := next;
	
	LSTDelete(list);
	list.size := 0
end;

{ Add the node to the begin of the list (if it is empty, she "creates" it) }
procedure LSTAddToBegin(var list: TList; data: nodeval);
var
	newNode: nodeptr;
begin
	new(newNode);
	newNode^.next := list.first;
	newNode^.data := data;

	{ If the list is empty }
	if list.first = nil then 
		list.last := newNode;

	list.first    := newNode;
	list.size     := list.size + 1
end;

{ Add the node to the end of the list (if it is empty, she "creates" it) }
procedure LSTAddToEnd(var list: TList; data: nodeval);
var
	newNode: nodeptr;
begin
	{* Could be done in another way: 
	 * Call AddToBegin if the list is empty, 
	 * and if not, use dispose(list.last^.next); 
	 * But I found it not concise and impudent
	 *}
	new(newNode);
	newNode^.next := nil;
	newNode^.data := data;
	{ If the list is not empty }
	if list.last <> nil 
		{ If the list is empty, it will result in an error } 
		then list.last^.next := newNode
		{ if it is empty, then the last element will also be the first }
		else list.first      := newNode;

	list.last := newNode;
	list.size := list.size + 1
end;

{ Set node's data by her index startx since 0 (if the index uncorrect - runtime error }
procedure LSTSetAt(var list: TList; data: nodeval; index: listsize);
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
	LSTSetAt(list, data, index - 1);
	list.first := current
end;

{ Get node's data by her index starts since 0 (if the index uncorrect - runtime error) }
function LSTGetAt(var list: TList; index: listsize): nodeval;
var
	current: nodeptr;
begin
	if index = 0 then 
	begin
		LSTGetAt := list.first^.data;
		exit
	end;
	
	current    := list.first;
	list.first := list.first^.next;
	LSTGetAt   := LSTGetAt(list, index - 1);
	list.first := current
end;

{ Get a size of list (just reads list.size, because it should be abstraction }
function LSTGetSize(var list: TList): listsize;
begin
	LSTGetSize := list.size
end;

{ Delete node from begin of list (if the list is empty - runtime error) }
procedure LSTDeleteFromBegin(var list: TList);
var
	second: nodeptr;
begin
	second := list.first^.next;
	dispose(list.first);
	list.first := second;
	
	list.size  := list.size - 1
end;

{ Retrun is the list empty (just reads list.size, because it should be abstraction}
function LSTIsEmpty(var list: TList): boolean;
begin
	LSTIsEmpty := list.size = 0
end;

var
	list: TList;
	i: integer;
	n: PInteger;
begin
{--- Task 1 ---------------------------------------}
	writeln('task 1 -------------');

	LSTInit(list);
	{ Input }
	while not SeekEof do
	begin
		new(n);
		read(n^);
		LSTAddToBegin(list, n)
	end;
	{ Output }
	for i := 0 to LSTGetSize(list) - 1 do
		writeln(PInteger(LSTGetAt(list, i))^);
	{ Cleanup }
	for i := 0 to LSTGetSize(list) - 1 do
		dispose(PInteger(LSTGetAt(list, i)));

	LSTDelete(list);

{--- Task 2 ---------------------------------------}
	writeln('task 2 -------------');

	LSTInit(list);
	{ Input }
	while not SeekEof do
	begin
		new(n);
		read(n^);
		LSTAddToEnd(list, n)
	end;
	{ Output }
	for i := 0 to LSTGetSize(list) * 2 - 1 do
		writeln(PInteger(LSTGetAt(list, i mod LSTGetSize(list)))^);
	{ Cleanup }
	for i := 0 to LSTGetSize(list) - 1 do
		dispose(PInteger(LSTGetAt(list, i)));

	LSTDelete(list)
end.
