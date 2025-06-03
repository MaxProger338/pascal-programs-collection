{ A program for find element by his number in a fibonacci set
  Works only before 94-th element 
  					By MaxProger338
}
program fibonacci;
uses
  SysUtils;

{ n - a number in fibonacci set ( a zero also supports ) }
function Fibonacci(n: byte): qword;
var
	current, prev, pprev: qword;
	i: byte;
begin
	if n = 0 then
	begin
		Fibonacci := 0;
		exit
	end;

	current := 1;  { first element in fibonacci set equals 1 }
	prev    := 0;
	{ If a number less than 2, for doesn't work, and than function just returns first element }
	for i := 2 to n do
	begin
		pprev   := prev;
		prev    := current;
		current := pprev + prev
	end;
	Fibonacci := current
end;

var
	n: integer; { number in fibonacci set }
begin
	n := StrToInt(ParamStr(1));

	writeln(n, ' in fibonacci: ', Fibonacci(n))
end.
