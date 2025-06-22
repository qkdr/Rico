local Pro = true -- We're open sourced now!

-- Create Variables for Roblox Services
local coreGui = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local statsService = game:GetService("Stats")
local starterGui = game:GetService("StarterGui")
local teleportService = game:GetService("TeleportService")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService('UserInputService')
local gameSettings = UserSettings():GetService("UserGameSettings")

-- Variables
local camera = workspace.CurrentCamera
local getMessage = replicatedStorage:WaitForChild("DefaultChatSystemChatEvents", 1) and replicatedStorage.DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 1)
local localPlayer = players.LocalPlayer
local notifications = {}
local friendsCooldown = 0
local mouse = localPlayer:GetMouse()
local promptedDisconnected = false
local smartBarOpen = false
local debounce = false
local searchingForPlayer = false
local musicQueue = {}
local currentAudio
local lowerName = localPlayer.Name:lower()
local lowerDisplayName = localPlayer.DisplayName:lower()
local placeId = game.PlaceId
local jobId = game.JobId
local checkingForKey = false
local originalTextValues = {}
local creatorId = game.CreatorId
local noclipDefaults = {}
local movers = {}
local creatorType = game.CreatorType
local espContainer = Instance.new("Folder", gethui and gethui() or coreGui)
local oldVolume = gameSettings.MasterVolume

-- Configurable Core Values
local siriusValues = {
	siriusVersion = "1.26",
	siriusName = "Sirius",
	releaseType = "Stable",
	siriusFolder = "Sirius",
	settingsFile = "settings.srs",
	interfaceAsset = 14183548964,
	cdn = "https://cdn.sirius.menu/SIRIUS-SCRIPT-CORE-ASSETS/",
	icons = "https://cdn.sirius.menu/SIRIUS-SCRIPT-CORE-ASSETS/Icons/",
	enableExperienceSync = false, -- Games are no longer available due to a lack of whitelisting, they may be made open source at a later date, however they are patched as of now and are useless to the end user. Turning this on may introduce "fake functionality".
	games = {
		BreakingPoint = {
			name = "Breaking Point",
			description = "Players are seated around a table. Their only goal? To be the last one standing. Execute this script to gain an unfair advantage.",
			id = 648362523,
			enabled = true,
			raw = "BreakingPoint",
			minimumTier = "Free",
		},
		MurderMystery2 = {
			name = "Murder Mystery 2",
			description = "A murder has occured, will you be the one to find the murderer, or kill your next victim? Execute this script to gain an unfair advantage.",
			id = 142823291,
			enabled = true,
			raw = "MurderMystery2",
			minimumTier = "Free",
		},
		TowerOfHell = {
			name = "Tower Of Hell",
			description = "A difficult popular parkouring game, with random levels and modifiers. Execute this script to gain an unfair advantage.",
			id = 1962086868,
			enabled = true,
			raw = "TowerOfHell",
			minimumTier = "Free",
		},
		Strucid = {
			name = "Strucid",
			description = "Fight friends and enemies in Strucid with building mechanics! Execute this script to gain an unfair advantage.",
			id = 2377868063,
			enabled = true,
			raw = "Strucid",
			minimumTier = "Free",
		},
		PhantomForces = {
			name = "Phantom Forces",
			description = "One of the most popular FPS shooters from the team at StyLiS Studios. Execute this script to gain an unfair advantage.",
			id = 292439477,
			enabled = true,
			raw = "PhantomForces",
			minimumTier = "Pro",
		},
	},
	rawTree = "https://raw.githubusercontent.com/SiriusSoftwareLtd/Sirius/Sirius/games/",
	neonModule = "https://raw.githubusercontent.com/shlexware/Sirius/request/library/neon.lua",
	senseRaw = "https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua",
	executors = {"synapse x", "script-ware", "krnl", "scriptware", "comet", "valyse", "fluxus", "electron", "hydrogen"},
	disconnectTypes = { {"ban", {"ban", "perm"}}, {"network", {"internet connection", "network"}} },
	nameGeneration = {
		adjectives = {"Cool", "Awesome", "Epic", "Ninja", "Super", "Mystic", "Swift", "Golden", "Diamond", "Silver", "Mint", "Roblox", "Amazing"},
		nouns = {"Player", "Gamer", "Master", "Legend", "Hero", "Ninja", "Wizard", "Champion", "Warrior", "Sorcerer"}
	},
	administratorRoles = {"mod","admin","staff","dev","founder","owner","supervis","manager","management","executive","president","chairman","chairwoman","chairperson","director"},
	transparencyProperties = {
		UIStroke = {'Transparency'},
		Frame = {'BackgroundTransparency'},
		TextButton = {'BackgroundTransparency', 'TextTransparency'},
		TextLabel = {'BackgroundTransparency', 'TextTransparency'},
		TextBox = {'BackgroundTransparency', 'TextTransparency'},
		ImageLabel = {'BackgroundTransparency', 'ImageTransparency'},
		ImageButton = {'BackgroundTransparency', 'ImageTransparency'},
		ScrollingFrame = {'BackgroundTransparency', 'ScrollBarImageTransparency'}
	},
	buttonPositions = {Character = UDim2.new(0.5, -155, 1, -29), Scripts = UDim2.new(0.5, -122, 1, -29), Playerlist = UDim2.new(0.5, -68, 1, -29)},
	chatSpy = {
		enabled = true,
		visual = {
			Color = Color3.fromRGB(26, 148, 255),
			Font = Enum.Font.SourceSansBold,
			TextSize = 18
		},
	},
	pingProfile = {
		recentPings = {},
		adaptiveBaselinePings = {},
		pingNotificationCooldown = 0,
		maxSamples = 12, -- max num of recent pings stored
		spikeThreshold = 1.75, -- high Ping in comparison to average ping (e.g 100 avg would be high at 150)
		adaptiveBaselineSamples = 30, -- how many samples Sirius takes before deciding on a fixed high ping value
		adaptiveHighPingThreshold = 120 -- default value
	},
	frameProfile = {
		frameNotificationCooldown = 0,
		fpsQueueSize = 10,
		lowFPSThreshold = 20, -- what's low fps!??!?!
		totalFPS = 0,
		fpsQueue = {},
	},
	actions = {
		{
			name = "Noclip",
			images = {14385986465, 9134787693},
			color = Color3.fromRGB(0, 170, 127),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function() end,
		},
		{
			name = "Flight",
			images = {9134755504, 14385992605},
			color = Color3.fromRGB(170, 37, 46),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function(value)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid.PlatformStand = value
				end
			end,
		},
		{
			name = "Refresh",
			images = {9134761478, 9134761478},
			color = Color3.fromRGB(61, 179, 98),
			enabled = false,
			rotateWhileEnabled = true,
			disableAfter = 3,
			callback = function()
				task.spawn(function()
					local character = localPlayer.Character
					if character then
						local cframe = character:GetPivot()
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						end
						character = localPlayer.CharacterAdded:Wait()
						task.defer(character.PivotTo, character, cframe)
					end
				end)
			end,
		},
		{
			name = "Respawn",
			images = {9134762943, 9134762943},
			color = Color3.fromRGB(49, 88, 193),
			enabled = false,
			rotateWhileEnabled = true,
			disableAfter = 2,
			callback = function()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid:ChangeState(Enum.HumanoidStateType.Dead)
				end
			end,
		},
		{
			name = "Invulnerability",
			images = {9134765994, 14386216487},
			color = Color3.fromRGB(193, 46, 90),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function() end,
		},
		{
			name = "Fling",
			images = {9134785384, 14386226155},
			color = Color3.fromRGB(184, 85, 61),
			enabled = false,
			rotateWhileEnabled = true,
			callback = function(value)
				local character = localPlayer.Character
				local primaryPart = character and character.PrimaryPart
				if primaryPart then
					for _, part in ipairs(character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.Massless = value
							part.CustomPhysicalProperties = PhysicalProperties.new(value and math.huge or 0.7, 0.3, 0.5)
						end
					end

					primaryPart.Anchored = true
					primaryPart.AssemblyLinearVelocity = Vector3.zero
					primaryPart.AssemblyAngularVelocity = Vector3.zero

					movers[3].Parent = value and primaryPart or nil

					task.delay(0.5, function() primaryPart.Anchored = false end)
				end
			end,
		},
		{
			name = "Extrasensory Perception",
			images = {9134780101, 14386232387},
			color = Color3.fromRGB(214, 182, 19),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function(value)
				for _, highlight in ipairs(espContainer:GetChildren()) do
					highlight.Enabled = value
				end
			end,
		},
		{
			name = "Night and Day",
			images = {9134778004, 10137794784},
			color = Color3.fromRGB(102, 75, 190),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function(value)
				tweenService:Create(lighting, TweenInfo.new(0.5), { ClockTime = value and 12 or 24 }):Play()
			end,
		},
		{
			name = "Global Audio",
			images = {9134774810, 14386246782},
			color = Color3.fromRGB(202, 103, 58),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function(value)
				if value then
					oldVolume = gameSettings.MasterVolume
					gameSettings.MasterVolume = 0
				else
					gameSettings.MasterVolume = oldVolume
				end
			end,
		},
		{
			name = "Visibility",
			images = {14386256326, 9134770786},
			color = Color3.fromRGB(62, 94, 170),
			enabled = false,
			rotateWhileEnabled = false,
			callback = function() end,
		},
	},
	sliders = {
		{
			name = "player speed",
			color = Color3.fromRGB(44, 153, 93),
			values = {0, 300},
			default = 16,
			value = 16,
			active = false,
			callback = function(value)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					humanoid.WalkSpeed = value
				end
			end,
		},
		{
			name = "jump power",
			color = Color3.fromRGB(59, 126, 184),
			values = {0, 350},
			default = 50,
			value = 16,
			active = false,
			callback = function(value)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if character then
					if humanoid.UseJumpPower then
						humanoid.JumpPower = value
					else
						humanoid.JumpHeight = value
					end
				end
			end,
		},
		{
			name = "flight speed",
			color = Color3.fromRGB(177, 45, 45),
			values = {1, 25},
			default = 3,
			value = 3,
			active = false,
			callback = function(value) end,
		},
		{
			name = "field of view",
			color = Color3.fromRGB(198, 178, 75),
			values = {45, 120},
			default = 70,
			value = 16,
			active = false,
			callback = function(value)
				tweenService:Create(camera, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { FieldOfView = value }):Play()
			end,
		},
	}
}

local siriusSettings = {
	{
		name = 'General',
		description = 'The general settings for Sirius, from simple to unique features.',
		color = Color3.new(0.117647, 0.490196, 0.72549),
		minimumLicense = 'Free',
		categorySettings = {
			{
				name = 'Anonymous Client',
				description = 'Randomise your username in real-time in any CoreGui parented interface, including Sirius. You will still appear as your actual name to others in-game. This setting can be performance intensive.',
				settingType = 'Boolean',
				current = false,

				id = 'anonmode'
			},
			{
				name = 'Chat Spy',
				description = 'This will only work on the legacy Roblox chat system. Sirius will display whispers usually hidden from you in the chat box.',
				settingType = 'Boolean',
				current = true,

				id = 'chatspy'
			},
			{
				name = 'Hide Toggle Button',
				description = 'This will remove the option to open the smartBar with the toggle button.',
				settingType = 'Boolean',
				current = false,

				id = 'hidetoggle'
			},
			{
				name = 'Now Playing Notifications',
				description = 'When active, Sirius will notify you when the next song in your Music queue plays.',
				settingType = 'Boolean',
				current = true,

				id = 'nowplaying'
			},
			{
				name = 'Friend Notifications',
				settingType = 'Boolean', 
				current = true,

				id = 'friendnotifs'
			},
			{
				name = 'Load Hidden',
				settingType = 'Boolean',
				current = false,

				id = 'loadhidden'
			}, 
			{
				name = 'Startup Sound Effect',
				settingType = 'Boolean',
				current = true,

				id = 'startupsound'
			}, 
			{
				name = 'Anti Idle',
				description = 'Remove all callbacks and events linked to the LocalPlayer Idled state. This may prompt detection from Adonis or similar anti-cheats.',
				settingType = 'Boolean',
				current = true,

				id = 'antiidle'
			},
			{
				name = 'Client-Based Anti Kick',
				description = 'Cancel any kick request involving you sent by the client. This may prompt detection from Adonis or similar anti-cheats. You will need to rejoin and re-run Sirius to toggle.',
				settingType = 'Boolean',
				current = false,

				id = 'antikick'
			},
			{
				name = 'Muffle audio while unfocused',
				settingType = 'Boolean', 
				current = true,

				id = 'muffleunfocused'
			},
		}
	},
	{
		name = 'Keybinds',
		description = 'Assign keybinds to actions or change keybinds such as the one to open/close Sirius.',
		color = Color3.new(0.0941176, 0.686275, 0.509804),
		minimumLicense = 'Free',
		categorySettings = {
			{
				name = 'Toggle smartBar',
				settingType = 'Key',
				current = "K",
				id = 'smartbar'
			},
			{
				name = 'Open ScriptSearch',
				settingType = 'Key',
				current = "T",
				id = 'scriptsearch'
			},
			{
				name = 'NoClip',
				settingType = 'Key',
				current = nil,
				id = 'noclip',
				callback = function()
					local noclip = siriusValues.actions[1]
					noclip.enabled = not noclip.enabled
					noclip.callback(noclip.enabled)
				end
			},
			{
				name = 'Flight',
				settingType = 'Key',
				current = nil,
				id = 'flight',
				callback = function()
					local flight = siriusValues.actions[2]
					flight.enabled = not flight.enabled
					flight.callback(flight.enabled)
				end
			},
			{
				name = 'Refresh',
				settingType = 'Key',
				current = nil,
				id = 'refresh',
				callback = function()
					local refresh = siriusValues.actions[3]
					if not refresh.enabled then
						refresh.enabled = true
						refresh.callback()
					end
				end
			},
			{
				name = 'Respawn',
				settingType = 'Key',
				current = nil,
				id = 'respawn',
				callback = function()
					local respawn = siriusValues.actions[4]
					if not respawn.enabled then
						respawn.enabled = true
						respawn.callback()
					end
				end
			},
			{
				name = 'Invulnerability',
				settingType = 'Key',
				current = nil,
				id = 'invulnerability',
				callback = function()
					local invulnerability = siriusValues.actions[5]
					invulnerability.enabled = not invulnerability.enabled
					invulnerability.callback(invulnerability.enabled)
				end
			},
			{
				name = 'Fling',
				settingType = 'Key',
				current = nil,
				id = 'fling',
				callback = function()
					local fling = siriusValues.actions[6]
					fling.enabled = not fling.enabled
					fling.callback(fling.enabled)
				end
			},
			{
				name = 'ESP',
				settingType = 'Key',
				current = nil,
				id = 'esp',
				callback = function()
					local esp = siriusValues.actions[7]
					esp.enabled = not esp.enabled
					esp.callback(esp.enabled)
				end
			},
			{
				name = 'Night and Day',
				settingType = 'Key',
				current = nil,
				id = 'nightandday',
				callback = function()
					local nightandday = siriusValues.actions[8]
					nightandday.enabled = not nightandday.enabled
					nightandday.callback(nightandday.enabled)
				end
			},
			{
				name = 'Global Audio',
				settingType = 'Key',
				current = nil,
				id = 'globalaudio',
				callback = function()
					local globalaudio = siriusValues.actions[9]
					globalaudio.enabled = not globalaudio.enabled
					globalaudio.callback(globalaudio.enabled)
				end
			},
			{
				name = 'Visibility',
				settingType = 'Key',
				current = nil,
				id = 'visibility',
				callback = function()
					local visibility = siriusValues.actions[10]
					visibility.enabled = not visibility.enabled
					visibility.callback(visibility.enabled)
				end
			},
		}
	},
	{
		name = 'Performance',
		description = 'Tweak and test your performance settings for Roblox in Sirius.',
		color = Color3.new(1, 0.376471, 0.168627),
		minimumLicense = 'Free',
		categorySettings = {
			{
				name = 'Artificial FPS Limit',
				description = 'Sirius will automatically set your FPS to this number when you are tabbed-in to Roblox.',
				settingType = 'Number',
				values = {20, 5000},
				current = 240,

				id = 'fpscap'
			},
			{
				name = 'Limit FPS while unfocused',
				description = 'Sirius will automatically set your FPS to 60 when you tab-out or unfocus from Roblox.',
				settingType = 'Boolean', -- number for the cap below!! with min and max val
				current = true,

				id = 'fpsunfocused'
			},
			{
				name = 'Adaptive Latency Warning',
				description = 'Sirius will check your average latency in the background and notify you if your current latency significantly goes above your average latency.',
				settingType = 'Boolean',
				current = true,

				id = 'latencynotif'
			},
			{
				name = 'Adaptive Performance Warning',
				description = 'Sirius will check your average FPS in the background and notify you if your current FPS goes below a specific number.',
				settingType = 'Boolean',
				current = true,

				id = 'fpsnotif'
			},
		}
	},
	{
		name = 'Detections',
		description = 'Sirius detects and prevents anything malicious or possibly harmful to your wellbeing.',
		color = Color3.new(0.705882, 0, 0),
		minimumLicense = 'Free',
		categorySettings = {
			{
				name = 'Spatial Shield',
				description = 'Suppress loud sounds played from any audio source in-game, in real-time with Spatial Shield.',
				settingType = 'Boolean',
				minimumLicense = 'Pro',
				current = true,

				id = 'spatialshield'
			},
			{
				name = 'Spatial Shield Threshold',
				description = 'How loud a sound needs to be to be suppressed.',
				settingType = 'Number',
				minimumLicense = 'Pro',
				values = {100, 1000},
				current = 300,

				id = 'spatialshieldthreshold'
			},
			{
				name = 'Moderator Detection',
				description = 'Be notified whenever Sirius detects a player joins your session that could be a game moderator.',
				settingType = 'Boolean', 
				minimumLicense = 'Pro',
				current = true,

				id = 'moddetection'
			},
			{
				name = 'Intelligent HTTP Interception',
				description = 'Block external HTTP/HTTPS requests from being sent/recieved and ask you before allowing it to run.',
				settingType = 'Boolean',
				minimumLicense = 'Essential',
				current = true,

				id = 'intflowintercept'
			},
			{
				name = 'Intelligent Clipboard Interception',
				description = 'Block your clipboard from being set and ask you before allowing it to set your clipboard.',
				settingType = 'Boolean',
				minimumLicense = 'Essential',
				current = true,

				id = 'intflowinterceptclip'
			},
		},
	},
	{
		name = 'Logging',
		description = 'Send logs to your specified webhook URL of things like player joins and leaves and messages.',
		color = Color3.new(0.905882, 0.780392, 0.0666667),
		minimumLicense = 'Free',
		categorySettings = {
			{
				name = 'Log Messages',
				description = 'Log messages sent by any player to your webhook.',
				settingType = 'Boolean',
				current = false,

				id = 'logmsg'
			},
			{
				name = 'Message Webhook URL',
				description = 'Discord Webhook URL',
				settingType = 'Input',
				current = 'No Webhook',

				id = 'logmsgurl'
			},
			{
				name = 'Log PlayerAdded and PlayerRemoving',
				description = 'Log whenever any player leaves or joins your session.',
				settingType = 'Boolean',
				current = false,

				id = 'logplrjoinleave'
			},
			{
				name = 'Player Added and Removing Webhook URL',
				description = 'Discord Webhook URL',
				settingType = 'Input',
				current = 'No Webhook',

				id = 'logplrjoinleaveurl'
			},
		}
	},
}

-- Generate random username
local randomAdjective = siriusValues.nameGeneration.adjectives[math.random(1, #siriusValues.nameGeneration.adjectives)]
local randomNoun = siriusValues.nameGeneration.nouns[math.random(1, #siriusValues.nameGeneration.nouns)]
local randomNumber = math.random(100, 3999) -- You can customize the range
local randomUsername = randomAdjective .. randomNoun .. randomNumber

-- Initialise Sirius Client Interface
local guiParent = gethui and gethui() or coreGui
local sirius = guiParent:FindFirstChild("Sirius")
if sirius then
	sirius:Destroy()
end

local UI = game:GetObjects('rbxassetid://'..siriusValues.interfaceAsset)[1]
UI.Name = siriusValues.siriusName
UI.Parent = guiParent
UI.Enabled = false
