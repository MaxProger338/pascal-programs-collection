program MoveHello;
uses
	crt;

procedure GetKeyCode(var code: shortint);
var
	c: char;
begin
	c := ReadKey;
	code := ord(c);
	if c = #0 then
	begin
		c := ReadKey;
		code := -ord(c)
	end
end;
		
procedure ShowMsg(x, y: word; msg: string);
begin
	GoToXY(x, y);
	write(msg);
	GoToXY(1, 1)
end;

procedure HideMsg(x, y: word; msg: string);
begin
	GoToXY(x, y);
	for x := x to x + ord(msg[0]) do write(' ');
	GoToXY(1, 1)
end;

procedure MoveMsg(var x, y: word; msg: string; MoveX, MoveY: integer);
begin
	HideMsg(x, y, msg);

	x := x + MoveX;
	y := y + MoveY;
	if x = 0 then x := ScreenWidth;
	if y = 0 then y := ScreenHeight;
	if x > ScreenWidth then x := 1;
	if y > ScreenHeight then y := 1;
	ShowMsg(x, y, msg)
end;

var
	msg: string;
	x, y: word;
	c: shortint;
begin
	if ParamCount <> 1 then halt(1);
	msg := ParamStr(1);
	
	x := (ScreenWidth - ord(msg[0])) div 2;
	y := ScreenHeight div 2;
	
	clrscr;	
	ShowMsg(x, y, msg);
	repeat
		GetKeyCode(c);
		case c of
			-75, ord('h'): MoveMsg(x, y, msg, -1,  0);
			-77, ord('l'): MoveMsg(x, y, msg,  1,  0);
			-72, ord('k'): MoveMsg(x, y, msg,  0, -1);
			-80, ord('j'): MoveMsg(x, y, msg,  0,  1);
			ord('s'): ShowMsg(x, y, msg);
			ord('g'): HideMsg(x, y, msg);
		end
	until c = ord('q')	
end.
