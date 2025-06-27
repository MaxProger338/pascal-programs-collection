program RandomStars;
uses crt;

const
	DelayDuraction = 20;
	ColorCount = 16;
var
	AllColors: array [1..ColorCount] of word =
	(
		Black, Blue, Green, Cyan,
		Red, Magenta, Brown, Lightgray,
		Darkgray, Lightblue, Lightgreen, Lightcyan,
		Lightred, Lightmagenta, Yellow, White
	);

var
	x, y, col: integer;
begin
	randomize;
	clrscr;
	while not KeyPressed do
	begin
		x := random(ScreenWidth)  + 1;
		y := random(ScreenHeight) + 1;
		{ Если звёздочка спавнить в правом нижнем углу, мы прекращаем их спавнить }
		if (x = ScreenWidth) or (y = ScreenHeight) then 
			continue;

		col := random(ColorCount) + 1;
		TextColor(AllColors[col]);

		GoToXY(x, y);
		write('*');
		Delay(DelayDuraction)
	end;
	clrscr
end.
