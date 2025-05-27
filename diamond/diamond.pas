program diamond;
const
	LEFT_SIDE_SYMBOL_OF_DIAMOND  = '/';
	RIGHT_SIDE_SYMBOL_OF_DIAMOND = '\';
	MIDDLE_SYMBOL                = '|';

procedure PrintSpaces(n: byte);
var
	i: byte;
begin
	for i := 1 to n do
		write(' ')
end;

procedure PrintLineOfDiamond(l, n: byte; left_side_symbol, right_side_symbol: char);
var
	i: byte;
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

var
	heigth, i: byte;
	n: byte; { a diamond half-heigth }
	l: byte; { a current line of diamond }
begin
	{ Ask user, what is height does he want }
	repeat
		write('Enter diamond''s heigth (only odd): ');
		read(heigth)
	until heigth mod 2 = 1;
	n := heigth div 2;

	{ Draw a top part of the diamond }
	for l := 2 to n do
		PrintLineOfDiamond(l, n, LEFT_SIDE_SYMBOL_OF_DIAMOND, RIGHT_SIDE_SYMBOL_OF_DIAMOND);
	
	{ Draw a middle part of the diamond }
	PrintLineOfDiamond(l, n, MIDDLE_SYMBOL, MIDDLE_SYMBOL);

	{ Draw a bottom part of the diamond }
	for l := n downto 2 do
		PrintLineOfDiamond(l, n, RIGHT_SIDE_SYMBOL_OF_DIAMOND, LEFT_SIDE_SYMBOL_OF_DIAMOND);
end.
