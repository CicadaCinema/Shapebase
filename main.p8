x = 64
y = 64
sprite = 1
mode = 0
col = 0
import(random)
cls()

function _update()
	if mode == 0 then
		if (btnp(0) and x > 0) x -= 8
		if (btnp(1) and x < 127) x += 8
		if (btnp(2) and y > 0) y -= 8
		if (btnp(3) and y < 127) y += 8
		if (btnp(4)) mode = 1
	elseif mode == 1 then
		if (btnp(2)) sprite += 1
		if (btnp(3)) sprite -= 1
		if (btnp(4)) mode = 2
	elseif mode == 2 then
		if (btnp(2)) col += 1
		if (btnp(3)) col -= 1
		if (btnp(4)) mode = 3
	elseif mode == 3 then
		if (btnp(2)) spr(sprite, x, y)
		if (btnp(4)) mode = 4
	elseif mode == 4 then
		if (btnp(2)) spr(0, x, y)
		if (btnp(4)) mode = 0
end
end

function _draw()
	spr(0, x, y)
	spr(0, x-8, y)
	spr(sprite, x, y)
	spr(20+mode, x-8, y)
end

islandx = flr(rnd(4))
islandx += 10
islandy = islandx + flr(rnd(3))
start_ranx = flr(rnd(3)) +1
start_rany = flr(rnd(3)) +1

i = 0
j = 0

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
end
end
