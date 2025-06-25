program linkedlist_test;
uses
	linkedlist;
var
	myNode: Nodeptr;
	i: word;
	p1, p2, p3: ^integer;
begin
	new(p1);
	new(p2);
	new(p3);
	p1^ := 1;
	p2^ := 2;
	p3^ := 3;
	
	AddNode(myNode, p1);
	AddNode(myNode, p2);
	AddNode(myNode, p3);
	RemoveNode(myNode); 
	
	for i := 1 to GetSize(myNode) do
		writeln('[', i, '] = ', GetNode(myNode, i - 1)^);

	DeleteList(myNode);
end.
