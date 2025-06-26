program SkipIdent;		{ skip_indent.pas }
var
	c: char;
	printing, checked: boolean;
begin
	printing := false;  { Печатаем ли мы в данный момент строку }
	checked  := false;  { Проверили ли мы строку }

	while not eof do
	begin
		read(c);
		if c = #10 then
		begin
			if printing then writeln;
			{ Новую строку мы ещё не проверили }
			checked := false;
			printing := false
		end 
		else 
		begin
			{ Если ничего не знаем, надо узнать }
			if not checked then
			begin
				printing := (c <> ' ') and (c <> #9);
				checked  := true
			end;
			
			if printing then
				write(c)
		end;
	end
end.
