program MatchPattern;  { match_pt.pas }

function MatchIdx(var pat, str: string; idxp, idxs: integer)
												: boolean;
var
	i: integer;
begin
	while True do
	begin
		if idxp > length(pat) then
		begin
			MatchIdx := idxs > length(str);
			exit
		end;
		if pat[idxp] = '*' then
		begin
			for i := 0 to length(str) - idxs + 1 do
				if MatchIdx(pat, str, idxp + 1, idxs + i) then
				begin
					MatchIdx := true;
					exit
				end;
			MatchIdx := false;
			exit
		end;
		if (idxs > length(str)) or
			((str[idxs] <> pat[idxp]) and (pat[idxp] <> '?')) then
		begin
			MatchIdx := false;
			exit
		end;
		idxp := idxp + 1;
		idxs := idxs + 1
	end
end;

function Match(pat, str: string): boolean;
begin
	Match := MatchIdx(pat, str, 1, 1)
end;

begin
	if ParamCount <> 2 then
	begin
		writeln(ErrOut, 'Two parameters expected: a pattern and a matching string.');
		halt(1)
	end;

	if Match(ParamStr(1), ParamStr(2)) then
		writeln('yes')
	else
		writeln('no')
end.
