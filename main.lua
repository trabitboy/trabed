--lua coding editor, for fun, to run its code in love 2d

cvsw=640
cvsh=480
scrsx=1
scrsy=1


--util
function tbllngth(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

require('loadfilter')

require('editor')
require('cprlfl')
require('tbox')
require('typo')

widgets={}
wcount=0

renderdecos=true

function love.load()
	table.insert(widgets,createtbox(10,10,100,100))


end



love.keypressed = function(key, code, isrepeat)
		-- if key == 'return'then -- binding enter key to input focus
	if boxfocus~=nil and ( key=='return' or key=='backspace' or key=='left' or key=='right' or key=='up' or key=='down'  ) then
		print(key)
		boxfocus.editkey(boxfocus,key)
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


function rendergui()	
	for i,w in ipairs( widgets)
	do
		w.render(w)
	
	end
	
	-- love.graphics.print("toto",100,100)
	
	--for debug,last click
	-- if npx~=nil and renderdecos==true then
		-- love.graphics.circle("fill",npx,npy,10)
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

	rendergui()
	
end

	
love.textinput = function(key)

	print(key)
	if boxfocus~=nil then
		boxfocus.addtext(boxfocus,key)
	end

end

npress=false
npx=nil
npy=nil	
	
	
love.mousepressed = function(x, y, button)
	print("mousepressed "..x.." "..y)
	npress=true
	npx=x/scrsx
	npy=y/scrsy
	print("mousepressed scaled "..npx.." "..npy)
	
	
end

love.mousemoved=function( x, y, dx, dy, istouch )
	if registerdrag~=nil then
			registerdrag.drag(registerdrag,dx/scrsx,dy/scrsy)
	end
end

love.mousereleased = function(x, y, button)

	if registerdrag~=nil then
		if registerdrag.dragrelease then
			registerdrag.dragrelease(registerdrag)
		end
	end
	
	registerdrag=nil
end

love.wheelmoved = function(x, y)
end



-- love.keypressed = function(key, code, isrepeat)
		-- -- if key == 'return'then -- binding enter key to input focus
	-- if boxfocus~=nil and ( key=='return' or key=='backspace' or key=='left' or key=='right' or key=='up' or key=='down'  ) then
		-- print(key)
		-- boxfocus.editkey(boxfocus,key)
	-- end
	
	-- if key=="f1" then
		-- renderdecos= not renderdecos
	-- end
	
	-- if key=="f2" then
		-- msg.postmsg(msg,"save")
		-- savegui()
	-- end
	
	-- if key=="f3" then
		-- msg.postmsg(msg,"load")
		-- loadgui()
	-- end
	
-- end



function love.update()

	--mouseclick
	if npress==true then
		print("propagating np")
		for i,w in ipairs (widgets)
		do
			ret=w.click(w,npx,npy)
			if ret==true then
				npress=false
				break
			end

		end
		
		
		print("np in void")
		npress=false
	end


end