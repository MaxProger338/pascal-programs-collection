program fibonacci_recurse;
uses
  SysUtils;

function Fibonacci(n: byte): qword;
begin
	if n < 2 then
	begin
		Fibonacci := n;
		exit
	end;

	Fibonacci := Fibonacci(n - 2) + Fibonacci(n - 1);
end;

var
	n: byte;
begin
	n := StrToInt(ParamStr(1));

	writeln(n, ' in fibonacci: ', Fibonacci(n))
end.
