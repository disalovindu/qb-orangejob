Config = {}

Config = {
    ChanceToGetItem = 20, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {'orange','orange','orange','orange','orange'},
    Process = vector3(421.21, 6467.73, 28.81),
    Objects = {
        ['pickaxe'] = 'w_me_hatchet',
    },
    OrangePosition = {
        {coords = vector3(378.0, 6505.09, 27.95-0.97), heading = 359.88},
        {coords = vector3(378.13, 6517.0, 28.36-0.97), heading =  8.6},
        {coords = vector3(370.03, 6517.21, 28.37-0.97), heading = 354.03},
        {coords = vector3(370.22, 6505.38, 28.41-0.97), heading =  351.79},
        {coords = vector3(362.95, 6504.92, 28.53-0.97), heading =  351.79},
        {coords = vector3(362.61, 6516.88, 28.26-0.97), heading =  351.79}
    },
    
}

Config.textDel = 'Press (~g~[E]~w~) Pick Oranges. Press (~g~[Backspace]~w~) to quit Picking Orange. '

Strings = {
   
    ['someone_close'] = 'There is a player too close to you!',
    ['orange'] = 'Pick Orange',
    ['process'] = 'Juice Orange',
    ['sell_orangejuice'] = 'Sell Orange Juice',
}
