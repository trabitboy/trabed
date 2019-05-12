		typosheet="8x8/font.png"
		
		--typo width height (pic size)
tw=32
th=32
--meaninful area in the middle (to trim empty space)
rtw=tw

	default = love.image.newImageData(tw,th)
	
	j=1
	-- i=1
	
	--pixels start at 0
	for j=0,th-1
	do
		for i=0,tw-1
		do
		default:setPixel(i,j,1,0,0,0.5)
		end
	end
	
	sheetdata=love.image.newImageData(typosheet)

function letterFromCoords(i,j)
		local dat=love.image.newImageData(tw,th)
		dat:paste(sheetdata,0,0,i*tw,j*th,tw,th)
		return love.graphics.newImage(dat)
end	
	
	
		typo={}
		-- adat=love.image.newImageData(tw,th)
		-- adat:paste(sheetdata,0,0,0,4*tw,tw,th)

		typo['!']=letterFromCoords(0,2)
		typo['"']=letterFromCoords(1,2)
		typo['#']=letterFromCoords(2,2)
		typo['$']=letterFromCoords(3,2)
		typo['%']=letterFromCoords(4,2)
		typo['&']=letterFromCoords(5,2)
		-- typo[''']=letterFromCoords(6,2)
		typo['(']=letterFromCoords(7,2)
		typo[')']=letterFromCoords(8,2)
		typo['*']=letterFromCoords(9,2)
		typo['+']=letterFromCoords(10,2)
		typo[',']=letterFromCoords(11,2)
		typo['-']=letterFromCoords(12,2)
		typo['.']=letterFromCoords(13,2)
		typo['/']=letterFromCoords(14,2)
		typo['0']=letterFromCoords(15,2)

		typo['1']=letterFromCoords(0,3)
		typo['2']=letterFromCoords(1,3)
		typo['3']=letterFromCoords(2,3)
		typo['4']=letterFromCoords(3,3)
		typo['5']=letterFromCoords(4,3)
		typo['6']=letterFromCoords(5,3)
		typo['7']=letterFromCoords(6,3)
		typo['8']=letterFromCoords(7,3)
		typo['9']=letterFromCoords(8,3)
		
		
		
		typo['A']=letterFromCoords(0,4)
		typo['B']=letterFromCoords(1,4)
		typo['C']=letterFromCoords(2,4)
		typo['D']=letterFromCoords(3,4)
		typo['E']=letterFromCoords(4,4)
		typo['F']=letterFromCoords(5,4)
		typo['G']=letterFromCoords(6,4)
		typo['H']=letterFromCoords(7,4)
		typo['I']=letterFromCoords(8,4)
		typo['J']=letterFromCoords(9,4)
		typo['K']=letterFromCoords(10,4)
		typo['L']=letterFromCoords(11,4)
		typo['M']=letterFromCoords(12,4)
		typo['N']=letterFromCoords(13,4)
		typo['O']=letterFromCoords(14,4)
		typo['P']=letterFromCoords(15,4)
		
		
		
		typo['Q']=letterFromCoords(0,5)
		typo['R']=letterFromCoords(1,5)
		typo['S']=letterFromCoords(2,5)
		typo['T']=letterFromCoords(3,5)
		typo['U']=letterFromCoords(4,5)
		typo['V']=letterFromCoords(5,5)
		typo['W']=letterFromCoords(6,5)
		typo['X']=letterFromCoords(7,5)
		typo['Y']=letterFromCoords(8,5)
		typo['Z']=letterFromCoords(9,5)

		typo['a']=letterFromCoords(1,6)
		typo['b']=letterFromCoords(2,6)
		typo['c']=letterFromCoords(3,6)
		typo['d']=letterFromCoords(4,6)
		typo['e']=letterFromCoords(5,6)
		typo['f']=letterFromCoords(6,6)
		typo['g']=letterFromCoords(7,6)
		typo['h']=letterFromCoords(8,6)
		typo['i']=letterFromCoords(9,6)
		typo['j']=letterFromCoords(10,6)
		typo['k']=letterFromCoords(11,6)
		typo['l']=letterFromCoords(12,6)
		typo['m']=letterFromCoords(13,6)
		typo['n']=letterFromCoords(14,6)
		typo['o']=letterFromCoords(15,6)

		typo['p']=letterFromCoords(0,7)
		typo['q']=letterFromCoords(1,7)
		typo['r']=letterFromCoords(2,7)
		typo['s']=letterFromCoords(3,7)
		typo['t']=letterFromCoords(4,7)
		typo['u']=letterFromCoords(5,7)
		typo['v']=letterFromCoords(6,7)
		typo['w']=letterFromCoords(7,7)
		typo['x']=letterFromCoords(8,7)
		typo['y']=letterFromCoords(9,7)
		typo['z']=letterFromCoords(10,7)

		
		-- typo['B']=loadfilter(typofolder.."/B.png")
		-- typo['C']=loadfilter(typofolder.."/C.png")
		-- typo['D']=loadfilter(typofolder.."/D.png")
		-- typo['E']=loadfilter(typofolder.."/E.png")
		-- typo['F']=loadfilter(typofolder.."/F.png")
		-- typo['G']=loadfilter(typofolder.."/G.png")
		-- typo['H']=loadfilter(typofolder.."/H.png")
		-- typo['I']=loadfilter(typofolder.."/I.png")
		-- typo['J']=loadfilter(typofolder.."/J.png")
		-- typo['K']=loadfilter(typofolder.."/K.png")
		-- typo['L']=loadfilter(typofolder.."/L.png")
		-- typo['M']=loadfilter(typofolder.."/M.png")
		-- typo['N']=loadfilter(typofolder.."/N.png")
		-- typo['O']=loadfilter(typofolder.."/O.png")
		-- typo['P']=loadfilter(typofolder.."/P.png")
		-- typo['Q']=loadfilter(typofolder.."/Q.png")
		-- typo['R']=loadfilter(typofolder.."/R.png")
		-- typo['S']=loadfilter(typofolder.."/S.png")
		-- typo['T']=loadfilter(typofolder.."/T.png")
		-- typo['U']=loadfilter(typofolder.."/U.png")
		-- typo['V']=loadfilter(typofolder.."/V.png")
		-- typo['W']=loadfilter(typofolder.."/W.png")
		-- typo['X']=loadfilter(typofolder.."/X.png")
		-- typo['Y']=loadfilter(typofolder.."/Y.png")
		-- typo['Z']=loadfilter(typofolder.."/Z.png")
		-- zdat=love.image.newImageData(tw,th)
		-- zdat:paste(sheetdata,0,0,5*tw,9*th,tw,th)

		typo['Z']=letterFromCoords(9,5)


		typo['unknown']=love.graphics.newImage(default)
