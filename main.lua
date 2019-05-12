--NEXT execute buffer from prg
--     reauires works only once
--     do file does not find things in love save folder
--	CURRENT   love.filesystem.getInfo() was used in fireman but strangely doesnt work anymore?

--lua coding editor, for fun, to run its code in love 2d
--TODO resize canvas to fit non 4/3 aspect ratios

cvsw=640
cvsh=480

ww=800
wh=600

love.window.setMode(ww,wh,{resizable=true})

scrsx=ww/cvsw
scrsy=wh/cvsh
  
 love.window.setTitle("trabed")
 --r to tex
 mylt=love.graphics.newCanvas(cvsw,cvsh)

 function love.resize( nw, nh )
	local npw,nph=love.window.toPixels( nw, nh )
	ww=npw
	wh=nph
	local pscrsx=ww/cvsw
	local pscrsy=wh/cvsh
	if pscrsx>pscrsy then
		scrsy=pscrsy
		scrsx=pscrsy
	else
		scrsy=pscrsx
		scrsx=pscrsx
	
	end
end


 
 
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
require('typosheet')
local inspect = require('inspect')

widgets={}
wcount=0

renderdecos=true

function love.load()
	local default= createtbox(50,50,100,100)
	table.insert(widgets,default)
	boxfocus=default

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
	
	if key=="f3" then
		-- msg.postmsg(msg,"save")
		-- dofile('buffer')
		-- require("buffer")
		appdata = love.filesystem.getAppdataDirectory( )		
		print("app data dir: "..appdata)
		userdata = love.filesystem.getUserDirectory( )		
		print("user data dir: "..userdata)
		identity = love.filesystem.getIdentity( )		
		print("identity: "..identity)
		sd = love.filesystem.getSaveDirectory()		
		print("save dir: "..sd)
		sditms=love.filesystem.getDirectoryItems(sd)
		print("sd items "..inspect(sditms))


		ditms=love.filesystem.getDirectoryItems('.')
		print("d items "..inspect(ditms))

		testbuffer=sd..'/buffer.lua'
		print("tst buf : "..testbuffer)
		info= love.filesystem.getInfo(testbuffer)
		print("info: "..info)
		if info~=nil then
		  print("buffer.lua exists")
		  code=love.filesystem.load(testbuffer)
		  code()
		else
		  print("buffer.lua does not exist")
		end
		
		
		
	end
	
	if key=="escape" then 
		love.event.quit()
	
	end
	
	-- if key=="f3" then
		-- msg.postmsg(msg,"load")
		-- loadgui()
	-- end
	
end


function rendergui()	


	y=20
	for i,s in ipairs (buffer)
	do
		love.graphics.print(s,0,y)
		y=y+20
	end


	for i,w in ipairs( widgets)
	do
		w.render(w)
	
	end
	
	-- love.graphics.print("toto",100,100)
	
	--for debug,last click
	-- if npx~=nil and renderdecos==true then
		-- love.graphics.circle("fill",npx,npy,10)
	-- end	

	--debug typo
	love.graphics.draw(typo["A"],0,0)
	love.graphics.draw(typo["Z"],32,0)
	
	
end



function rendertocanvas()
		love.graphics.setCanvas(mylt)
		love.graphics.clear(1.0,1.0,1.0,0.0)
		rendergui()
		love.graphics.setCanvas()
end	


function love.draw()
	
	
	-- y=20
	-- for i,s in ipairs (buffer)
	-- do
		-- love.graphics.print(s,0,y)
		-- y=y+20
	-- end

	-- rendergui()
	 rendertocanvas()
	love.graphics.setColor(0.0,0.0,0.0,1.0)
	love.graphics.clear()
	love.graphics.setColor(1.0,1.0,1.0,1.0)
	love.graphics.draw(mylt,0,0,0,scrsx,scrsy)

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