
buffer={'first line','second line','third line'}

currLine=1
currChar=0 -- this is where we insert, visible cursor is +1



function savebuf()
	tofile=""
	
	if boxfocus~=nil then
		for i,s in ipairs(boxfocus.buffer)
		do
			tofile=tofile..s..'\n'
		end
	
	
	end
	
	-- for i,s in ipairs(buffer)
	-- do
		-- tofile=tofile..s..'\n'
	-- end
	love.filesystem.write('buffer.lua',tofile)
	--DBG TEST
	code=love.filesystem.load('buffer.lua')
	print(code)
	code()
	
end

function loadbuf()
	buffer={}

	for line in love.filesystem.lines('buffer.lua')
	do
		table.insert(buffer,line)
		print(line)
	end
	
	if boxfocus~=nil then
		boxfocus.buffer = buffer
	end
end


-- local function addtext(b,txt)
	-- b.buffer[b.line]=b.buffer[b.line]:sub(1,b.char)..txt..b.buffer[b.line]:sub(b.char+1)
	-- -- b.char=b.char+string.len(txt)
	-- b.char=b.char+1
		-- print("char "..b.char)
	-- -- b.char=string.len(b.buffer[b.line])
-- end
