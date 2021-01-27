pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _update()
 
end

function _draw()
	cls() 
		
	rx = rnd(128)
	ry = rnd(128)
	
	hero = {}
	hero.x = rx
	hero.y = ry
	hero.sprite = 0
	
	spr(hero.sprite, hero.x, hero.y)
	print(hero)
	print("hero position")
	print(hero.x)

 if btn(0) then 
  sfx(03)
  hero.sprite = 1
  spr(hero.sprite, hero.x, hero.y) 
 end
 
 if btn(1) then 
  sfx(01) 
  hero.sprite = 2
  spr(hero.sprite, hero.x, hero.y)
 end
 
 if btn(2) then 
  sfx(00) 
  hero.sprite = 3
  spr(hero.sprite, hero.x, hero.y)
 end

end
__gfx__
66660000089aa88000b000000caa00e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
600660608aa0aa900abb6000ceeaa0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
607666660888aaa00ccbbbcbceee0ee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666666600088aaa00cccbbcbceeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666000aaaa98bcbbaba00eeaeaee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6670666009aa9a9800cb0bbbaaeaeaee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
060066600aaaa9990bbccc000aa0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0060660000089999bba00000000cce00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100002605022070230702a060220601a0601105032050130400c030080200502003020010100001001000000000e00007000080000b0000f000090000b0000a00006000050000a50029500000000000000000
0001000015910235502b51032520195301d5501e5501e5501d550195500f5500b5500f550115501355014550175501452019520205100991015950189500a9000694002910079100e95014950059501405000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000290503a030100000900002000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000000000000000000000000000000000
__music__
01 0000003f
