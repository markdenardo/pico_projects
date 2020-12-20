pico-8 cartridge // http://www.pico-8.com
version 28
__lua__
alive_color = 7 
width = 128 
height = 128
prev_i = 1 
line_i = 2 
lines = {{}, {}}
cls()
-- draw an r pentomino 
pset(64,60,alive_color)
pset(65,60,alive_color) 
pset(63,61,alive_color) 
pset(64,61,alive_color) 
pset(64,62,alive_color)
function get(x,y) 
if((x<1)or(x>width)or(y<1)or(y>height))then
    return 0 
end
return pget(x,y) 
end
function getb(i,x) 
if((x<1)or(x>width))then
return 0 
end
return lines[i][x] 
end
while true do 
flip()
-- clear line buffer 
for x=1,width do 
lines[1][x] = 0
lines[2][x] = 0 
end
for y=1,height do
-- swap line buffers prev_i = line_i
line_i = (line_i % 2) + 1
-- copy current line to buffer 
for x=1,width do
lines[line_i][x] = pget(x,y) 
end

for x=1,width do 
    neighbors = (
        getb(prev_i,x-1) + 
        getb(prev_i,x) + 
        getb(prev_i,x+1) + 
        getb(line_i,x-1,y) + 
        getb(line_i,x+1,y) + 
        get(x-1,y+1) + 
        get(x,y+1) + 
        get(x+1,y+1))
if ((neighbors == alive_color * 3) or ((pget(x,y) == alive_color) and neighbors == alive_color * 2))
then pset(x,y,alive_color)
else pset(x,y,0)
end
end end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
