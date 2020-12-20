pico-8 cartridge // http://www.pico-8.com
version 28
__lua__

-- conway's game of life --
grid1 = {}
grid2 = {}
currentgrid = {}
nextgrid = {}
isgrid1 = true
gridy = 75
gridx = 75


function _init()
    for i = 1, gridy do
        grid1[i] = {}
        grid2[i] = {}
        
        for j = 1, gridx do
            local randomstart = flr(rnd(2))
            grid1[i][j] = randomstart
            grid2[i][j] = 0
        end
    end
    currentgrid = grid1
    nextgrid = grid2
end

function getnumneighbors(x, y)
    local result = 0
    local minx
    local miny
    local maxx
    local maxy
    if (x-1 < 1) then
        minx = gridx
        maxx = x+1
    elseif (x+1 > gridx) then
        minx = x-1
        maxx = 1
    else
        minx = x-1
        maxx = x+1
    end
    if (y-1 < 1) then
        miny = gridy
        maxy = y+1
    elseif (y+1 > gridy) then
        miny = y-1
        maxy = 1
    else
        miny = y-1
        maxy = y+1
    end

    -- top left
    result = result + currentgrid[miny][minx]
    -- top middle
    result = result + currentgrid[miny][x]
    -- top right
    result = result + currentgrid[miny][maxx]
    -- left
    result = result + currentgrid[y][minx]
    -- right
    result = result + currentgrid[y][maxx]
    -- bottom left
    result = result + currentgrid[maxy][minx]
    -- bottom middle
    result = result + currentgrid[maxy][x]
    -- bottom right
    result = result + currentgrid[maxy][maxx]
    return result
end 

function _update()
    if (isgrid1) then
        currentgrid = grid1
        nextgrid = grid2
    else
        currentgrid = grid2
        nextgrid = grid1
    end
    
    for i = 1, gridy do
        for j = 1, gridx do
            local numneighbors = getnumneighbors(j, i)
            -- currently live--
            if (currentgrid[i][j] == 1) then
                -- under population --
                if (numneighbors < 2) then
                    nextgrid[i][j] = 0

                -- live on --
                elseif (numneighbors == 2 or numneighbors == 3) then
                    nextgrid[i][j] = 1

                -- overpopulation --
                elseif (numneighbors > 3) then
                    nextgrid[i][j] = 0
                end

            -- currently dead --
            else
                -- reproduction --
                if (numneighbors == 3) then
                    if (i == 5 and j == 5) then
                    end
                    nextgrid[i][j] = 1

                -- stays dead --
                else
                    nextgrid[i][j] = 0
                end
            end
        end
    end
        
    isgrid1 = not isgrid1
end

function _draw()
    rectfill(0, 0, 127, 127, 7)
    for i = 1, gridy do
        for j = 1, gridx do
            if currentgrid[i][j] == 1 then
                rectfill((127-gridx)/2+j, (127-gridy)/2+i, (127-gridx)/2+j, (127-gridy)/2+i, 0)
            end
        end
    end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
