{ This program prints all colors (which crt module has) }

program ColorsDemo;  { colordemo.pas }
uses crt;

const
	BGColCount = 8;
	ColorCount = 16;
var
	AllColors: array [1..ColorCount] of word = 
	(
		{ For fg and bg }
		Black, Blue, Green, Cyan,
		Red, Magenta, Brown, Lightgray,
		{ For fg only }
		Darkgray, Lightblue, Lightgreen, Lightcyan,
		Lightred, LightMagenta, Yellow, White
	);

procedure WriteColumnContent(width: integer);
var
	i: integer;
begin
	for i := 1 to width do
		write('*')
end;

{--- DRAWING (change color) -------------------------}
{ Change column's content color by (line % Color + 1) } 
procedure DrawColumnContent(line: integer);
begin
	if line = 0
		then TextColor(AllColors[line + 1])
		else TextColor(AllColors[line mod ColorCount + 1]);
end;

{ Change column background by her number }
procedure DrawColumn(col: integer);
begin
	if col > BGColCount then halt(1);
	TextBackground(AllColors[BGColCount + col]);
end;

{--- PRINT --------------------------------}
{ Print a separate column (of the same color) } 
procedure PrintColumn(width, line, col: integer);
begin
	DrawColumn(col);
	DrawColumnContent(line);
	WriteColumnContent(width)
end;

{ Print a string (just as many columns as there are colors) }
procedure PrintLine(width, line: integer);
var
	col, colWidth, remnantWidth: integer;
begin
	colWidth     := ScreenWidth div BGColCount;
	{ How much space is left after all the columns }
	remnantWidth := ScreenWidth mod BGColCount;

	for col := 1 to BGColCount do
	begin
		if remnantWidth > 0
			then PrintColumn(colWidth + 1, line, col)
			else PrintColumn(colWidth,     line, col);
		remnantWidth := remnantWidth - 1;
	end;
end;

procedure ShowScreen();
var
	i: integer;
begin
	{* Due to the peculiarities of the algorithm, it does not allow you 
	 * to print the first line of the first color. 
	 * Therefore, there is a special case: line 0 - it will solve the problem 
	 * by printing with the first color
	 *}
	for i := 0 to ScreenHeight do
		PrintLine(ScreenWidth, i)
end;

var
	SaveTextAttr: integer;
begin
	{ Save current color settings }
	SaveTextAttr := Textattr;
	{ work }
	ShowScreen;
	{ Restore color setting }
	Textattr := SaveTextAttr
end.
