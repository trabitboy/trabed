require('cprlfl')
require('tbox')
require('typo')

buffer={'first line','second line','third line'}

currLine=1
currChar=0 -- this is where we insert, visible cursor is +1


widgets={}

function love.load()
	table.insert(widgets,createtbox(0,0,100,100))


end


function savebuf()
	tofile=""
	for i,s in ipairs(buffer)
	do
		tofile=tofile..s..'\n'
	end
	love.filesystem.write('buffer.lua',tofile)
end

function loadbuf()
	buffer={}

	for line in love.filesystem.lines('buffer.lua')
	do
		table.insert(buffer,line)
		print(line)
	end
end


-- local function addtext(b,txt)
	-- b.buffer[b.line]=b.buffer[b.line]:sub(1,b.char)..txt..b.buffer[b.line]:sub(b.char+1)
	-- -- b.char=b.char+string.len(txt)
	-- b.char=b.char+1
		-- print("char "..b.char)
	-- -- b.char=string.len(b.buffer[b.line])
-- end
