x = 64
y = 64
sprite = 1
mode = 0
col = 0
cls()
sel_spr = 1
draw = {}
drawnum = 0
drawlen = 0

function _update()
	if mode == 0 then
		if (btnp(0) and x > 0) x -= 8
		if (btnp(1) and x < 120) x += 8
		if (btnp(2) and y > 0) y -= 8
		if (btnp(3) and y < 120) y += 8
		if (btnp(4)) mode = 1
		if (btnp(5)) sel_spr = sprite
		if (btnp(5)) draw[drawnum] = sel_spr
		if (btnp(5)) drawnum += 1
		if (btnp(5)) draw[drawnum] = x
		if (btnp(5)) drawnum += 1
		if (btnp(5)) draw[drawnum] = y
		if (btnp(5)) drawnum += 1
		if (btnp(5)) drawlen += 3		
	elseif mode == 1 then
		if (btnp(1)) sprite += 1
		if (btnp(0)) sprite -= 1
		if (btnp(4)) mode = 2
		if (btnp(5)) mode = 0
	elseif mode == 2 then
		if (btnp(2)) col += 1
		if (btnp(3)) col -= 1
		if (btnp(4)) mode = 3
		if (btnp(5)) mode = 1
	elseif mode == 3 then
		if (btnp(0) and x > 0) x -= 8
		if (btnp(1) and x < 120) x += 8
		if (btnp(2) and y > 0) y -= 8
		if (btnp(3) and y < 120) y += 8		
		if (btnp(4)) then
			if y == start_ranx and x == start_rany then
				sprite = 192
			elseif y == start_ranx and x == islandy then
			 sprite = 193
			elseif y == islandx and x == islandy then
			 sprite = 194
			elseif y == islandx and x == start_rany then
			 sprite = 195
			elseif y == start_ranx then
			 sprite = 201
			elseif x == islandy then
			 sprite = 202
			elseif y == islandx then
			 sprite = 203 
			elseif x == start_rany then
			 sprite = 204
		if (btnp(4)) sel_spr = sprite
		if (btnp(4)) draw[drawnum] = sel_spr
		if (btnp(4)) drawnum += 1
		if (btnp(4)) draw[drawnum] = x
		if (btnp(4)) drawnum += 1
		if (btnp(4)) draw[drawnum] = y
		if (btnp(4)) drawnum += 1
		if (btnp(4)) drawlen += 3	
		end	
	 end
		if (btnp(5)) mode = 2
	elseif mode == 4 then
		if (btnp(2)) spr(0, x, y)
		if (btnp(4)) mode = 5
	elseif mode == 5 then
	 if (btnp(2)) mode = mode
	 if (btnp(4)) mode = 0
end
end

islandx = flr(rnd(4))
islandx += 10
islandy = islandx + flr(rnd(3))
start_ranx = flr(rnd(3)) +1
start_rany = flr(rnd(3)) +1

i = 0
j = 0


function _draw()
	for i=0,16 do
		for j=0,16 do
			spr(213, i*8, j*8)
		end
	end
	i=0
	j=0
	for i=start_rany,islandy do
		for j=start_ranx,islandx do
			if j == start_ranx and i == start_rany then
				spr(192, i*8, j*8)
			elseif j == start_ranx and i == islandy then
			 spr(193, i*8, j*8)
			elseif j == islandx and i == islandy then
			 spr(194, i*8, j*8)
			elseif j == islandx and i == start_rany then
				spr(195, i*8, j*8)
			elseif j == start_ranx then
				spr(201, i*8, j*8)
			elseif i == islandy then
				spr(202, i*8, j*8)
			elseif j == islandx then
				spr(203, i*8, j*8) 
			elseif i == start_rany then
				spr(204, i*8, j*8)
			elseif i>start_rany then
				spr(200, i*8, j*8)
		end
		
	for i=0,(drawlen) do	
		spr(draw[3*i],draw[3*i+1],draw[3*i+2])
	end
		
	spr(0, x, y)
	spr(0, x-8, y)
	spr(sprite, x, y)
	spr(128+mode, x-8, y)
		
end
end
end
