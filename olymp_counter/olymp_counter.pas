program OlympCouner;
const
	MaxGroups = 100;
	MaxSchools = 67;
type
	CountersArray = array [1..MaxSchools] of word;

procedure PrintRecordSchools(var TheCounters: CountersArray);
var
	n, i: word;
begin
	{ Find first record school }
	n := 1;
	for i := 2 to MaxSchools do
		if TheCounters[i] > TheCounters[n] then n := i;
	{ Find the same schools by results }
	for i := 1 to MaxSchools do
		if TheCounters[i] = TheCounters[n] then
			writeln('School is ', i)
end;

var
	Counters: CountersArray;
	s: integer;
	n, i: word;
begin
	for i := 1 to MaxSchools do
		Counters[i] := 0;

	{$I-}
	while not eof do
	begin
		readln(n);
		if IOResult <> 0 then
		begin
			writeln('Incorrect data');
			halt(1)
		end;

		s := n div MaxGroups;
		if (s < 0) or (s > MaxSchools) then
		begin
			writeln('Incorrect a school number ', s);
			halt(2)
		end;
		Counters[s] := Counters[s] + 1
	end;

	PrintRecordSchools(Counters)
end.
