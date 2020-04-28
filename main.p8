x = 60
y = 50
sprite = 0
mode = 0 

function _update()
if mode == 0 then
	if (btnp(0) and x > 0) x -= 8
	if (btnp(1) and x < 127) x += 8
	if (btnp(2) and y > 0) y -= 8
	if (btnp(3) and y < 127) y += 8
	if (btnp(4)) mode = 1
	end
if mode == 1 then
	if (btnp(2)) sprite += 1
	if (btnp(3)) sprite -= 1
	if (btnp(4)) mode = 0	
end
 
function _draw()
	cls()
 spr(sprite, x, y)
end