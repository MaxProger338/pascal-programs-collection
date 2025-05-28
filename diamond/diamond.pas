program diamond;

procedure PrintSpaces(n: byte);
var
	i: byte;
begin
	for i := 1 to n do
		write(' ')
end;

procedure PrintLineOfDiamond(l, n: byte; left_side_symbol, right_side_symbol: char);
begin
	{ write spaces before a first symbol }
	PrintSpaces(n - l + 1);
	write(left_side_symbol);

	{ if l not a first, write spaces and a second symbol again }
	if l > 1 then
	begin 
                { 1 + 2(l - 2) = 2*l - 3 }
		PrintSpaces(2*l - 3);
	        write(right_side_symbol)
	end;
	writeln
end;

procedure PrintDiamond(n: byte);
var
	l: byte; { a current line of diamond }
begin
	{ Draw a top part of the diamond }
	{ replace 2 with 1 to also draw the top corner of a diamond }
	for l := 1 to n do
		PrintLineOfDiamond(l, n, '*', '*');
	
	{ Draw a middle part of the diamond }
	PrintLineOfDiamond(l, n, '*', '*');

	{ Draw a bottom part of the diamond }
	{ replace 2 with 1 to also draw the bottom corner of a diamond }
	for l := n downto 1 do
		PrintLineOfDiamond(l, n, '*', '*');
end;

var
	heigth: byte;
	n: byte; { a diamond half-heigth }
begin
	while true do
	begin
        	{ Ask user, what is height does he want }
		repeat
	 		write('Enter diamond''s heigth (only odd): ');
			read(heigth)
		until heigth mod 2 = 1;
		n := heigth div 2;
	
		PrintDiamond(n);
	end;
end.
