local games = {
    [15438487904] = "https://raw.githubusercontent.com/qkdr/Lord/refs/heads/main/Thronix1.lua"
}

local defaultScript = "https://raw.githubusercontent.com/qkdr/Thronix/main/Thronix.lua"

local scriptURL = games[game.PlaceId] or defaultScript

getgenv().uiSize = UDim2.fromOffset(580, 400)

loadstring(game:HttpGet(scriptURL))()
