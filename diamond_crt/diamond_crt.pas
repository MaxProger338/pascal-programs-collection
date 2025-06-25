program diamond_crt;
uses
	crt, linkedlist_word, linkedlist_frame;

begin
	writeln('kek');
{
const
	MaxHalfHeightOfDiamond = 10;
	MinHalfHeightOfDiamond = 1;
	DelayDuration          = 50;
	SideSymbol             = '*';
	DiamondTextcolor       = Cyan;
	DiamondBGColor         = Blue;
type
	Diamond = record
		x, y, height: word;  { ^half-height }
{		symbol: char;
{		color, bgcolor: word;
	end;

	Action = procedure(var myFrame: Frame);
	Frame = record
		beginf, endf, currentf: word;
		params: Nodeptr;
		action: Action;
	end;

	Animation = record
		frames: Nodeptr;
	end;
var
	myAnimation: Animation;

procedure PrintDiamondAnimation(var myAnimation: Animation);
var
	frame1: ^Frame;
begin
	{--- FRAMES ---}
{	new(frame1);
	frame1^.beginf := 1;
	frame1^.endf   := 1;
	AddNode(frame1^.params, 
	
	AddNode(myAnimation.frames, Pointer(frame1));
end;

procedure PrintSpaces(n: word);
var
	i: word;
begin
	for i := 1 to n do
		write(' ');
end;

{ l - a current line of the diamond }
{procedure PrintLineOfDiamond(l: word; myDiamond: Diamond);
var
	saveTextAttr: byte;
begin
	saveTextAttr := TextAttr;

	{ write spaces before a first symbol }
{	PrintSpaces(myDiamond.height - l);
	TextBackground(myDiamond.bgcolor);
	TextColor(myDiamond.color);
	write(myDiamond.symbol);

	{ if l not a first, write spaces and a second symbol again }
{	if l > 1 then
	begin 
		{ 1 + 2(l - 2) = 2*l - 3 }
{		PrintSpaces(2*l - 3);
	        write(myDiamond.symbol);
	end;

	TextAttr := saveTextAttr;
end;

procedure PrintMiddleLineOfDiamond(myDiamond: Diamond);
begin
	{ Based on the formula for printing left spaces 
	(spaces = n - l, where n - a half-height; l - a current line), 
	and the formula for printing spaces in the center (spaces = 2l - 3), 
	we should just increase the current line by one to continue the treatment further, 
	but then we will go beyond the l to n boundaries in the loop (in a procedure PrintDiamond), 
	so we make the diamond one more by making n + 1 }
       
{	myDiamond.height := myDiamond.height + 1;
	PrintLineOfDiamond(myDiamond.height, myDiamond);
end;

procedure PrintDiamond(myDiamond: Diamond);
var
	xd, yd, l, n: word;
begin
	xd := myDiamond.x;
	yd := myDiamond.y;
	n  := myDiamond.height;

	{ Draw a top part of the diamond }
	{ replace 2 with 1 to also draw the top corner of a diamond }
{	for l := 1 to n do
	begin
		GoToXY(xd, yd + l - 1);
		{ All rows except the central line must recede one sivmol more than 
		 themselves in relation to the central line, 
		 because the countdown of the position begins from it }
{		PrintSpaces(1);
		PrintLineOfDiamond(l, myDiamond);
	end;
	
	{ Draw a middle part of the diamond }
{	GoToXY(xd, yd + n);
	PrintMiddleLineOfDiamond(myDiamond);

	{ Draw a bottom part of the diamond }
	{ replace 2 with 1 to also draw the bottom corner of a diamond }
{	for l := n downto 1 do
	begin
		GoToXY(xd, yd + n + (n - l) + 1);
		PrintSpaces(1);
		PrintLineOfDiamond(l, myDiamond)
	end;
	writeln
end;

procedure HideDiamond(myDiamond: Diamond);
var
	textcolorMask: byte = %00001111;
	bgcolorMask:   byte = %01110000;
begin
	myDiamond.symbol  := ' ';
	{ Get only a textcolor }
{	myDiamond.color   := TextAttr and textcolorMask;
	{ Get only a bgcolor }
{	myDiamond.bgcolor := TextAttr and bgcolorMask;
	PrintDiamond(myDiamond);
end;

procedure SetDiamondPositionAtCenter(var myDiamond: Diamond);
var
	centerX, centerY: word;
begin
	centerX := ScreenWidth  div 2 - (2*myDiamond.height + 1) div 2 - 1;
	centerY := ScreenHeight div 2 - myDiamond.height + 1;

	myDiamond.x := centerX;
	myDiamond.y := centerY;
end;

procedure PrintPulseDiamondAtCenter(myDiamond: Diamond; delayDuration: word; minHeight, maxHeight: word);
var
	n: word;
begin
	{ Increasing a diamond }
{	for n := minHeight to maxHeight do
	begin
		HideDiamond(myDiamond);
		myDiamond.height := n;
		SetDiamondPositionAtCenter(myDiamond);
		PrintDiamond(myDiamond);
		delay(delayDuration);
		HideDiamond(myDiamond);
	end;
	{ Shrinking a diamond }
{	for n := maxHeight downto minHeight do
	begin
		HideDiamond(myDiamond);
		myDiamond.height := n;
		SetDiamondPositionAtCenter(myDiamond);
		PrintDiamond(myDiamond);
		delay(delayDuration);
		HideDiamond(myDiamond);
	end;
end;

procedure AnimateFramesLoop(var myAnimation: Animation);
const
	animationStep = 1;
	animationBegin = 1;
	animationEnd = 1000;
	animationDelay = 1; { milliseconds }
{var
	i: word;
begin
	for i := animationBegin to animationEnd do
		;
		{ Iterate through an array of frames in our a myAnimation }	
	{end;}
{end;

var
	myDiamond: Diamond;
begin
	myDiamond.height  := 3;
	myDiamond.symbol  := SideSymbol;
	myDiamond.color   := DiamondTextcolor;
	myDiamond.bgcolor := DiamondBGColor;
	
	clrscr;
	while not KeyPressed() do
	begin
		PrintPulseDiamondAtCenter(
			myDiamond,
			DelayDuration,
			MinHalfHeightOfDiamond, 
			MaxHalfHeightOfDiamond);
	end;
end.
}
end.
