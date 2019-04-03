--lua coding editor, for fun, to run its code in love 2d


buffer={'first line','second line','third line'}


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

love.keypressed = function(key, code, isrepeat)
		-- if key == 'return'then -- binding enter key to input focus
	if boxfocus~=nil and ( key=='return' or key=='backspace' or key=='left' or key=='right' or key=='up' or key=='down'  ) then
		print(key)
		-- boxfocus.editkey(boxfocus,key)
	end
	
	if key=="f1" then
		-- renderdecos= not renderdecos
		savebuf()
	end
	
	if key=="f2" then
		-- msg.postmsg(msg,"save")
		loadbuf()
	end
	
	-- if key=="f3" then
		-- msg.postmsg(msg,"load")
		-- loadgui()
	-- end
	
end


function love.draw()
	love.graphics.print("editor")
	
	
	y=20
	for i,s in ipairs (buffer)
	do
		love.graphics.print(s,0,y)
		y=y+20
	end
	
end