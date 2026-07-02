-- ts file was generated at discord.gg/25ms

local v1, v2, v3 = pairs(game.CoreGui:GetChildren())

while true do
    local v4

    v3, v4 = v1(v2, v3)

    if v3 == nil then
        break
    end
    if v4.Name == 'AtomicUi' or v4.Name == 'Abyss' or (v4.Name == 'FlyGui' or v4.Name == 'OpenButton') then
        v4:Destroy()
    end
end

local function u59(p5)
    local v6 = {p5}
    local _Players = game:GetService('Players')
    local _LocalPlayer = _Players.LocalPlayer
    local u9 = false

    local function v17(p10)
        local v11 = p10:lower()

        if v11 == 'all' or v11 == 'others' then
            u9 = true

            return
        elseif v11 == 'random' then
            local v12 = _Players:GetPlayers()

            if table.find(v12, _LocalPlayer) then
                table.remove(v12, table.find(v12, _LocalPlayer))
            end

            return v12[math.random(#v12)]
        elseif v11 ~= 'random' and v11 ~= 'all' and v11 ~= 'others' then
            local v13 = next
            local v14, v15 = _Players:GetPlayers()

            while true do
                local v16

                v15, v16 = v13(v14, v15)

                if v15 == nil then
                    break
                end
                if v16 ~= _LocalPlayer then
                    if v16.Name:lower():match('^' .. v11) then
                        return v16
                    end
                    if v16.DisplayName:lower():match('^' .. v11) then
                        return v16
                    end
                end
            end
        end
    end
    local function v43(p18)
        local _Character = _LocalPlayer.Character
        local u20

        if _Character then
            u20 = _Character:FindFirstChildOfClass('Humanoid')
        else
            u20 = _Character
        end

        local u21

        if u20 then
            u21 = u20.RootPart
        else
            u21 = u20
        end

        local _Character2 = p18.Character
        local u23 = nil
        local v24 = nil
        local v25 = nil
        local v26 = nil
        local u27

        if _Character2:FindFirstChildOfClass('Humanoid') then
            u27 = _Character2:FindFirstChildOfClass('Humanoid')
        else
            u27 = nil
        end
        if u27 and u27.RootPart then
            u23 = u27.RootPart
        end
        if _Character2:FindFirstChild('Head') then
            v24 = _Character2.Head
        end
        if _Character2:FindFirstChildOfClass('Accessory') then
            v25 = _Character2:FindFirstChildOfClass('Accessory')
        end
        if Accessoy and v25:FindFirstChild('Handle') then
            v26 = v25.Handle
        end
        if _Character and u20 and u21 then
            if u21.Velocity.Magnitude < 50 then
                getgenv().OldPos = u21.CFrame
            end
            if u27 and u27.Sit and not u9 then
                return
            else
                if v24 then
                    workspace.CurrentCamera.CameraSubject = v24
                elseif v24 or not v26 then
                    if u27 and u23 then
                        workspace.CurrentCamera.CameraSubject = u27
                    end
                else
                    workspace.CurrentCamera.CameraSubject = v26
                end
                if _Character2:FindFirstChildWhichIsA('BasePart') then
                    local function u31(p28, p29, p30)
                        u21.CFrame = CFrame.new(p28.Position) * p29 * p30

                        _Character:SetPrimaryPartCFrame(CFrame.new(p28.Position) * p29 * p30)

                        u21.Velocity = Vector3.new(90000000, 900000000, 90000000)
                        u21.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                    end
                    local function v36(p32)
                        local v33 = tick()
                        local v34 = 2
                        local v35 = 0

                        while u21 and u27 do
                            if p32.Velocity.Magnitude >= 50 then
                                u31(p32, CFrame.new(0, 1.5, u27.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, -u27.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u27.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u23.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, -u23.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u23.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            else
                                v35 = v35 + 100

                                u31(p32, CFrame.new(0, 1.5, 0) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(2.25, 1.5, -2.25) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(-2.25, -1.5, 2.25) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, 0) + u27.MoveDirection, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0) + u27.MoveDirection, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                            end
                            if p32.Velocity.Magnitude > 500 or p32.Parent ~= p18.Character or (p18.Parent ~= _Players or not p18.Character == _Character2) or (u27.Sit or u20.Health <= 0 or tick() > v33 + v34) then
                                break
                            end
                        end
                    end

                    workspace.FallenPartsDestroyHeight = 0 / 0

                    local _BodyVelocity = Instance.new('BodyVelocity')

                    _BodyVelocity.Name = 'EpixVel'
                    _BodyVelocity.Parent = u21
                    _BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
                    _BodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

                    u20:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if u23 and v24 then
                        if (u23.CFrame.p - v24.CFrame.p).Magnitude <= 5 then
                            v36(u23)
                        else
                            v36(v24)
                        end
                    elseif u23 and not v24 then
                        v36(u23)
                    elseif u23 or not v24 then
                        if u23 or v24 or not (v25 and v26) then
                            return
                        end

                        v36(v26)
                    else
                        v36(v24)
                    end

                    _BodyVelocity:Destroy()
                    u20:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

                    workspace.CurrentCamera.CameraSubject = u20

                    repeat
                        u21.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

                        local v38 = _Character

                        _Character.SetPrimaryPartCFrame(v38, getgenv().OldPos * CFrame.new(0, 0.5, 0))

                        local v39 = u20

                        u20.ChangeState(v39, 'GettingUp')

                        local v40 = _Character

                        table.foreach(_Character.GetChildren(v40), function(_, p41)
                            if p41:IsA('BasePart') then
                                local v42 = Vector3.new()

                                p41.RotVelocity = Vector3.new()
                                p41.Velocity = v42
                            end
                        end)
                        task.wait()
                    until (u21.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end
        else
            return
        end
    end

    getgenv().Welcome = true

    if v6[1] then
        local v44 = next
        local v45 = _LocalPlayer
        local v46 = v6
        local v47 = _Players
        local v48 = u9
        local v49 = nil

        while true do
            local v50

            v49, v50 = v44(v6, v49)

            if v49 == nil then
                break
            end

            v17(v50)
        end

        if v48 then
            local v51 = next
            local v52, v53 = v47:GetPlayers()

            while true do
                local v54

                v53, v54 = v51(v52, v53)

                if v53 == nil then
                    break
                end

                v43(v54)
            end
        end

        local v55 = next
        local v56 = nil

        while true do
            local v57

            v56, v57 = v55(v46, v56)

            if v56 == nil then
                break
            end
            if v17(v57) and v17(v57) ~= v45 then
                local v58 = v17(v57)

                if v58 then
                    v43(v58)
                end
            end
        end
    end
end

if not (syn and syn.queue_on_teleport) and (not queue_on_teleport and fluxus) then
    local _ = fluxus.queue_on_teleport
end

local v60 = {}
local v61 = {}
local _LocalPlayer2 = game.Players.LocalPlayer
local _Character3 = game.Players.LocalPlayer.Character

if _Character3 then
    _Character3:FindFirstChildWhichIsA('Humanoid')
end

nowe = false
speeds = 1

local _ScreenGui = Instance.new('ScreenGui')
local _ImageButton = Instance.new('ImageButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Name = 'FlyGui'
_ScreenGui.Parent = game.CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_ImageButton.Parent = _ScreenGui
_ImageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
_ImageButton.BorderSizePixel = 0
_ImageButton.Position = UDim2.new(0.929370999, 0, 0.510522664, 0)
_ImageButton.Size = UDim2.new(0, 40, 0, 40)
_ImageButton.Image = 'rbxassetid://11419709766'
_ImageButton.Visible = false
_UICorner.Parent = _ImageButton

_ImageButton.MouseButton1Down:connect(function()
    if nowe ~= true then
        nowe = true
        _ImageButton.Image = 'rbxassetid://11419719540'

        for _ = 1, speeds do
            spawn(function()
                local _Heartbeat = game:GetService('RunService').Heartbeat

                tpwalking = true

                local _Character4 = game.Players.LocalPlayer.Character
                local v69

                if _Character4 then
                    v69 = _Character4:FindFirstChildWhichIsA('Humanoid')
                else
                    v69 = _Character4
                end

                while tpwalking and _Heartbeat:Wait() and (_Character4 and v69) and v69.Parent do
                    if v69.MoveDirection.Magnitude > 0 then
                        _Character4:TranslateBy(v69.MoveDirection)
                    end
                end
            end)
        end

        game.Players.LocalPlayer.Character.Animate.Disabled = true

        local _Character5 = game.Players.LocalPlayer.Character
        local v71 = _Character5:FindFirstChildOfClass('Humanoid') or _Character5:FindFirstChildOfClass('AnimationController')
        local v72 = next
        local v73, v74 = v71:GetPlayingAnimationTracks()

        while true do
            local v75

            v74, v75 = v72(v73, v74)

            if v74 == nil then
                break
            end

            v75:AdjustSpeed(0)
        end

        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
        _LocalPlayer2.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    else
        nowe = false
        _ImageButton.Image = 'rbxassetid://11419709766'

        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        _LocalPlayer2.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
    if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RigType ~= Enum.HumanoidRigType.R6 then
        local _LocalPlayer3 = game.Players.LocalPlayer
        local _UpperTorso = _LocalPlayer3.Character.UpperTorso
        local v78 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v79 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v80 = 50
        local v81 = 0
        local _BodyGyro = Instance.new('BodyGyro', _UpperTorso)

        _BodyGyro.P = 90000
        _BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        _BodyGyro.cframe = _UpperTorso.CFrame

        local _BodyVelocity2 = Instance.new('BodyVelocity', _UpperTorso)

        _BodyVelocity2.velocity = Vector3.new(0, 0.1, 0)
        _BodyVelocity2.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

        if nowe == true then
            _LocalPlayer3.Character.Humanoid.PlatformStand = true
        end

        while nowe == true or game:GetService('Players').LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 then
                v81 = v81 + 0.5 + v81 / v80

                if v80 < v81 then
                    v81 = v80
                end
            elseif v78.l + v78.r == 0 and v78.f + v78.b == 0 and v81 ~= 0 then
                local v84 = v81 - 1

                v81 = v84 < 0 and 0 or v84
            end
            if v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 then
                _BodyVelocity2.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v78.f + v78.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v78.l + v78.r, (v78.f + v78.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v81
                v79 = {
                    f = v78.f,
                    b = v78.b,
                    l = v78.l,
                    r = v78.r,
                }
            elseif v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 or v81 == 0 then
                _BodyVelocity2.velocity = Vector3.new(0, 0, 0)
            else
                _BodyVelocity2.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v79.f + v79.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v79.l + v79.r, (v79.f + v79.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v81
            end

            _BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((v78.f + v78.b) * 50 * v81 / v80), 0, 0)
        end

        _BodyGyro:Destroy()
        _BodyVelocity2:Destroy()

        _LocalPlayer3.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    else
        local _LocalPlayer4 = game.Players.LocalPlayer
        local _Torso = _LocalPlayer4.Character.Torso
        local v87 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v88 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v89 = 50
        local v90 = 0
        local _BodyGyro2 = Instance.new('BodyGyro', _Torso)

        _BodyGyro2.P = 90000
        _BodyGyro2.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        _BodyGyro2.cframe = _Torso.CFrame

        local _BodyVelocity3 = Instance.new('BodyVelocity', _Torso)

        _BodyVelocity3.velocity = Vector3.new(0, 0.1, 0)
        _BodyVelocity3.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

        if nowe == true then
            _LocalPlayer4.Character.Humanoid.PlatformStand = true
        end

        while nowe == true or game:GetService('Players').LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService('RunService').RenderStepped:Wait()

            if v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 then
                v90 = v90 + 0.5 + v90 / v89

                if v89 < v90 then
                    v90 = v89
                end
            elseif v87.l + v87.r == 0 and v87.f + v87.b == 0 and v90 ~= 0 then
                local v93 = v90 - 1

                v90 = v93 < 0 and 0 or v93
            end
            if v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 then
                _BodyVelocity3.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v87.f + v87.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v87.l + v87.r, (v87.f + v87.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v90
                v88 = {
                    f = v87.f,
                    b = v87.b,
                    l = v87.l,
                    r = v87.r,
                }
            elseif v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 or v90 == 0 then
                _BodyVelocity3.velocity = Vector3.new(0, 0, 0)
            else
                _BodyVelocity3.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v88.f + v88.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v88.l + v88.r, (v88.f + v88.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v90
            end

            _BodyGyro2.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((v87.f + v87.b) * 50 * v90 / v89), 0, 0)
        end

        _BodyGyro2:Destroy()
        _BodyVelocity3:Destroy()

        _LocalPlayer4.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

local _ScreenGui2 = Instance.new('ScreenGui')

_ScreenGui2.Name = 'Abyss'
_ScreenGui2.Parent = game.CoreGui
_ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function v60.Notify(_, p95, p96, p97)
    local _Frame = Instance.new('Frame')
    local _Frame2 = Instance.new('Frame')
    local _ImageLabel = Instance.new('ImageLabel')
    local _UICorner2 = Instance.new('UICorner')
    local _TextLabel = Instance.new('TextLabel')
    local _TextLabel2 = Instance.new('TextLabel')

    _Frame.Name = 'Notification'
    _Frame.Parent = _ScreenGui2
    _Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _Frame.BackgroundTransparency = 0.4
    _Frame.BorderSizePixel = 0
    _Frame.Position = UDim2.new(1, 5, 0, 75)
    _Frame.Size = UDim2.new(0, 450, 0, 60)
    _Frame2.Name = 'Line'
    _Frame2.Parent = _Frame
    _Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame2.BorderSizePixel = 0
    _Frame2.Position = UDim2.new(0, 0, 0.938461304, 0)
    _Frame2.Size = UDim2.new(0, 0, 0, 4)
    _ImageLabel.Name = 'Warning'
    _ImageLabel.Parent = _Frame
    _ImageLabel.BackgroundTransparency = 1
    _ImageLabel.Position = UDim2.new(0.0258302614, 0, 0.0897435844, 0)
    _ImageLabel.Size = UDim2.new(0, 44, 0, 49)
    _ImageLabel.Image = 'rbxassetid://3944668821'
    _ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel.ScaleType = Enum.ScaleType.Fit
    _UICorner2.CornerRadius = UDim.new(0, 20)
    _UICorner2.Parent = _ImageLabel
    _TextLabel.Name = 'Title'
    _TextLabel.Parent = _Frame
    _TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.Position = UDim2.new(0.161, 0, 0.155, 0)
    _TextLabel.Size = UDim2.new(0, 205, 0, 15)
    _TextLabel.Text = p95
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextSize = 12
    _TextLabel.TextStrokeTransparency = 2
    _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.Name = 'Description'
    _TextLabel2.Parent = _Frame
    _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.Position = UDim2.new(0.161, 0, 0.483, 0)
    _TextLabel2.Size = UDim2.new(0, 205, 0, 18)
    _TextLabel2.Text = p96
    _TextLabel2.TextColor3 = Color3.fromRGB(199, 199, 199)
    _TextLabel2.TextSize = 12
    _TextLabel2.TextStrokeTransparency = 2
    _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

    _Frame:TweenPosition(UDim2.new(1, -400, 0, 75), 'Out', 'Sine', 0.35)
    wait(0.35)
    _Frame2:TweenSize(UDim2.new(0, 450, 0, 4), 'Out', 'Linear', p97)
    wait(p97)
    _Frame:TweenPosition(UDim2.new(1, 5, 0, 75), 'Out', 'Sine', 0.35)
    wait(0.35)
    _Frame:Destroy()
end
function v61.Win(_, p104, _)
    local _ScreenGui3 = Instance.new('ScreenGui')
    local _Frame3 = Instance.new('Frame')
    local _UICorner3 = Instance.new('UICorner')
    local _UIStroke = Instance.new('UIStroke')
    local _ImageLabel2 = Instance.new('ImageLabel')
    local _ImageLabel3 = Instance.new('ImageLabel')
    local _Frame4 = Instance.new('Frame')
    local _UICorner4 = Instance.new('UICorner')
    local _UIStroke2 = Instance.new('UIStroke')
    local _ImageButton2 = Instance.new('ImageButton')
    local _TextLabel3 = Instance.new('TextLabel')
    local _Frame5 = Instance.new('Frame')
    local _UICorner5 = Instance.new('UICorner')
    local _UIStroke3 = Instance.new('UIStroke')
    local _Frame6 = Instance.new('Frame')
    local _UICorner6 = Instance.new('UICorner')
    local _UIStroke4 = Instance.new('UIStroke')
    local _ImageLabel4 = Instance.new('ImageLabel')
    local _ScrollingFrame = Instance.new('ScrollingFrame')
    local _UIListLayout = Instance.new('UIListLayout')
    local _Frame7 = Instance.new('Frame')

    _ScreenGui3.Name = 'AtomicUi'
    _ScreenGui3.Parent = game.CoreGui
    _ScreenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _Frame3.Parent = _ScreenGui3
    _Frame3.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    _Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame3.BorderSizePixel = 0
    _Frame3.Position = UDim2.new(0.263157904, 0, 0.298927605, 0)
    _Frame3.Size = UDim2.new(0, 440, 0, 300)
    _UICorner3.Name = 'FrameCorner'
    _UICorner3.Parent = _Frame3
    _UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    _UIStroke.Color = Color3.fromRGB(135, 135, 135)
    _UIStroke.Name = 'FrameStroke'
    _UIStroke.Parent = _Frame3
    _ImageLabel2.Name = 'FrameShadow2'
    _ImageLabel2.Parent = _Frame3
    _ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.BorderSizePixel = 0
    _ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel2.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel2.ZIndex = 0
    _ImageLabel2.Image = 'rbxassetid://6015897843'
    _ImageLabel2.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel2.ImageTransparency = 0.5
    _ImageLabel2.ScaleType = Enum.ScaleType.Slice
    _ImageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
    _Frame6.Name = 'Tabs'
    _Frame6.Parent = _Frame3
    _Frame6.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame6.BorderSizePixel = 0
    _Frame6.Position = UDim2.new(0.0181818176, 0, 0.163333327, 0)
    _Frame6.Size = UDim2.new(0, 116, 0, 238)
    _UICorner6.CornerRadius = UDim.new(0, 4)
    _UICorner6.Name = 'TabsCorner'
    _UICorner6.Parent = _Frame6
    _UIStroke4.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke4.Name = 'TabsStroke'
    _UIStroke4.Parent = _Frame6
    _ImageLabel4.Name = 'TabsShadow'
    _ImageLabel4.Parent = _Frame6
    _ImageLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel4.BackgroundTransparency = 1
    _ImageLabel4.BorderSizePixel = 0
    _ImageLabel4.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel4.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel4.ZIndex = 0
    _ImageLabel4.Image = 'rbxassetid://6014261993'
    _ImageLabel4.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel4.ImageTransparency = 0.5
    _ImageLabel4.ScaleType = Enum.ScaleType.Slice
    _ImageLabel4.SliceCenter = Rect.new(49, 49, 450, 450)
    _ScrollingFrame.Name = 'TabsScrolling'
    _ScrollingFrame.Parent = _Frame6
    _ScrollingFrame.Active = true
    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame.BackgroundTransparency = 2
    _ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ScrollingFrame.BorderSizePixel = 0
    _ScrollingFrame.Size = UDim2.new(0, 116, 0, 238)
    _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    _ScrollingFrame.ScrollBarThickness = 4
    _UIListLayout.Name = 'TabsListLayout'
    _UIListLayout.Parent = _ScrollingFrame
    _UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    _UIListLayout.Padding = UDim.new(0, 5)
    _Frame7.Name = 'TabsFixFrame'
    _Frame7.Parent = _ScrollingFrame
    _Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame7.BackgroundTransparency = 2
    _Frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame7.BorderSizePixel = 0
    _Frame7.Position = UDim2.new(0.068965517, 0, 0, 0)
    _Frame7.Size = UDim2.new(0, 100, 0, 6)
    _ImageLabel3.Name = 'PagesShadow'
    _ImageLabel3.Parent = _Frame5
    _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel3.BackgroundTransparency = 1
    _ImageLabel3.BorderSizePixel = 0
    _ImageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel3.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel3.ZIndex = 0
    _ImageLabel3.Image = 'rbxassetid://6014261993'
    _ImageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel3.ImageTransparency = 0.5
    _ImageLabel3.ScaleType = Enum.ScaleType.Slice
    _ImageLabel3.SliceCenter = Rect.new(49, 49, 450, 450)
    _Frame4.Name = 'Line'
    _Frame4.Parent = _Frame3
    _Frame4.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame4.BorderSizePixel = 0
    _Frame4.Size = UDim2.new(0, 440, 0, 34)
    _UICorner4.CornerRadius = UDim.new(0, 4)
    _UICorner4.Name = 'LineCorner'
    _UICorner4.Parent = _Frame4
    _UIStroke2.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke2.Name = 'LineStroke'
    _UIStroke2.Parent = _Frame4

    local _ScreenGui4 = Instance.new('ScreenGui')
    local _ImageButton3 = Instance.new('ImageButton')
    local _UICorner7 = Instance.new('UICorner')

    _ScreenGui4.Name = 'OpenButton'
    _ScreenGui4.Parent = game.CoreGui
    _ScreenGui4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _ImageButton3.Name = 'OpenButtonImage'
    _ImageButton3.Parent = _ScreenGui4
    _ImageButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton3.BackgroundTransparency = 0.65
    _ImageButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton3.BorderSizePixel = 0
    _ImageButton3.Position = UDim2.new(0.102097899, 0, 0.0742971897, 0)
    _ImageButton3.Size = UDim2.new(0, 45, 0, 45)
    _ImageButton3.Image = 'rbxassetid://11963368259'
    _ImageButton3.Draggable = true
    _ImageButton3.Selectable = true
    _ImageButton3.Active = true
    _UICorner7.CornerRadius = UDim.new(0, 50)
    _UICorner7.Name = 'OpenButtonCorner'
    _UICorner7.Parent = _ImageButton3

    _ImageButton3.MouseButton1Down:Connect(function()
        _Frame3.Visible = not _Frame3.Visible
    end)

    _ImageButton2.Name = 'CloseButton'
    _ImageButton2.Parent = _Frame4
    _ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageButton2.BackgroundTransparency = 2
    _ImageButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton2.BorderSizePixel = 0
    _ImageButton2.Position = UDim2.new(0.936363637, 0, 0.235294119, 0)
    _ImageButton2.Size = UDim2.new(0, 17, 0, 17)
    _ImageButton2.Image = 'rbxassetid://11293981586'

    _ImageButton2.MouseButton1Down:Connect(function()
        _Frame3.Visible = not _Frame3.Visible
    end)
    _ImageButton2.MouseEnter:Connect(function()
        game:GetService('TweenService'):Create(_ImageButton2, TweenInfo.new(0.25), {
            ImageColor3 = Color3.fromRGB(120, 0, 0),
        }):Play()
    end)
    _ImageButton2.MouseLeave:Connect(function()
        game:GetService('TweenService'):Create(_ImageButton2, TweenInfo.new(0.25), {
            ImageColor3 = Color3.fromRGB(255, 255, 255),
        }):Play()
    end)

    _TextLabel3.Name = 'Text'
    _TextLabel3.Parent = _Frame4
    _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.BackgroundTransparency = 2
    _TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _TextLabel3.BorderSizePixel = 0
    _TextLabel3.Position = UDim2.new(0.0181818176, 0, 0, 0)
    _TextLabel3.Size = UDim2.new(0, 366, 0, 34)
    _TextLabel3.Font = Enum.Font.RobotoCondensed
    _TextLabel3.Text = p104
    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.TextSize = 19
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    _Frame5.Name = 'Pages'
    _Frame5.Parent = _Frame3
    _Frame5.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame5.BorderSizePixel = 0
    _Frame5.Position = UDim2.new(0.302272737, 0, 0.163333327, 0)
    _Frame5.Size = UDim2.new(0, 296, 0, 238)
    _UICorner5.CornerRadius = UDim.new(0, 4)
    _UICorner5.Name = 'PagesCorner'
    _UICorner5.Parent = _Frame5
    _UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    _UIStroke3.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke3.Name = 'PagesStroke'
    _UIStroke3.Parent = _Frame5;

    (function()
        local _LocalScript = Instance.new('LocalScript', _Frame3)
        local _UserInputService = game:GetService('UserInputService')

        function dragify(p131)
            dragToggle = nil
            dragInput = nil
            dragStart = nil

            function updateInput(p132)
                local v133 = p132.Position - dragStart
                local v134 = UDim2.new(startPos.X.Scale, startPos.X.Offset + v133.X, startPos.Y.Scale, startPos.Y.Offset + v133.Y)

                game:GetService('TweenService'):Create(p131, TweenInfo.new(0.25), {Position = v134}):Play()
                game:GetService('TweenService'):Create(_UIStroke, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(255, 255, 255),
                }):Play()
                game:GetService('TweenService'):Create(_UIStroke2, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(155, 155, 155),
                }):Play()
            end

            p131.InputBegan:Connect(function(p135)
                if (p135.UserInputType == Enum.UserInputType.MouseButton1 or p135.UserInputType == Enum.UserInputType.Touch) and _UserInputService:GetFocusedTextBox() == nil then
                    dragToggle = true
                    dragStart = p135.Position
                    startPos = p131.Position

                    p135.Changed:Connect(function()
                        if p135.UserInputState == Enum.UserInputState.End then
                            dragToggle = false

                            game:GetService('TweenService'):Create(_UIStroke, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(135, 135, 135),
                            }):Play()
                            game:GetService('TweenService'):Create(_UIStroke2, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(74, 74, 74),
                            }):Play()
                        end
                    end)
                end
            end)
            p131.InputChanged:Connect(function(p136)
                if p136.UserInputType == Enum.UserInputType.MouseMovement or p136.UserInputType == Enum.UserInputType.Touch then
                    dragInput = p136
                end
            end)
            game:GetService('UserInputService').InputChanged:Connect(function(p137)
                if p137 == dragInput and dragToggle then
                    updateInput(p137)
                end
            end)
        end

        dragify(_LocalScript.Parent)
    end)()

    local _UserInputService2 = game:GetService('UserInputService')
    local _V = Enum.KeyCode.V
    local u140 = false

    function onKeyPress(p141, p142)
        pcall(function()
            if not p142 and p141.KeyCode == _V then
                if u140 ~= false then
                    if u140 == true then
                        _Frame3.Visible = true
                        u140 = false
                    end
                else
                    _Frame3.Visible = false
                    u140 = true
                end
            end
        end)
    end

    _UserInputService2.InputBegan:connect(onKeyPress)

    return {
        Tab = function(_, p143, p144)
            local _TextButton = Instance.new('TextButton')
            local _UICorner8 = Instance.new('UICorner')
            local _UIStroke5 = Instance.new('UIStroke')
            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
            local _UIListLayout2 = Instance.new('UIListLayout')
            local _Frame8 = Instance.new('Frame')

            _TextButton.Name = 'TabButton'
            _TextButton.Parent = _ScrollingFrame
            _TextButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            _TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _TextButton.BorderSizePixel = 0
            _TextButton.Position = UDim2.new(0.116379313, 0, 0.0420168079, 0)
            _TextButton.Size = UDim2.new(0, 89, 0, 23)
            _TextButton.AutoButtonColor = false
            _TextButton.Text = p143
            _TextButton.Font = Enum.Font.RobotoCondensed
            _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextButton.TextSize = 14
            _UICorner8.CornerRadius = UDim.new(0, 4)
            _UICorner8.Parent = _TextButton
            _UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            _UIStroke5.Color = Color3.fromRGB(62, 62, 62)
            _UIStroke5.Parent = _TextButton
            _Frame8.Name = 'Page'
            _Frame8.Parent = _Frame5
            _Frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame8.BackgroundTransparency = 2
            _Frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame8.BorderSizePixel = 0
            _Frame8.Size = UDim2.new(0, 296, 0, 238)
            _Frame8.Visible = p144 or false
            _ScrollingFrame2.Name = 'PageScrolling'
            _ScrollingFrame2.Parent = _Frame8
            _ScrollingFrame2.Active = true
            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame2.BackgroundTransparency = 2
            _ScrollingFrame2.BorderColor3 = Color3.fromRGB(35, 35, 35)
            _ScrollingFrame2.BorderSizePixel = 0
            _ScrollingFrame2.Size = UDim2.new(0, 296, 0, 238)
            _ScrollingFrame2.CanvasPosition = Vector2.new(0, 300)
            _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
            _ScrollingFrame2.ScrollBarThickness = 4
            _UIListLayout2.Name = 'PageListLayout'
            _UIListLayout2.Parent = _ScrollingFrame2
            _UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout2.Padding = UDim.new(0, 10)
            _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y)

            _TextButton.MouseButton1Down:Connect(function()
                local v151 = _Frame5
                local v152, v153, v154 = pairs(v151:GetChildren())

                while true do
                    local v155

                    v154, v155 = v152(v153, v154)

                    if v154 == nil then
                        break
                    end
                    if v155:IsA('Frame') then
                        v155.Visible = false
                    end

                    _Frame8.Visible = true
                end

                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(100, 100, 100),
                }):Play()
                wait(0.2)
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.1), {
                    Color = Color3.fromRGB(62, 62, 62),
                }):Play()
            end)
            _TextButton.MouseEnter:Connect(function()
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(80, 80, 80),
                }):Play()
            end)
            _TextButton.MouseLeave:Connect(function()
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(62, 62, 62),
                }):Play()
            end)

            local u159 = {
                PageFix = function(_, p156)
                    local _Frame9 = Instance.new('Frame')

                    _Frame9.Name = 'FixFrame'
                    _Frame9.Parent = p156
                    _Frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame9.BackgroundTransparency = 2
                    _Frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame9.BorderSizePixel = 0
                    _Frame9.Position = UDim2.new(0.331081092, 0, 0, 0)
                    _Frame9.Size = UDim2.new(0, 100, 0, 0)
                end,
                TabFix = function(_)
                    local _Frame10 = Instance.new('Frame')

                    _Frame10.Name = 'FixFrame'
                    _Frame10.Parent = _ScrollingFrame2
                    _Frame10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame10.BackgroundTransparency = 2
                    _Frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame10.BorderSizePixel = 0
                    _Frame10.Position = UDim2.new(0.331081092, 0, 0, 0)
                    _Frame10.Size = UDim2.new(0, 100, 0, 0)
                    _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
                end,
            }
            local v160 = u159

            u159.PageFix(v160, _ScrollingFrame2)

            local v161 = u159

            u159.PageFix(v161, _ScrollingFrame)

            function u159.ImageLabel(_, p162, p163, p164)
                local _Frame11 = Instance.new('Frame')
                local _UICorner9 = Instance.new('UICorner')
                local _UIStroke6 = Instance.new('UIStroke')
                local _ImageLabel5 = Instance.new('ImageLabel')
                local _UICorner10 = Instance.new('UICorner')
                local _TextLabel4 = Instance.new('TextLabel')
                local _TextLabel5 = Instance.new('TextLabel')

                _Frame11.Name = 'WlcFrame'
                _Frame11.Parent = _ScrollingFrame2
                _Frame11.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame11.BorderSizePixel = 0
                _Frame11.Position = UDim2.new(-0.256756753, 0, 0.0882352963, 0)
                _Frame11.Size = UDim2.new(0, 274, 0, 100)
                _UICorner9.Name = 'WlcFrameCorner'
                _UICorner9.Parent = _Frame11
                _UIStroke6.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke6.Name = 'WlcFrameStroke'
                _UIStroke6.Parent = _Frame11
                _ImageLabel5.Name = 'PlayerImage'
                _ImageLabel5.Parent = _Frame11
                _ImageLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel5.BackgroundTransparency = 2
                _ImageLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel5.BorderSizePixel = 0
                _ImageLabel5.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
                _ImageLabel5.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel5.Image = p162
                _UICorner10.CornerRadius = UDim.new(0, 444)
                _UICorner10.Name = 'PlayerImageCorner'
                _UICorner10.Parent = _ImageLabel5
                _TextLabel4.Name = 'PlayerName'
                _TextLabel4.Parent = _Frame11
                _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel4.BackgroundTransparency = 2
                _TextLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel4.BorderSizePixel = 0
                _TextLabel4.Position = UDim2.new(0.37956205, 0, 0.25999999, 0)
                _TextLabel4.Size = UDim2.new(0, 164, 0, 27)
                _TextLabel4.Font = Enum.Font.RobotoCondensed
                _TextLabel4.Text = p163
                _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel4.TextSize = 20
                _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel5.Name = 'PlayerDisplayName'
                _TextLabel5.Parent = _Frame11
                _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel5.BackgroundTransparency = 2
                _TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel5.BorderSizePixel = 0
                _TextLabel5.Position = UDim2.new(0.37956205, 0, 0.529999971, 0)
                _TextLabel5.Size = UDim2.new(0, 144, 0, 18)
                _TextLabel5.Font = Enum.Font.RobotoCondensed
                _TextLabel5.Text = p164
                _TextLabel5.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel5.TextSize = 15
                _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
            end
            function u159.Info(_, p172, p173, p174)
                local _Frame12 = Instance.new('Frame')
                local _UICorner11 = Instance.new('UICorner')
                local _UIStroke7 = Instance.new('UIStroke')
                local _Frame13 = Instance.new('Frame')
                local _UICorner12 = Instance.new('UICorner')
                local _UIStroke8 = Instance.new('UIStroke')
                local _TextLabel6 = Instance.new('TextLabel')
                local _TextLabel7 = Instance.new('TextLabel')
                local _Frame14 = Instance.new('Frame')
                local _UICorner13 = Instance.new('UICorner')
                local _UIStroke9 = Instance.new('UIStroke')
                local _TextLabel8 = Instance.new('TextLabel')
                local _TextLabel9 = Instance.new('TextLabel')
                local _Frame15 = Instance.new('Frame')
                local _UICorner14 = Instance.new('UICorner')
                local _UIStroke10 = Instance.new('UIStroke')
                local _TextLabel10 = Instance.new('TextLabel')
                local _TextLabel11 = Instance.new('TextLabel')
                local _Frame16 = Instance.new('Frame')
                local _UICorner15 = Instance.new('UICorner')
                local _UIStroke11 = Instance.new('UIStroke')
                local _TextLabel12 = Instance.new('TextLabel')

                _Frame12.Name = 'InfoFrame'
                _Frame12.Parent = _ScrollingFrame2
                _Frame12.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame12.BorderSizePixel = 0
                _Frame12.Position = UDim2.new(0.0371621624, 0, -0.126050428, 0)
                _Frame12.Size = UDim2.new(0, 274, 0, 117)
                _UICorner11.Name = 'WlcFrameCorner'
                _UICorner11.Parent = _Frame12
                _UIStroke7.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke7.Name = 'WlcFrameStroke'
                _UIStroke7.Parent = _Frame12
                _Frame13.Name = 'VersionFrame'
                _Frame13.Parent = _Frame12
                _Frame13.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame13.BorderSizePixel = 0
                _Frame13.Position = UDim2.new(0.0437956192, 0, 0.200000003, 0)
                _Frame13.Size = UDim2.new(0, 78, 0, 34)
                _UICorner12.Name = 'VersionFrameCorner'
                _UICorner12.Parent = _Frame13
                _UIStroke8.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke8.Name = 'VersionFrameStroke'
                _UIStroke8.Parent = _Frame13
                _TextLabel6.Name = 'VersionLabel'
                _TextLabel6.Parent = _Frame13
                _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.BackgroundTransparency = 2
                _TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel6.BorderSizePixel = 0
                _TextLabel6.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel6.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel6.Font = Enum.Font.RobotoCondensed
                _TextLabel6.Text = '\u{627}\u{644}\u{62a}\u{62d}\u{62f}\u{64a}\u{62b}'
                _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.TextSize = 14
                _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel7.Name = 'Version'
                _TextLabel7.Parent = _Frame13
                _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel7.BackgroundTransparency = 2
                _TextLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel7.BorderSizePixel = 0
                _TextLabel7.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel7.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel7.Font = Enum.Font.RobotoCondensed
                _TextLabel7.Text = p172
                _TextLabel7.TextColor3 = Color3.fromRGB(144, 144, 144)
                _TextLabel7.TextSize = 14
                _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                _Frame14.Name = 'RankFrame'
                _Frame14.Parent = _Frame12
                _Frame14.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame14.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame14.BorderSizePixel = 0
                _Frame14.Position = UDim2.new(0.357664227, 0, 0.200000003, 0)
                _Frame14.Size = UDim2.new(0, 78, 0, 34)
                _UICorner13.Name = 'RankFrameCorner'
                _UICorner13.Parent = _Frame14
                _UIStroke9.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke9.Name = 'RankFrameStroke'
                _UIStroke9.Parent = _Frame14
                _TextLabel8.Name = 'RankLabel'
                _TextLabel8.Parent = _Frame14
                _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.BackgroundTransparency = 2
                _TextLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel8.BorderSizePixel = 0
                _TextLabel8.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel8.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel8.Font = Enum.Font.RobotoCondensed
                _TextLabel8.Text = '\u{627}\u{644}\u{631}\u{627}\u{646}\u{643}'
                _TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.TextSize = 14
                _TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel9.Name = 'Rank'
                _TextLabel9.Parent = _Frame14
                _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel9.BackgroundTransparency = 2
                _TextLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel9.BorderSizePixel = 0
                _TextLabel9.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel9.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel9.Font = Enum.Font.RobotoCondensed
                _TextLabel9.Text = p173
                _TextLabel9.TextColor3 = Color3.fromRGB(144, 144, 144)
                _TextLabel9.TextSize = 14
                _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
                _Frame15.Name = 'StatusFrame'
                _Frame15.Parent = _Frame12
                _Frame15.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame15.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame15.BorderSizePixel = 0
                _Frame15.Position = UDim2.new(0.671532869, 0, 0.200000003, 0)
                _Frame15.Size = UDim2.new(0, 78, 0, 34)
                _UICorner14.Name = 'StatusFrameCorner'
                _UICorner14.Parent = _Frame15
                _UIStroke10.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke10.Name = 'StatusFrameStroke'
                _UIStroke10.Parent = _Frame15
                _TextLabel10.Name = 'StatusLabel'
                _TextLabel10.Parent = _Frame15
                _TextLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel10.BackgroundTransparency = 2
                _TextLabel10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel10.BorderSizePixel = 0
                _TextLabel10.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel10.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel10.Font = Enum.Font.RobotoCondensed
                _TextLabel10.Text = '\u{627}\u{62e}\u{631} \u{62a}\u{62d}\u{62f}\u{64a}\u{62b}'
                _TextLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel10.TextSize = 14
                _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel11.Name = 'Status'
                _TextLabel11.Parent = _Frame15
                _TextLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel11.BackgroundTransparency = 2
                _TextLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel11.BorderSizePixel = 0
                _TextLabel11.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel11.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel11.Font = Enum.Font.RobotoCondensed
                _TextLabel11.Text = p174
                _TextLabel11.TextColor3 = Color3.fromRGB(122, 122, 122)
                _TextLabel11.TextSize = 14
                _TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
                _Frame16.Name = 'CloseFrame'
                _Frame16.Parent = _Frame12
                _Frame16.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame16.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame16.BorderSizePixel = 0
                _Frame16.Position = UDim2.new(0.0437956192, 0, 0.649999917, 0)
                _Frame16.Size = UDim2.new(0, 250, 0, 28)
                _UICorner15.Name = 'CloseFrameCorner'
                _UICorner15.Parent = _Frame16
                _UIStroke11.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke11.Name = 'CloseFrameStroke'
                _UIStroke11.Parent = _Frame16
                _TextLabel12.Name = 'Close'
                _TextLabel12.Parent = _Frame16
                _TextLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel12.BackgroundTransparency = 2
                _TextLabel12.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel12.BorderSizePixel = 0
                _TextLabel12.Position = UDim2.new(0.0399999991, 0, 0.0882327408, 0)
                _TextLabel12.Size = UDim2.new(0, 226, 0, 26)
                _TextLabel12.Font = Enum.Font.RobotoCondensed
                _TextLabel12.Text = '\u{627}\u{636}\u{63a}\u{637} "V" \u{644}\u{627}\u{63a}\u{644}\u{627}\u{642} \u{627}\u{648} \u{641}\u{62a}\u{62d} \u{627}\u{644}\u{642}\u{627}\u{626}\u{645}\u{629}'
                _TextLabel12.TextColor3 = Color3.fromRGB(122, 122, 122)
                _TextLabel12.TextSize = 14
                _TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
            end
            function u159.Label(_, p197)
                local _TextLabel13 = Instance.new('TextLabel')

                _TextLabel13.Name = 'ButtonLabel'
                _TextLabel13.Parent = _ScrollingFrame2
                _TextLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel13.BackgroundTransparency = 2
                _TextLabel13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel13.BorderSizePixel = 0
                _TextLabel13.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel13.Size = UDim2.new(0, 272, 0, 33)
                _TextLabel13.Font = Enum.Font.RobotoCondensed
                _TextLabel13.Text = p197
                _TextLabel13.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel13.TextSize = 17
            end
            function u159.BigButton(_, p199, p200, p201)
                local _TextButton2 = Instance.new('TextButton')
                local _UICorner16 = Instance.new('UICorner')
                local _UIStroke12 = Instance.new('UIStroke')
                local _TextLabel14 = Instance.new('TextLabel')
                local _ImageLabel6 = Instance.new('ImageLabel')
                local u207 = p201 or function() end

                _TextButton2.Name = 'BigButton'
                _TextButton2.Parent = _ScrollingFrame2
                _TextButton2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton2.BorderSizePixel = 0
                _TextButton2.Position = UDim2.new(0.0540540554, 0, 0.352941185, 0)
                _TextButton2.Size = UDim2.new(0, 272, 0, 86)
                _TextButton2.AutoButtonColor = false
                _TextButton2.Font = Enum.Font.SourceSans
                _TextButton2.Text = ''
                _TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton2.TextSize = 14
                _UICorner16.Name = 'BigButtonCorner'
                _UICorner16.Parent = _TextButton2
                _UIStroke12.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke12.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke12.Name = 'BigButtonStroke'
                _UIStroke12.Parent = _TextButton2
                _TextLabel14.Name = 'BigButtonLabel'
                _TextLabel14.Parent = _TextButton2
                _TextLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel14.BackgroundTransparency = 2
                _TextLabel14.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel14.BorderSizePixel = 0
                _TextLabel14.Position = UDim2.new(0.0551470593, 0, 0.519027352, 0)
                _TextLabel14.Size = UDim2.new(0, 176, 0, 34)
                _TextLabel14.Text = p199
                _TextLabel14.Font = Enum.Font.RobotoCondensed
                _TextLabel14.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel14.TextSize = 28
                _TextLabel14.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel6.Name = 'BigButtonImage'
                _ImageLabel6.Parent = _TextButton2
                _ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel6.BackgroundTransparency = 2
                _ImageLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel6.BorderSizePixel = 0
                _ImageLabel6.Position = UDim2.new(0.702205896, 0, 0.0863285512, 0)
                _ImageLabel6.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel6.Image = p200
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton2.MouseButton1Down:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(255, 255, 255),
                    }):Play()
                    wait(0.01)
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                    pcall(u207)
                end)
                _TextButton2.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton2.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Button(_, p208, p209)
                local _TextButton3 = Instance.new('TextButton')
                local _UICorner17 = Instance.new('UICorner')
                local _UIStroke13 = Instance.new('UIStroke')
                local _TextLabel15 = Instance.new('TextLabel')
                local _ImageLabel7 = Instance.new('ImageLabel')
                local u215 = p209 or function() end

                _TextButton3.Name = 'Button'
                _TextButton3.Parent = _ScrollingFrame2
                _TextButton3.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.BorderSizePixel = 0
                _TextButton3.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
                _TextButton3.Size = UDim2.new(0, 272, 0, 33)
                _TextButton3.AutoButtonColor = false
                _TextButton3.Font = Enum.Font.SourceSans
                _TextButton3.Text = ''
                _TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.TextSize = 14
                _UICorner17.Name = 'ButtonCorner'
                _UICorner17.Parent = _TextButton3
                _UIStroke13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke13.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke13.Name = 'ButtonStroke'
                _UIStroke13.Parent = _TextButton3
                _TextLabel15.Name = 'ButtonLabel'
                _TextLabel15.Parent = _TextButton3
                _TextLabel15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel15.BackgroundTransparency = 2
                _TextLabel15.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel15.BorderSizePixel = 0
                _TextLabel15.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel15.Size = UDim2.new(0, 228, 0, 20)
                _TextLabel15.Font = Enum.Font.RobotoCondensed
                _TextLabel15.Text = p208
                _TextLabel15.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel15.TextSize = 17
                _TextLabel15.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel7.Name = 'ButtonImage'
                _ImageLabel7.Parent = _TextButton3
                _ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel7.BackgroundTransparency = 2
                _ImageLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel7.BorderSizePixel = 0
                _ImageLabel7.Position = UDim2.new(0.0073529412, 0, 0.121212125, 0)
                _ImageLabel7.Size = UDim2.new(0, 25, 0, 25)
                _ImageLabel7.Image = 'rbxassetid://11295279987'
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton3.MouseButton1Down:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(255, 255, 255),
                    }):Play()
                    wait(0.01)
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                    pcall(u215)
                end)
                _TextButton3.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton3.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Toggle(_, p216, p217)
                local _TextButton4 = Instance.new('TextButton')
                local _UICorner18 = Instance.new('UICorner')
                local _UIStroke14 = Instance.new('UIStroke')
                local _TextLabel16 = Instance.new('TextLabel')
                local _ImageLabel8 = Instance.new('ImageLabel')
                local u223 = p217 or function() end
                local u224 = false

                _TextButton4.Name = 'Toggle'
                _TextButton4.Parent = _ScrollingFrame2
                _TextButton4.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton4.BorderSizePixel = 0
                _TextButton4.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
                _TextButton4.Size = UDim2.new(0, 272, 0, 33)
                _TextButton4.AutoButtonColor = false
                _TextButton4.Font = Enum.Font.SourceSans
                _TextButton4.Text = ''
                _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton4.TextSize = 14
                _UICorner18.Name = 'ToggleCorner'
                _UICorner18.Parent = _TextButton4
                _UIStroke14.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke14.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke14.Name = 'ToggleStroke'
                _UIStroke14.Parent = _TextButton4
                _TextLabel16.Name = 'ToggleLabel'
                _TextLabel16.Parent = _TextButton4
                _TextLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel16.BackgroundTransparency = 2
                _TextLabel16.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel16.BorderSizePixel = 0
                _TextLabel16.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel16.Size = UDim2.new(0, 228, 0, 20)
                _TextLabel16.Font = Enum.Font.RobotoCondensed
                _TextLabel16.Text = p216
                _TextLabel16.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel16.TextSize = 17
                _TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel8.Name = 'ToggleImage'
                _ImageLabel8.Parent = _TextButton4
                _ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel8.BackgroundTransparency = 2
                _ImageLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel8.BorderSizePixel = 0
                _ImageLabel8.Position = UDim2.new(0.0149999997, 0, 0.0909999982, 2)
                _ImageLabel8.Size = UDim2.new(0, 23, 0, 23)
                _ImageLabel8.Image = 'rbxassetid://11293978956'
                _ImageLabel8.ImageColor3 = Color3.fromRGB(255, 0, 0)
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton4.MouseButton1Down:Connect(function()
                    u224 = not u224

                    if u224 then
                        game:GetService('TweenService'):Create(_ImageLabel8, TweenInfo.new(0.25), {
                            ImageColor3 = Color3.fromRGB(0, 211, 0),
                        }):Play()
                    else
                        game:GetService('TweenService'):Create(_ImageLabel8, TweenInfo.new(0.25), {
                            ImageColor3 = Color3.fromRGB(211, 0, 0),
                        }):Play()
                    end

                    pcall(u223, u224)
                end)
                _TextButton4.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke14, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton4.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke14, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Slider(_, p225, p226, p227, p228)
                local _Frame17 = Instance.new('Frame')
                local _UICorner19 = Instance.new('UICorner')
                local _UIStroke15 = Instance.new('UIStroke')
                local _TextLabel17 = Instance.new('TextLabel')
                local _TextLabel18 = Instance.new('TextLabel')
                local _TextButton5 = Instance.new('TextButton')
                local _UICorner20 = Instance.new('UICorner')
                local _UIStroke16 = Instance.new('UIStroke')
                local _Frame18 = Instance.new('Frame')
                local _UICorner21 = Instance.new('UICorner')
                local u239 = p228 or function() end
                local u240 = game.Players.LocalPlayer:GetMouse()
                local _UserInputService3 = game:GetService('UserInputService')
                local u242 = nil

                _Frame17.Name = 'SliderFrame'
                _Frame17.Parent = _ScrollingFrame2
                _Frame17.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame17.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame17.BorderSizePixel = 0
                _Frame17.Position = UDim2.new(0.0405405387, 0, 0.39915967, 0)
                _Frame17.Size = UDim2.new(0, 272, 0, 45)
                _UICorner19.Name = 'SliderFrameCorner'
                _UICorner19.Parent = _Frame17
                _UIStroke15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke15.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke15.Name = 'SliderFrameStroke'
                _UIStroke15.Parent = _Frame17
                _TextLabel17.Name = 'SliderLabel'
                _TextLabel17.Parent = _Frame17
                _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel17.BackgroundTransparency = 2
                _TextLabel17.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel17.BorderSizePixel = 0
                _TextLabel17.Position = UDim2.new(0.0698529407, 0, 0.13333334, 0)
                _TextLabel17.Size = UDim2.new(0, 187, 0, 12)
                _TextLabel17.Font = Enum.Font.RobotoCondensed
                _TextLabel17.Text = p225
                _TextLabel17.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel17.TextSize = 17
                _TextLabel17.TextWrapped = true
                _TextLabel17.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel18.Name = 'SliderNumber'
                _TextLabel18.Parent = _Frame17
                _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel18.BackgroundTransparency = 2
                _TextLabel18.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel18.BorderSizePixel = 0
                _TextLabel18.Position = UDim2.new(0.841911793, 0, 0.13333334, 0)
                _TextLabel18.Size = UDim2.new(0, 32, 0, 12)
                _TextLabel18.Font = Enum.Font.RobotoCondensed
                _TextLabel18.Text = '1'
                _TextLabel18.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel18.TextSize = 13
                _TextLabel18.TextWrapped = true
                _TextButton5.Name = 'SliderButton'
                _TextButton5.Parent = _Frame17
                _TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextButton5.BackgroundTransparency = 2
                _TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton5.BorderSizePixel = 0
                _TextButton5.Position = UDim2.new(0.0661764741, 0, 0.577777803, 0)
                _TextButton5.Size = UDim2.new(0, 235, 0, 13)
                _TextButton5.Font = Enum.Font.SourceSans
                _TextButton5.Text = ''
                _TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton5.TextSize = 14
                _UICorner20.Name = 'SliderButtonCorner'
                _UICorner20.Parent = _TextButton5
                _UIStroke16.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke16.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke16.Name = 'SliderButtonStroke'
                _UIStroke16.Parent = _TextButton5
                _Frame18.Name = 'SliderLine'
                _Frame18.Parent = _TextButton5
                _Frame18.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                _Frame18.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame18.BorderSizePixel = 0
                _Frame18.Size = UDim2.new(0, 0, 0, 13)
                _UICorner21.Name = 'SliderLineCorner'
                _UICorner21.Parent = _Frame18
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton5.MouseButton1Down:Connect(function()
                    u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226)) or 0

                    pcall(function()
                        u239(u242)
                    end)
                    _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)

                    moveconnection = u240.Move:Connect(function()
                        _TextLabel18.Text = u242

                        game:GetService('TweenService'):Create(_UIStroke16, TweenInfo.new(0.1), {
                            Color = Color3.fromRGB(255, 255, 255),
                        }):Play()

                        u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226))

                        pcall(function()
                            u239(u242)
                        end)
                        _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)
                    end)
                    releaseconnection = _UserInputService3.InputEnded:Connect(function(p243)
                        if p243.UserInputType == Enum.UserInputType.MouseButton1 then
                            u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226))

                            pcall(function()
                                u239(u242)
                            end)
                            _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                            game:GetService('TweenService'):Create(_UIStroke16, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(74, 74, 74),
                            }):Play()
                        end
                    end)
                end)
                _TextButton5.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke15, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton5.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke15, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Textbox(_, p244, p245, p246, p247)
                local _Frame19 = Instance.new('Frame')
                local _UICorner22 = Instance.new('UICorner')
                local _UIStroke17 = Instance.new('UIStroke')
                local _TextBox = Instance.new('TextBox')
                local _UICorner23 = Instance.new('UICorner')
                local _UIStroke18 = Instance.new('UIStroke')
                local _TextLabel19 = Instance.new('TextLabel')
                local u255 = p247 or function() end

                _Frame19.Name = 'TextBoxFrame'
                _Frame19.Parent = _ScrollingFrame2
                _Frame19.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame19.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame19.BorderSizePixel = 0
                _Frame19.Position = UDim2.new(0.0371621624, 0, 0.613445401, 0)
                _Frame19.Size = UDim2.new(0, 272, 0, 45)
                _UICorner22.Name = 'TextBoxFrameCorner'
                _UICorner22.Parent = _Frame19
                _UIStroke17.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke17.Name = 'TextBoxFrameStroke'
                _UIStroke17.Parent = _Frame19
                _TextBox.Parent = _Frame19
                _TextBox.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
                _TextBox.BackgroundTransparency = 2
                _TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextBox.BorderSizePixel = 0
                _TextBox.Position = UDim2.new(0.577205896, 0, 0.150000006, 0)
                _TextBox.Size = UDim2.new(0, 103, 0, 31)
                _TextBox.Font = Enum.Font.RobotoCondensed
                _TextBox.Text = p245
                _TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextBox.TextSize = 14
                _UICorner23.Name = 'TargetTextBoxCorner'
                _UICorner23.Parent = _TextBox
                _UIStroke18.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke18.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke18.Thickness = 0.699999988079071
                _UIStroke18.Name = 'TargetTextBoxStroke'
                _UIStroke18.Parent = _TextBox
                _TextLabel19.Name = 'TextBoxLabel'
                _TextLabel19.Parent = _Frame19
                _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel19.BackgroundTransparency = 2
                _TextLabel19.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel19.BorderSizePixel = 0
                _TextLabel19.Position = UDim2.new(0.0404411778, 0, 0.244444445, 0)
                _TextLabel19.Size = UDim2.new(0, 137, 0, 22)
                _TextLabel19.Text = p244
                _TextLabel19.Font = Enum.Font.RobotoCondensed
                _TextLabel19.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel19.TextSize = 17
                _TextLabel19.TextWrapped = true
                _TextLabel19.TextXAlignment = Enum.TextXAlignment.Left

                _TextBox.Focused:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(130, 130, 130),
                    }):Play()
                end)

                if (p246 or false) == false then
                    _TextBox.FocusLost:Connect(function()
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(255, 255, 255),
                        }):Play()
                        wait(0.2)
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(74, 74, 74),
                        }):Play()
                        u255(_TextBox.Text)

                        _TextBox.Text = p245
                    end)
                else
                    _TextBox.Focused:Connect(function()
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(130, 130, 130),
                        }):Play()
                    end)
                    _TextBox.FocusLost:Connect(function(p256)
                        if p256 then
                            if _TextBox.Text:match('^%d+$') then
                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                }):Play()
                                wait(0.2)
                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(74, 74, 74),
                                }):Play()
                                u255(_TextBox.Text)

                                _TextBox.Text = p245
                            else
                                _TextBox.Text = '\u{627}\u{631}\u{642}\u{627}\u{645} \u{641}\u{642}\u{637} !'

                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(255, 0, 0),
                                }):Play()
                                wait(0.8)

                                _TextBox.Text = p245

                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(74, 74, 74),
                                }):Play()
                            end
                        end
                    end)
                end
            end
            function u159.TargetTextBox(_, p257, p258, p259)
                local _Frame20 = Instance.new('Frame')
                local _UICorner24 = Instance.new('UICorner')
                local _UIStroke19 = Instance.new('UIStroke')
                local _ImageLabel9 = Instance.new('ImageLabel')
                local _UICorner25 = Instance.new('UICorner')
                local _TextLabel20 = Instance.new('TextLabel')
                local _TextBox2 = Instance.new('TextBox')
                local _UICorner26 = Instance.new('UICorner')
                local _UIStroke20 = Instance.new('UIStroke')
                local _TextLabel21 = Instance.new('TextLabel')

                _Frame20.Name = 'TargetFrame'
                _Frame20.Parent = _ScrollingFrame2
                _Frame20.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame20.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame20.BorderSizePixel = 0
                _Frame20.Position = UDim2.new(0.0540540554, 0, 0.369747907, 0)
                _Frame20.Size = UDim2.new(0, 274, 0, 100)
                _UICorner24.Name = 'TargetFrameCorner'
                _UICorner24.Parent = _Frame20
                _UIStroke19.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke19.Name = 'TargetFrameStroke'
                _UIStroke19.Parent = _Frame20
                _ImageLabel9.Name = 'TargetImage'
                _ImageLabel9.Parent = _Frame20
                _ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel9.BackgroundTransparency = 2
                _ImageLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel9.BorderSizePixel = 0
                _ImageLabel9.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
                _ImageLabel9.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel9.Image = p257
                _UICorner25.CornerRadius = UDim.new(0, 444)
                _UICorner25.Name = 'PlayerImageCorner'
                _UICorner25.Parent = _ImageLabel9
                _TextLabel20.Name = 'TargetName'
                _TextLabel20.Parent = _Frame20
                _TextLabel20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel20.BackgroundTransparency = 2
                _TextLabel20.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel20.BorderSizePixel = 0
                _TextLabel20.Position = UDim2.new(0.394160599, 0, 0.519999981, 0)
                _TextLabel20.Size = UDim2.new(0, 140, 0, 18)
                _TextLabel20.Font = Enum.Font.RobotoCondensed
                _TextLabel20.Text = 'Target Name : ' .. p258
                _TextLabel20.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel20.TextSize = 15
                _TextLabel20.TextXAlignment = Enum.TextXAlignment.Left
                _TextBox2.Name = 'TargetTextBox'
                _TextBox2.Parent = _Frame20
                _TextBox2.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
                _TextBox2.BackgroundTransparency = 2
                _TextBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextBox2.BorderSizePixel = 0
                _TextBox2.Position = UDim2.new(0.394160599, 0, 0.150000006, 0)
                _TextBox2.Size = UDim2.new(0, 118, 0, 31)
                _TextBox2.Font = Enum.Font.RobotoCondensed
                _TextBox2.Text = ''
                _TextBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextBox2.TextSize = 14
                _UICorner26.Name = 'TargetTextBoxCorner'
                _UICorner26.Parent = _TextBox2
                _UIStroke20.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke20.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke20.Thickness = 0.699999988079071
                _UIStroke20.Name = 'TargetTextBoxStroke'
                _UIStroke20.Parent = _TextBox2
                _TextLabel21.Name = 'TargetId'
                _TextLabel21.Parent = _Frame20
                _TextLabel21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel21.BackgroundTransparency = 2
                _TextLabel21.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel21.BorderSizePixel = 0
                _TextLabel21.Position = UDim2.new(0.394160599, 0, 0.699999988, 0)
                _TextLabel21.Size = UDim2.new(0, 140, 0, 18)
                _TextLabel21.Font = Enum.Font.RobotoCondensed
                _TextLabel21.Text = 'ID : ' .. p259
                _TextLabel21.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel21.TextSize = 15
                _TextLabel21.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                local function u275(p270)
                    if p270 == '' then
                        return nil
                    end
                    if p270 == 'random' then
                        return game:GetService('Players'):GetPlayers()[math.random(1, #game:GetService('Players'):GetPlayers())]
                    end

                    local v271, v272, v273 = pairs(game:GetService('Players'):GetPlayers())

                    while true do
                        local v274

                        v273, v274 = v271(v272, v273)

                        if v273 == nil then
                            break
                        end
                        if v274.Name:lower():sub(1, #p270) == p270:lower() or v274.DisplayName:lower():sub(1, #p270) == p270 then
                            return v274
                        end
                    end
                end

                game.Workspace.FallenPartsDestroyHeight = -50000

                _TextBox2.FocusLost:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke20, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()

                    local v276 = u275(_TextBox2.Text)

                    if v276 ~= game:GetService('Players').LocalPlayer then
                        _TextBox2.Text = v276.Name
                        _TextLabel20.Text = 'Target Name : @' .. v276.DisplayName
                        _TextLabel21.Text = 'ID : ' .. v276.UserId
                        _ImageLabel9.Image = game:GetService('Players'):GetUserThumbnailAsync(v276.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    end
                end)
                u159:TabFix()
                u159:TabFix()
                u159:Button('\u{627}\u{646}\u{62a}\u{642}\u{627}\u{644}', function()
                    Benx = false
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    local v277 = u275(_TextBox2.Text)

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v277.Character.HumanoidRootPart.CFrame
                end)
                u159:Button('\u{641}\u{644}\u{64a}\u{646}\u{642}', function()
                    Benx = false
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    local v278 = u275(_TextBox2.Text)

                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';char me',
                    }))
                    wait(0.4)
                    u59(v278.Name)
                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';unchar',
                    }))
                end)
                u159:TabFix()
                u159:TabFix()

                local function u280(p279)
                    return p279.Character.Humanoid.Sit == false
                end

                _G.Wait = false

                u159:Button('\u{642}\u{62a}\u{644}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u281 = u275(_TextBox2.Text)
                        local _CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v283, v284, v285 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v286

                                v285, v286 = v283(v284, v285)

                                if v285 == nil then
                                    break
                                end
                                if v286:IsA('Tool') and v286.Name == 'ShoppingCart' then
                                    v286.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u281.Character.HumanoidRootPart.CFrame + u281.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u281.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u281) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -1000.51605, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{627}\u{631}\u{633}\u{627}\u{644}\u{647} \u{644}\u{644}\u{641}\u{636}\u{627}\u{621}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u287 = u275(_TextBox2.Text)
                        local _CFrame2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v289, v290, v291 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v292

                                v291, v292 = v289(v290, v291)

                                if v291 == nil then
                                    break
                                end
                                if v292:IsA('Tool') and v292.Name == 'ShoppingCart' then
                                    v292.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u287.Character.HumanoidRootPart.CFrame + u287.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u287.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u287) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame2
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame2

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{633}\u{62d}\u{628}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u293 = u275(_TextBox2.Text)
                        local _CFrame3 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v295, v296, v297 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v298

                                v297, v298 = v295(v296, v297)

                                if v297 == nil then
                                    break
                                end
                                if v298:IsA('Tool') and v298.Name == 'ShoppingCart' then
                                    v298.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u293.Character.HumanoidRootPart.CFrame + u293.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u293.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u293) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(3265700, 72336392, 17749450))
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame3

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{627}\u{64a}\u{642}\u{627}\u{641} \u{627}\u{644}\u{642}\u{62a}\u{644} / \u{627}\u{644}\u{633}\u{62d}\u{628}', function()
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                    game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                    game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')
                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';vis',
                    }))
                    game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                    _G.Wait = false
                end)
                u159:TabFix()
                u159:TabFix()
                u159:Toggle('Benx', function(p299)
                    local u300 = u275(_TextBox2.Text)

                    Benx = p299
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer5 = game.Players.LocalPlayer

                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)
                        end)
                    until Benx == false

                    if Benx == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false

                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
                u159:Toggle('Bang', function(p302)
                    local u303 = u275(_TextBox2.Text)

                    bang = p302
                    Benx = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer6 = game.Players.LocalPlayer

                            _LocalPlayer6.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)
                        end)
                    until bang == false

                    if bang == false then
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                    end
                end)
                u159:Toggle('Face Bang', function(p305)
                    local u306 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = false
                    HeadSit = false
                    FaceBang = p305
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer7 = game.Players.LocalPlayer

                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)
                        end)
                    until FaceBang == false

                    if FaceBang == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                    end
                end)
                u159:Toggle('Suck', function(p308)
                    local u309 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = p308
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer8 = game.Players.LocalPlayer

                            _LocalPlayer8.Character.Humanoid.Sit = true
                            _LocalPlayer8.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u309.Character.LowerTorso.CFrame * CFrame.new(0, -1, -1.7) * CFrame.Angles(0, -3.3, 0)
                        end)
                    until Suck == false

                    if Suck == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                end)
                u159:Toggle('Head Sit', function(p311)
                    local u312 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = false
                    HeadSit = p311
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer9 = game.Players.LocalPlayer

                            _LocalPlayer9.Character.Humanoid.Sit = true
                            _LocalPlayer9.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer9.Character.HumanoidRootPart.CFrame = u312.Character.Head.CFrame * CFrame.new(0, 1.3, 1)
                        end)
                    until HeadSit == false

                    if HeadSit == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                end)
                u159:TabFix()
                u159:TabFix()
            end

            return u159
        end,
    }
end

local _AtomicHub = v61:Win("Atomic Hub | ماب البيوت العربي")

local v315 = _AtomicHub:Tab("الرئيسية", true)
local v316 = _AtomicHub:Tab("القيم")
local v317 = _AtomicHub:Tab("اللاعب تجربه تغير")
local v318 = _AtomicHub:Tab("الاستهداف")
local v319 = _AtomicHub:Tab("اخرى")
local v320 = _AtomicHub:Tab("الانميشن")
local v321 = _AtomicHub:Tab("المطورين")
v315:ImageLabel('https://www.roblox.com/headshot-thumbnail/image?userId=' .. game.Players.LocalPlayer.UserId .. '&width=420&height=420&format=png', '\u{645}\u{631}\u{62d}\u{628}\u{627}\u{64b} ' .. game.Players.LocalPlayer.DisplayName, '@' .. game.Players.LocalPlayer.Name)

if game.Players.LocalPlayer.Name ~= 'NiQ' then
    v315:Info('V1', 'User', 'nil')
else
    v315:Info('V1', '\u{627}\u{644}\u{627}\u{648}\u{646}\u{631}', 'nil')
end

v315:TabFix()
v316:Label('- \u{627}\u{644}\u{627}\u{63a}\u{631}\u{627}\u{636} -')
v316:Button('\u{62c}\u{644}\u{628} \u{62c}\u{645}\u{64a}\u{639} \u{627}\u{644}\u{627}\u{63a}\u{631}\u{627}\u{636}', function()
    local v322, v323, v324 = pairs({
        'Coke',
        'Hamberger',
        'Apple',
        'Bloxaide',
        'BottledWater',
        'Mocha',
        'ShakeChocolate',
        'FrapStrawberry',
        'FrapMint',
        'Icecream',
        'Donut',
        'CookieChip',
        'Pretzel',
        'Waffle',
        'MuffinBlueBerry',
        'Pizza',
        'Guda',
        'Sandwich',
        'Banana',
        'AppleGreen',
        'Chips',
        'Assault',
        'Shotgun',
        'Flashlight',
        'Cuffs',
        'GlockBrown',
        'Weight',
        'BabyGirl',
        'BabyBoy',
        'Laptop',
        'ShoppingCart',
    })

    while true do
        local v325

        v324, v325 = v322(v323, v324)

        if v324 == nil then
            break
        end

        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer(v325)
    end
end)
v316:Button('\u{62a}\u{62d}\u{648}\u{64a}\u{644} \u{627}\u{644}\u{645}\u{648}\u{632} \u{627}\u{644}\u{649} ##', function()
    if not game.Players.LocalPlayer.Character:FindFirstChild('Banana') or game.Players.LocalPlayer.Backpack:FindFirstChild('Banana') then
        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('Banana')
    end

    wait(1)

    if game.Players.LocalPlayer.Character:FindFirstChild('Banana') then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools(game.Players.LocalPlayer.Character:FindFirstChild('Banana'))
    end

    wait(0.2)

    if game.Players.LocalPlayer.Backpack:FindFirstChild('Banana') then
        game.Players.LocalPlayer.Backpack.Banana.GripRight = Vector3.new(0.019996, 0, -0.9998)
        game.Players.LocalPlayer.Backpack.Banana.GripUp = Vector3.new(0.9996, 1, 0.019992)
        game.Players.LocalPlayer.Backpack.Banana.GripForward = Vector3.new(-0.0199988, 0.9998, -0.000379769)
        game.Players.LocalPlayer.Backpack.Banana.GripPos = Vector3.new(1, 0, -1)

        if game.Players.LocalPlayer.Backpack:FindFirstChild('Banana') then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild('Banana'))
        end
    end
end)
v316:Label('- \u{627}\u{644}\u{627}\u{639}\u{628}\u{64a}\u{646} -')
v316:Toggle('\u{62a}\u{62d}\u{648}\u{64a}\u{644} \u{627}\u{644}\u{627}\u{639}\u{628} \u{627}\u{644}\u{649} ##', function(p326)
    _G.SpamSize = p326

    spawn(function()
        while _G.SpamSize == true do
            wait()
            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('2')
        end
    end)

    if p326 == true then
        if not game.Players.LocalPlayer.Character:FindFirstChild('ShoppingCart') or game.Players.LocalPlayer.Backpack:FindFirstChild('ShoppingCart') then
            game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
        end

        wait(1)

        if game.Players.LocalPlayer.Character:FindFirstChild('ShoppingCart') then
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools(game.Players.LocalPlayer.Character:FindFirstChild('ShoppingCart'))
        end

        wait(0.2)

        if game.Players.LocalPlayer.Backpack:FindFirstChild('ShoppingCart') then
            game.Players.LocalPlayer.Backpack.ShoppingCart.GripRight = Vector3.new(0.019996, 0, -0.9998)
            game.Players.LocalPlayer.Backpack.ShoppingCart.GripUp = Vector3.new(0.9996, 0, 0.019992)
            game.Players.LocalPlayer.Backpack.ShoppingCart.GripForward = Vector3.new(-0.0199988, 0.9998, 0.000379769)
            game.Players.LocalPlayer.Backpack.ShoppingCart.GripPos = Vector3.new(3, 2, -3.4)

            if game.Players.LocalPlayer.Backpack:FindFirstChild('ShoppingCart') then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild('ShoppingCart'))
            end
        end
    else
        game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
            ';unchar',
        }))
        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
    end
end)
v316:Toggle('\u{641}\u{644}\u{64a}\u{646}\u{642} \u{627}\u{644}\u{643}\u{644}', function(p327)
    getgenv().FlingAll = p327

    if getgenv().FlingAll == true then
        game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
            ';unchar',
        }))
    end

    wait(0.7)

    while getgenv().FlingAll == true do
        wait()
        u59(game:GetService('Players'):GetPlayers()[math.random(1, #game:GetService('Players'):GetPlayers())].Name)
    end
end)
v316:Button('\u{62d}\u{630}\u{641} \u{627}\u{644}\u{627}\u{63a}\u{631}\u{627}\u{636} \u{645}\u{646} \u{627}\u{644}\u{627}\u{639}\u{628}\u{64a}\u{646}', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/xWANTED333/scripts/main/remove-tools-from-all.game'))()
end)
v316:Label('- \u{627}\u{644}\u{643}\u{627}\u{645}\u{64a}\u{631}\u{647} -')
v316:Button('\u{627}\u{64a}\u{642}\u{627}\u{641} \u{627}\u{644}\u{643}\u{627}\u{645}\u{64a}\u{631}\u{647}', function()
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)
v316:Textbox('\u{631}\u{642}\u{645} \u{627}\u{644}\u{645}\u{643}\u{627}\u{646}', '1 - 9', true, function(p328)
    if p328 == '1' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['2']
    elseif p328 == '2' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['3']
    elseif p328 == '3' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['4']
    elseif p328 == '4' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['5']
    elseif p328 == '5' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['6']
    elseif p328 == '6' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['8']
    elseif p328 == '7' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['9']
    elseif p328 == '8' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['10']
    elseif p328 == '9' then
        game.Workspace.Camera.CameraSubject = game.workspace.CamPositions['1']
    else
        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    end
end)
v316:Label('- \u{627}\u{644}\u{628}\u{627}\u{64a}\u{648} / \u{627}\u{644}\u{627}\u{633}\u{645} -')
v316:Textbox('\u{627}\u{644}\u{627}\u{633}\u{645}', '\u{627}\u{64a} \u{627}\u{633}\u{645}', false, function(p329)
    _G.RpName = p329
end)
v316:Toggle('\u{62a}\u{634}\u{63a}\u{64a}\u{644}', function(p330)
    _G.Start = p330

    if p330 == true then
        local v331 = {
            _G.RpName,
            'rpname',
        }

        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPname'):FireServer(unpack(v331))

        local u332 = 0.6

        while _G.Start == true do
            wait()
            pcall(function()
                local v333 = {
                    Color3.new(1, 0.16862745583057404, 0.18039216101169586),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v333))
                wait(u332)

                local v334 = {
                    Color3.new(1, 0.9372549653053284, 0.007843137718737125),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v334))
                wait(u332)

                local v335 = {
                    Color3.new(0.26274511218070984, 1, 0.250980406999588),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v335))
                wait(u332)

                local v336 = {
                    Color3.new(0.3803921937942505, 0.9921569228172302, 1),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v336))
                wait(u332)

                local v337 = {
                    Color3.new(0, 0.01568627543747425, 1),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v337))
                wait(u332)

                local v338 = {
                    Color3.new(1, 0.3333333432674408, 0.8588235974311829),
                    'rpname',
                }

                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPnameColor'):FireServer(unpack(v338))
            end)
        end
    else
        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SetRPname'):FireServer(unpack({
            '',
            'rpname',
        }))
    end
end)
v316:TabFix()
v316:TabFix()
v318:TargetTextBox('nil', 'nil', 'nil')
v317:Toggle('Re \u{627}\u{648}\u{62a}\u{648}', function(p339)
    _G.AutoRe = p339

    while _G.AutoRe == true do
        pcall(function()
            wait(0.8)

            if game.Players.LocalPlayer.Character.Humanoid.Health <= 1 then
                local v340, v341, v342 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                while true do
                    local v343

                    v342, v343 = v340(v341, v342)

                    if v342 == nil then
                        break
                    end
                    if v343:IsA('MeshPart') or v343:IsA('Part') then
                        v343:Destroy()
                    end
                end

                local v344, v345, v346 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                while true do
                    local v347

                    v346, v347 = v344(v345, v346)

                    if v346 == nil then
                        break
                    end
                    if v347:IsA('Accessory') then
                        v347.Handle:Destroy()
                    end
                end

                game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                    ';re',
                }))
            end
        end)
    end
end)
v317:Toggle('\u{627}\u{648}\u{62a}\u{648} \u{631}\u{633}\u{628}\u{648}\u{646}', function(p348)
    _G.AutoRes = p348

    while _G.AutoRes == true do
        pcall(function()
            wait(0.8)

            if game.Players.LocalPlayer.Character.Humanoid.Health <= 1 then
                local v349, v350, v351 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                while true do
                    local v352

                    v351, v352 = v349(v350, v351)

                    if v351 == nil then
                        break
                    end
                    if v352:IsA('MeshPart') or v352:IsA('Part') then
                        v352:Destroy()
                    end
                end

                local v353, v354, v355 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                while true do
                    local v356

                    v355, v356 = v353(v354, v355)

                    if v355 == nil then
                        break
                    end
                    if v356:IsA('Accessory') then
                        v356.Handle:Destroy()
                    end
                end

                game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                    ';res',
                }))
            end
        end)
    end
end)
v317:Textbox('\u{633}\u{631}\u{639}\u{629} \u{627}\u{644}\u{627}\u{639}\u{628}', '16 - 999', true, function(p357)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = p357
end)
v317:Textbox('\u{645}\u{62f}\u{649} \u{627}\u{644}\u{642}\u{641}\u{632}', '50 - 999', true, function(p358)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = p358
end)
v317:Textbox('\u{62d}\u{62c}\u{645} \u{627}\u{644}\u{627}\u{639}\u{628}', '0 - 50', true, function(p359)
    game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer(p359)
end)
v317:Toggle('\u{627}\u{62e}\u{62a}\u{631}\u{627}\u{642} \u{627}\u{644}\u{62c}\u{62f}\u{631}\u{627}\u{646}', function(p360)
    if p360 == true then
        game:GetService('RunService'):BindToRenderStep('Noclip', 0, function()
            local v361, v362, v363 = pairs(game.Players.LocalPlayer.Character:GetChildren())

            while true do
                local v364

                v363, v364 = v361(v362, v363)

                if v363 == nil then
                    break
                end
                if v364:IsA('BasePart') and v364.CanCollide == true then
                    v364.CanCollide = false
                end
            end
        end)
    elseif p360 == false then
        game:GetService('RunService'):UnbindFromRenderStep('Noclip')

        local v365, v366, v367 = pairs(game.Players.LocalPlayer.Character:GetChildren())

        while true do
            local v368

            v367, v368 = v365(v366, v367)

            if v367 == nil then
                break
            end
            if v368:IsA('BasePart') and v368.CanCollide == false then
                v368.CanCollide = true
            end
        end
    end
end)

_G.Speed = 2

v317:Toggle('\u{637}\u{64a}\u{627}\u{631}\u{627}\u{646}', function(p369)
    if game:GetService('UserInputService').KeyboardEnabled ~= true then
        if game:GetService('UserInputService').KeyboardEnabled == false then
            if p369 == true then
                _ImageButton.Visible = true
            else
                _ImageButton.Visible = false
            end
        end
    else
        if p369 == true then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true

            return (function(p370, _, p371)
                local _char = string.char
                local _sub = string.sub
                local _concat = table.concat
                local _ldexp = math.ldexp
                local v376 = getfenv or function()
                    return _ENV
                end
                local u377 = select
                local u378 = unpack or table.unpack
                local u379 = tonumber
                local __25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275 = (function(p380)
                    local v381 = 256
                    local v382 = {}
                    local v383 = {}

                    for v384 = 0, v381 - 1 do
                        local v385 = v384

                        v382[v385] = _char(v385)
                    end

                    local u386 = 1

                    local function v389()
                        local v387 = u379(_sub(p380, u386, u386), 36)

                        u386 = u386 + 1

                        local v388 = u379(_sub(p380, u386, u386 + v387 - 1), 36)

                        u386 = u386 + v387

                        return v388
                    end

                    local v390 = _char(v389())

                    v383[1] = v390

                    while u386 < #p380 do
                        local v391 = v389()
                        local v392

                        if v382[v391] then
                            v392 = v382[v391]
                        else
                            v392 = v390 .. _sub(v390, 1, 1)
                        end

                        v382[v381] = v390 .. _sub(v392, 1, 1)

                        local v393 = #v383 + 1

                        v381 = v381 + 1
                        v383[v393] = v392
                        v390 = v392
                    end

                    return table.concat(v383)
                end)([[25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275]])
                local v395 = bit or bit32
                local u403 = v395 and v395.bxor or function(p396, p397)
                    local v398 = 0
                    local v399 = 1

                    while 0 < p396 and 0 < p397 do
                        local v400 = p396 % 2
                        local v401 = p397 % 2

                        if v400 ~= v401 then
                            v398 = v398 + v399
                        end

                        p396 = (p396 - v400) / 2
                        p397 = (p397 - v401) / 2
                        v399 = v399 * 2
                    end

                    if p396 >= p397 then
                        p397 = p396
                    end

                    while p397 > 0 do
                        local v402 = p397 % 2

                        if v402 > 0 then
                            v398 = v398 + v399
                        end

                        p397 = (p397 - v402) / 2
                        v399 = v399 * 2
                    end

                    return v398
                end

                local function u409(p404, p405, p406)
                    if p406 then
                        local v407 = p404 / 2 ^ (p405 - 1) % 2 ^ (p406 - 1 - (p405 - 1) + 1)

                        return v407 - v407 % 1
                    else
                        local v408 = 2 ^ (p405 - 1)

                        return v408 <= p404 % (v408 + v408) and 1 or 0
                    end
                end

                local u410 = 1

                local function u419()
                    local v411, v412, v413, v414 = p370(__25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275, u410, u410 + 3)
                    local v415 = u403(v411, 245)
                    local v416 = u403(v412, 245)
                    local v417 = u403(v413, 245)
                    local v418 = u403(v414, 245)

                    u410 = u410 + 4

                    return v418 * 16777216 + v417 * 65536 + v416 * 256 + v415
                end
                local function u421()
                    local v420 = u403(p370(__25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275, u410, u410), 245)

                    u410 = u410 + 1

                    return v420
                end
                local function u426()
                    local v422, v423 = p370(__25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275, u410, u410 + 2)
                    local v424 = u403(v422, 245)
                    local v425 = u403(v423, 245)

                    u410 = u410 + 2

                    return v425 * 256 + v424
                end
                local function u433()
                    local v427 = u419()
                    local v428 = u419()
                    local v429 = 1
                    local v430 = u409(v428, 1, 20) * 4294967296 + v427
                    local v431 = u409(v428, 21, 31)
                    local v432 = (-1) ^ u409(v428, 32)

                    if v431 == 0 then
                        if v430 == 0 then
                            return v432 * 0
                        end

                        v431 = 1
                        v429 = 0
                    elseif v431 == 2047 then
                        return v430 == 0 and v432 * (1 / 0) or v432 * (0 / 0)
                    end

                    return _ldexp(v432, v431 - 1023) * (v429 + v430 / 4503599627370496)
                end

                local u434 = u419

                local function u439(p435)
                    if not p435 then
                        p435 = u434()

                        if p435 == 0 then
                            return ''
                        end
                    end

                    local v436 = _sub(__25C26T27526U26P27526T24224424824026U26Q27924L24924423W24023R23Q26U27227925524A24624424927I27K27M26U27127924Y24023L25424A23K23Q27E27027925224D24423R24424623L27Z26D27925923K24824424B24A24C24124N24A24A23L24L28F23L26U26S27924Z27929627629327525329227R29C27524N26U26V27924Q24Y26U26O27924M23P24024024128027925824B23Q23L28Q24627E26U27924B24023M27727H29026U28B27523M24A23R24E23Q23P28H27E27827524M24C23Z27E27G27524J24028I2AF25I26T25I2B02B11A25M26T2432B62B71R25M26U27328C28Q25224A24924928T24029I29U27525424423Q23Q2492402BQ26U26X27924H28G29X2AJ23R24024B24623W297275152BA2AM26T25727C2AL27928P23L24D26U26R2792BZ24124A2482961D21S22122D21G2CR2CT22D2502A827524I24024929T29N27528Z23R23L25H29M2A92DA25G2CK27924324923W24C24B2422BM26T25324A24123W24Y23W23R24A2BV2792DR2DT2AU24927T24C23L23W29E26T24L2C71C102512AB2CG24423X24H2AF23O23K24029621123H21I2DQ2DH27524624328G27D2EU26T25224Z2EY27E28127523N2D42E52E726T2332302FE2FE2242BA2F626T28P23X24Z2AF2A12DD2752AI24423M24B27F27925A24023W24X24A2FU2FW2EV24A24B2A528I2FQ26T2FY23W24G23P2DP28N28P28R28T2D126T24X24C29S2G42F12G62G823L23P27926F26C27929926T25X2C729I2H22972A32H52H02CB26T29329I2H427529I27529N2H52HD26T2CL2792A327527825H27626T27G2812HR26T2A328B2HV2HS2BC2I02HX26T27Q2FJ26T2CB2HQ2HP2HT26T2I32782HZ26T2HW2782I22IH2IB2I626T26F2HH26T2BW2752H529N29N26W2IO2752CL26Z2792H52CL2CL26Y2IY2IC28L2752IP2ID2HB2J22752812812GY2792CL28129I2JB27G26E2JE2IC27G2J62JB2812692GW27528B2JW2JA2752BC2682C727G2BC29I2J92CL2IP27G2HW2CL26B26T26A2IL2HL26T26L2KG2KI2CL26K26T26N2J727G26H2JQ27G27G26G2J728126J2JX26T28B26I2K52L326T2K82IZ26T26M2IC2JN26T2J12IT2752KW26T2JT2JF2H12C728B2HM29627G28B2L92IC25W2KJ2H52FJ2HI2LM2812CL2J927G25Z2JC2792812H02JU26T25Y2L22812LG2LN2JC2812LL2L725T2C72BC2LQ2M826T2K72J728B2MG2H528B28B2MK2BC25S2C727Q2MP2JY2I52L82KI28125V26T25U2J72BC2JP2LH2MR2NH2MK27Q2642L22BW2NL2K126T2IX2NO2962BC2IX2LU2812652NH2H52MS26626T2J92812672NH2JB2NE2JQ2BC2BC2NJ2M72J72BW2602L22IX2I72K22NQ2N72J928B2612O72OL2NF2H125E2NH2OC2J72NK2NM26T2NS2JB2NR2MN2OM2LU28B2632OR2NH2622JJ2AY27Q2752932AM2N12HS2792PJ2L72PL2792HA2PM2I72932MS29325X2J62BC2932HR25X25N2OW26T25G2HL2AY2BW2932HC2752PM2HO2QB2792D72752Q52BC2Q82H12PX2JD25J2H12Q22OB2Q42Q62IR2N72Q92QE2PK2OL2QJ2JD2O02QF2MH2QR2AY2R22BC25D2R42NH27426R2Q72I42QW26T2PM2MP2QI2QU29924Y2GZ2PP2792KF2762CB23M2442E62E92552E924N2C72HN2H024Z2E929B2QG24M24L24W24W24X2S12582EF2FJ2F82E42462E62E82AC26T2AE2AG2FS2FP2IX27525223K23R2C224B23L2522CE28G26U2J62ST28W23R2412DM24428J2F32CE2BB2792E424A24E2AU2AW23R2F02F22F426U2QD2A523M2FC2FF2FE21O2BA2H02GF2AS26T2TJ23L2AX2TT2TU2FH2F02EW2TO2LQ2DJ2DL2DN2GQ2412BT23L2DX23W21N2GW2KL2PG2962FJ2RG2S12MH2962HG2UO2962H82JD2QD2972932NA2792PY2I82I82SS2NH2PH2V82GY2992V329725X2J92R32RO2UX2UO2932N42RO2VE26T2JW2PH2V72792VR2IO2O22LM2JA25O2792U026P2V82NY2VD2S12VG2972UV2JD2VK2JD2932V02962V22962KU2VS2W32792WJ2VT2752W52752VP2J22SM2IQ2VJ2JQ2QW2VN2UO2VP2WQ2782WL2WP2JD26F2UN2IC2WR2PF26T2X22WO2XC2X62VX2V62VZ2W12962WS2IT2VH2HF2WG2VF2VL2I42S12WH2792HR2WK2V82XX2XE2OV2W62C72W82962QG2WB2WX2JD2WZ2JD2VP24B2JD2X32V82YE2Y32Y826F2532JD2BC2NG2QW27Q2UY2932BW2YS2OM2792WA2MH2HK2Y72WF2H52A32A32MP2HK2V02QW2JM2XP2YO2YZ2N72YR2XP29I2BW2JB2A32MV2HS2A32T42IB2WC2X32N72VI2JQ2IV2XT2IB2782Y72Y72MH2ZV2Y72N42J32KJ2MP2ZV2CL2IU26T29N28L2JB2CL2HA2HS2CL2HE2I42A32JI2ZG2I42ZJ2NH2NG2Z42N62Z32I42YU2ZM26T310M2N72BL2XQ2QA2JB29I2U02RO2QA2XO28B2H02972HA311B2MH2QW310C2Y62Y8311J311F2YA2O32962CL311B311E2YV2LU2XP311Q2XR2WD2I42XO2A3311E2ZS2XI27521W2WB2XM2H12WU3122311K2YV2WF2VO29622K2YF2XE312G2YJ2UX31292Y7311R2XS2YB2XV275312J2V62X426T312T2X72XK2WR2UV239312H312V31322VA279312T26T2VE2MA2LW2PT2Y92932ZF311X310W311X2V831102JQ2Z02962A32UV310U2Z52UU2N72Z82JD2ZA2N72ZC2HJ2ZE2ZD2ZH2J72ZK2JQ310S2ZO2V6313Q2ZX312A29N314A310B314F2V02ZR2ZZ3122310A2ZV2JJ314K2LA2J4311I29N31092IQ311H310E31232HN2KJ310J310S310Z2Z73144310Q2MH310S313G310S313I3151313T311131172N731142X931122ON296311A314X31252YJ2MA2JP2932JB311L2932MK29I2CB310P2OT2JB2ZR2V13149311N279315L3139314Y2JA2PC313D2YP2JD313G2QW2BW2XO2VV315S26T2K42LA316231362XQ26T2L52962HQ2CB29N2IA314N316W2XP316Y2I4310G2US316S2KI2IQ3170310F31752N731702A331722UV316J315X2LR2US2QD2H52962RR313T31212H0317K2RQ2H3311K317T2N52762QG2E423M27Z2H02A72S32E927O2H029B2H02442RX2E929T2H024N2VE2Q12Y8311V2HK25V27Q29329N2QA312V318N2XE31662NA31212NA29I2H026D2J12WE317A2V82N12PV2Q22H0318I2N7318K2JD318Z312U2V8319B312V315Q2WR317T318V311J251313L275318Y2JD314D2XE31932QP318H2XQ318J318L2KK311M312V2KL316O26T2KY2W6318U2QV296319L2HK319N319B27G315W31922R131952WW313W3198319X2M6293281312V31AM319R3126319I31A731AB2JD2LT2752RN2UW2V12ZC2GA317Y31802793182294317331842S52E931892H02RY2H0318C27924N2L12IT31AH31B031AJ29I25V318W2IC318O2V827G31A529725H2WQ317C2XE31A4319T3196319V319831BR319B316V319D31AS311E31BY319Z31C131AG319U2RO319W2JD319G27G319F2YF2V82KF31BW29631CD31AN319C27931C2318G31C431CI31AK2JD2LC29328B312V31D331CF31CR2XW2WQ2BC2AM31AZ317U26S2UV2F02UC2DM2DO2U024X2UH2UJ2MP25Q2S1316J31212Y4317S2W9317T31DU275, u410, u410 + p435 - 1)

                    u410 = u410 + p435

                    local v437 = {}

                    for v438 = 1, #v436 do
                        v437[v438] = _char(u403(p370(_sub(v436, v438, v438)), 245))
                    end

                    return _concat(v437)
                end
                local function u440(...)
                    return {...}, u377('#', ...)
                end
                local function u454()
                    local v441 = {}
                    local v442 = {}
                    local v443 = {
                        [#{
                            {
                                614,
                                455,
                                288,
                                227,
                            },
                            {
                                33,
                                380,
                                308,
                                690,
                            },
                        }] = v442,
                        [#{
                            {
                                625,
                                691,
                                449,
                                430,
                            },
                            {
                                888,
                                651,
                                329,
                                866,
                            },
                            '1 + 1 = 111',
                        }] = nil,
                        [#{
                            '1 + 1 = 111',
                            {
                                664,
                                569,
                                944,
                                915,
                            },
                            '1 + 1 = 111',
                            '1 + 1 = 111',
                        }] = {},
                        [#{
                            {
                                596,
                                777,
                                914,
                                215,
                            },
                        }] = v441,
                    }
                    local v444 = {}

                    for v445 = 1, u419()do
                        local v446 = u421()
                        local v447 = nil

                        if v446 == 2 then
                            v447 = u421() ~= 0
                        elseif v446 == 0 then
                            v447 = u433()
                        elseif v446 == 3 then
                            v447 = u439()
                        end

                        v444[v445] = v447
                    end
                    for v448 = 1, u419()do
                        local v449 = u421()

                        if u409(v449, 1, 1) == 0 then
                            local v450 = u409(v449, 2, 3)
                            local v451 = u409(v449, 4, 6)
                            local v452 = {
                                u426(),
                                u426(),
                                nil,
                                nil,
                            }

                            if v450 == 0 then
                                v452[#{
                                    {
                                        224,
                                        153,
                                        212,
                                        931,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        866,
                                        267,
                                        957,
                                        830,
                                    },
                                }] = u426()
                                v452[4] = u426()
                            elseif v450 == 1 then
                                v452[3] = u419()
                            elseif v450 == 2 then
                                v452[3] = u419() - 65536
                            elseif v450 == 3 then
                                v452[3] = u419() - 65536
                                v452[4] = u426()
                            end
                            if u409(v451, 1, 1) == 1 then
                                v452[2] = v444[v452[2] ]
                            end
                            if u409(v451, 2, 2) == 1 then
                                v452[3] = v444[v452[3] ]
                            end
                            if u409(v451, 3, 3) == 1 then
                                v452[4] = v444[v452[4] ]
                            end

                            v441[v448] = v452
                        end
                    end
                    for v453 = 1, u419()do
                        v442[v453 - 1] = u454()
                    end

                    v443[3] = u421()

                    return v443
                end
                local function u1011(p455, p456, p457)
                    if p455 == true then
                        p455 = u454() or p455
                    end

                    return function(...)
                        local v458 = p455[1]
                        local v459 = p455[3]
                        local v460 = p455[2]
                        local v461 = u377('#', ...) - 1
                        local v462 = {...}
                        local v463 = {}
                        local v464 = {}
                        local v465 = 1
                        local v466 = {}

                        for v467 = 0, v461 do
                            if v459 <= v467 then
                                v464[v467 - v459] = v462[v467 + 1]
                            else
                                v463[v467] = v462[v467 + #{
                                    '1 + 1 = 111',
                                }]
                            end
                        end

                        local _ = v461 - v459 + 1

                        while true do
                            local v468 = v458[v465]
                            local v469 = v468[1]

                            if v469 > 35 then
                                if v469 > #{
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        937,
                                        399,
                                        883,
                                        410,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        617,
                                        882,
                                        735,
                                        653,
                                    },
                                    {
                                        977,
                                        314,
                                        341,
                                        518,
                                    },
                                    {
                                        187,
                                        91,
                                        484,
                                        590,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        44,
                                        347,
                                        260,
                                        950,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        528,
                                        270,
                                        273,
                                        255,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        952,
                                        701,
                                        589,
                                        483,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        601,
                                        835,
                                        892,
                                        141,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        517,
                                        276,
                                        588,
                                        767,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        478,
                                        870,
                                        821,
                                        842,
                                    },
                                    {
                                        86,
                                        170,
                                        725,
                                        559,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        4,
                                        896,
                                        283,
                                        232,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        473,
                                        314,
                                        645,
                                        116,
                                    },
                                    {
                                        73,
                                        234,
                                        702,
                                        587,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        156,
                                        580,
                                        330,
                                        294,
                                    },
                                    {
                                        905,
                                        580,
                                        535,
                                        126,
                                    },
                                    {
                                        877,
                                        307,
                                        158,
                                        5,
                                    },
                                    {
                                        569,
                                        167,
                                        304,
                                        268,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        760,
                                        954,
                                        976,
                                        854,
                                    },
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    '1 + 1 = 111',
                                    {
                                        874,
                                        68,
                                        997,
                                        331,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        464,
                                        780,
                                        426,
                                        889,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        90,
                                        311,
                                        852,
                                        760,
                                    },
                                    {
                                        552,
                                        552,
                                        243,
                                        767,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        421,
                                        19,
                                        57,
                                        907,
                                    },
                                    {
                                        688,
                                        32,
                                        147,
                                        691,
                                    },
                                    '1 + 1 = 111',
                                    {
                                        43,
                                        424,
                                        410,
                                        976,
                                    },
                                } then
                                    if v469 > 62 then
                                        if v469 > #{
                                            '1 + 1 = 111',
                                            {
                                                218,
                                                664,
                                                922,
                                                541,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                618,
                                                522,
                                                851,
                                                799,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                801,
                                                432,
                                                181,
                                                852,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                345,
                                                231,
                                                60,
                                                570,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                3,
                                                151,
                                                869,
                                                454,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                600,
                                                94,
                                                586,
                                                239,
                                            },
                                            {
                                                450,
                                                330,
                                                80,
                                                735,
                                            },
                                            {
                                                204,
                                                134,
                                                285,
                                                581,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                637,
                                                7,
                                                327,
                                                816,
                                            },
                                            {
                                                678,
                                                154,
                                                856,
                                                282,
                                            },
                                            {
                                                294,
                                                303,
                                                900,
                                                649,
                                            },
                                            {
                                                46,
                                                408,
                                                194,
                                                916,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                227,
                                                31,
                                                237,
                                                885,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                406,
                                                943,
                                                385,
                                                798,
                                            },
                                            {
                                                37,
                                                203,
                                                834,
                                                565,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                430,
                                                365,
                                                655,
                                                858,
                                            },
                                            {
                                                201,
                                                620,
                                                589,
                                                721,
                                            },
                                            {
                                                632,
                                                350,
                                                167,
                                                827,
                                            },
                                            {
                                                328,
                                                117,
                                                483,
                                                533,
                                            },
                                            {
                                                108,
                                                985,
                                                962,
                                                343,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                504,
                                                836,
                                                860,
                                                248,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                491,
                                                660,
                                                778,
                                                158,
                                            },
                                            {
                                                575,
                                                45,
                                                374,
                                                334,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                266,
                                                938,
                                                173,
                                                555,
                                            },
                                            {
                                                753,
                                                528,
                                                966,
                                                290,
                                            },
                                            {
                                                52,
                                                709,
                                                912,
                                                282,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                377,
                                                411,
                                                241,
                                                581,
                                            },
                                            {
                                                171,
                                                283,
                                                11,
                                                374,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                561,
                                                946,
                                                204,
                                                927,
                                            },
                                        } then
                                            if v469 > 69 then
                                                if v469 > #{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        359,
                                                        394,
                                                        948,
                                                        546,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        419,
                                                        642,
                                                        736,
                                                        713,
                                                    },
                                                    {
                                                        2,
                                                        461,
                                                        12,
                                                        994,
                                                    },
                                                    {
                                                        134,
                                                        938,
                                                        687,
                                                        727,
                                                    },
                                                    {
                                                        895,
                                                        667,
                                                        608,
                                                        196,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        629,
                                                        126,
                                                        753,
                                                        479,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        874,
                                                        50,
                                                        923,
                                                        555,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        491,
                                                        76,
                                                        302,
                                                        25,
                                                    },
                                                    {
                                                        292,
                                                        68,
                                                        588,
                                                        672,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        598,
                                                        367,
                                                        514,
                                                        150,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        494,
                                                        987,
                                                        439,
                                                        435,
                                                    },
                                                    {
                                                        67,
                                                        936,
                                                        408,
                                                        624,
                                                    },
                                                    {
                                                        324,
                                                        767,
                                                        577,
                                                        391,
                                                    },
                                                    {
                                                        582,
                                                        591,
                                                        647,
                                                        8,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        846,
                                                        296,
                                                        304,
                                                        772,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        171,
                                                        547,
                                                        51,
                                                        395,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        612,
                                                        642,
                                                        545,
                                                        929,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        981,
                                                        279,
                                                        587,
                                                        703,
                                                    },
                                                    {
                                                        354,
                                                        183,
                                                        671,
                                                        22,
                                                    },
                                                    {
                                                        703,
                                                        824,
                                                        666,
                                                        18,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        328,
                                                        637,
                                                        943,
                                                        760,
                                                    },
                                                    {
                                                        869,
                                                        624,
                                                        303,
                                                        21,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        719,
                                                        194,
                                                        605,
                                                        158,
                                                    },
                                                    {
                                                        291,
                                                        641,
                                                        783,
                                                        841,
                                                    },
                                                    {
                                                        304,
                                                        898,
                                                        54,
                                                        742,
                                                    },
                                                    {
                                                        708,
                                                        502,
                                                        480,
                                                        395,
                                                    },
                                                    {
                                                        37,
                                                        987,
                                                        362,
                                                        357,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        830,
                                                        605,
                                                        982,
                                                        228,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        472,
                                                        724,
                                                        316,
                                                        921,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        387,
                                                        222,
                                                        286,
                                                        525,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        372,
                                                        176,
                                                        872,
                                                        946,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        293,
                                                        32,
                                                        813,
                                                        609,
                                                    },
                                                    {
                                                        326,
                                                        460,
                                                        680,
                                                        269,
                                                    },
                                                    {
                                                        820,
                                                        238,
                                                        64,
                                                        419,
                                                    },
                                                } then
                                                    if v469 == 71 then
                                                        return
                                                    end

                                                    v463[v468[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ] = {}
                                                else
                                                    v463[v468[2] ] = v463[v468[#{
                                                        {
                                                            360,
                                                            365,
                                                            529,
                                                            116,
                                                        },
                                                        {
                                                            356,
                                                            107,
                                                            100,
                                                            130,
                                                        },
                                                        {
                                                            356,
                                                            128,
                                                            429,
                                                            232,
                                                        },
                                                    }] ] * v463[v468[4] ]
                                                end
                                            elseif v469 ~= 68 then
                                                v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                                local v470 = v465 + 1
                                                local v471 = v458[v470]

                                                v463[v471[2] ] = p456[v471[3] ]

                                                local v472 = v470 + 1
                                                local v473 = v458[v472]

                                                v463[v473[2] ] = v463[v473[3] ][v473[4] ]

                                                local v474 = v472 + 1
                                                local v475 = v458[v474]

                                                v463[v475[2] ] = v463[v475[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        496,
                                                        727,
                                                        26,
                                                        759,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ] + v463[v475[4] ]

                                                local v476 = v474 + 1
                                                local v477 = v458[v476]

                                                if v463[v477[2] ] == v477[4] then
                                                    v465 = v477[3]
                                                else
                                                    v465 = v476 + 1
                                                end
                                            else
                                                v463[v468[2] ] = v463[v468[3] ] - v463[v468[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        974,
                                                        932,
                                                        252,
                                                        198,
                                                    },
                                                }] ]
                                            end
                                        elseif v469 > 64 then
                                            if v469 > 65 then
                                                if v469 <= 66 then
                                                    v463[v468[2] ] = p457[v468[3] ]

                                                    local v478 = v465 + 1
                                                    local v479 = v458[v478]

                                                    v463[v479[2] ] = v463[v479[3] ][v479[4] ]

                                                    local v480 = v478 + 1
                                                    local v481 = v458[v480]

                                                    v463[v481[2] ] = v463[v481[3] ][v481[4] ]

                                                    local v482 = v480 + 1
                                                    local v483 = v458[v482]

                                                    v463[v483[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ] = v463[v483[3] ][v483[4] ]

                                                    local v484 = v482 + 1
                                                    local v485 = v458[v484]

                                                    v463[v485[2] ] = p456[v485[3] ]

                                                    local v486 = v484 + 1
                                                    local v487 = v458[v486]

                                                    v463[v487[2] ] = v463[v487[3] ][v487[4] ]

                                                    local v488 = v486 + 1
                                                    local v489 = v458[v488]

                                                    v463[v489[2] ] = p456[v489[3] ]

                                                    local v490 = v488 + 1
                                                    local v491 = v458[v490]

                                                    v463[v491[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ] = v463[v491[3] ][v491[4] ]

                                                    local v492 = v490 + 1
                                                    local v493 = v458[v492]

                                                    v463[v493[2] ] = v463[v493[3] ] + v463[v493[4] ]

                                                    local v494 = v492 + 1
                                                    local v495 = v458[v494]

                                                    v463[v495[2] ] = v463[v495[3] ] * v463[v495[4] ]

                                                    local v496 = v494 + 1
                                                    local v497 = v458[v496]

                                                    v463[v497[#{
                                                        {
                                                            308,
                                                            268,
                                                            629,
                                                            10,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ] = p457[v497[3] ]

                                                    local v498 = v496 + 1
                                                    local v499 = v458[v498]

                                                    v463[v499[2] ] = v463[v499[3] ][v499[4] ]

                                                    local v500 = v498 + 1
                                                    local v501 = v458[v500]

                                                    v463[v501[2] ] = v463[v501[3] ][v501[4] ]

                                                    local v502 = v500 + 1
                                                    local v503 = v458[v502]

                                                    v463[v503[#{
                                                        {
                                                            587,
                                                            266,
                                                            273,
                                                            640,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ] = p457[v503[3] ]

                                                    local v504 = v502 + 1
                                                    local v505 = v458[v504]

                                                    v463[v505[2] ] = v463[v505[3] ][v505[4] ]

                                                    local v506 = v504 + 1
                                                    local v507 = v458[v506]

                                                    v463[v507[#{
                                                        {
                                                            180,
                                                            791,
                                                            445,
                                                            839,
                                                        },
                                                        {
                                                            782,
                                                            515,
                                                            615,
                                                            544,
                                                        },
                                                    }] ] = p456[v507[#{
                                                        {
                                                            51,
                                                            529,
                                                            899,
                                                            894,
                                                        },
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ]

                                                    local v508 = v506 + 1
                                                    local v509 = v458[v508]

                                                    v463[v509[2] ] = v463[v509[3] ][v509[4] ]

                                                    local v510 = v508 + 1
                                                    local v511 = v458[v510]

                                                    v463[v511[2] ] = p456[v511[3] ]

                                                    local v512 = v510 + 1
                                                    local v513 = v458[v512]

                                                    v463[v513[#{
                                                        {
                                                            658,
                                                            395,
                                                            295,
                                                            129,
                                                        },
                                                        {
                                                            670,
                                                            690,
                                                            310,
                                                            195,
                                                        },
                                                    }] ] = v463[v513[3] ][v513[4] ]

                                                    local v514 = v512 + 1
                                                    local v515 = v458[v514]

                                                    v463[v515[2] ] = v463[v515[3] ] + v463[v515[4] ]

                                                    local v516 = v514 + 1
                                                    local v517 = v458[v516]

                                                    v463[v517[2] ] = p456[v517[3] ]

                                                    local v518 = v516 + 1
                                                    local v519 = v458[v518]

                                                    v463[v519[2] ] = v463[v519[3] ][v519[4] ]

                                                    local v520 = v518 + 1
                                                    local v521 = v458[v520]

                                                    v463[v521[#{
                                                        {
                                                            884,
                                                            770,
                                                            919,
                                                            385,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ] = p456[v521[3] ]

                                                    local v522 = v520 + 1
                                                    local v523 = v458[v522]

                                                    v463[v523[2] ] = v463[v523[3] ][v523[4] ]

                                                    local v524 = v522 + 1
                                                    local v525 = v458[v524]

                                                    v463[v525[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ] = v463[v525[3] ] + v463[v525[4] ]

                                                    local v526 = v524 + 1
                                                    local v527 = v458[v526]

                                                    v463[v527[2] ] = v463[v527[3] ] * v527[4]

                                                    local v528 = v526 + 1
                                                    local v529 = v458[v528]

                                                    v463[v529[2] ] = v529[3]

                                                    local v530 = v528 + 1
                                                    local v531 = v458[v530]
                                                    local v532 = v531[2]

                                                    v463[v532] = v463[v532](u378(v463, v532 + 1, v531[3]))

                                                    local v533 = v530 + 1
                                                    local v534 = v458[v533]

                                                    v463[v534[2] ] = v463[v534[3] ][v534[4] ]

                                                    local v535 = v533 + 1
                                                    local v536 = v458[v535]

                                                    v463[v536[2] ] = v463[v536[3] ] * v463[v536[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                        {
                                                            752,
                                                            672,
                                                            440,
                                                            819,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ]

                                                    local v537 = v535 + 1
                                                    local v538 = v458[v537]

                                                    v463[v538[#{
                                                        {
                                                            17,
                                                            251,
                                                            892,
                                                            594,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ] = p457[v538[3] ]

                                                    local v539 = v537 + 1
                                                    local v540 = v458[v539]

                                                    v463[v540[2] ] = v463[v540[3] ][v540[4] ]

                                                    local v541 = v539 + 1
                                                    local v542 = v458[v541]

                                                    v463[v542[2] ] = v463[v542[3] ][v542[4] ]

                                                    local v543 = v541 + 1
                                                    local v544 = v458[v543]

                                                    v463[v544[2] ] = v463[v544[3] ][v544[4] ]

                                                    local v545 = v543 + 1
                                                    local v546 = v458[v545]

                                                    v463[v546[2] ] = v463[v546[3] ] - v463[v546[4] ]

                                                    local v547 = v545 + 1
                                                    local v548 = v458[v547]

                                                    v463[v548[2] ] = v463[v548[3] ] + v463[v548[4] ]

                                                    local v549 = v547 + 1
                                                    local v550 = v458[v549]

                                                    v463[v550[2] ] = p457[v550[3] ]

                                                    local v551 = v549 + 1
                                                    local v552 = v458[v551]

                                                    v463[v552[2] ] = v463[v552[3] ] * v463[v552[4] ]

                                                    local v553 = v551 + 1
                                                    local v554 = v458[v553]

                                                    v463[v554[2] ][v554[3] ] = v463[v554[4] ]

                                                    local v555 = v553 + 1

                                                    v463[v458[v555][2] ] = {}

                                                    local v556 = v555 + 1
                                                    local v557 = v458[v556]

                                                    v463[v557[2] ] = p456[v557[3] ]

                                                    local v558 = v556 + 1
                                                    local v559 = v458[v558]

                                                    v463[v559[2] ] = v463[v559[3] ][v559[4] ]

                                                    local v560 = v558 + 1
                                                    local v561 = v458[v560]

                                                    v463[v561[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ][v561[3] ] = v463[v561[4] ]

                                                    local v562 = v560 + 1
                                                    local v563 = v458[v562]

                                                    v463[v563[2] ] = p456[v563[3] ]

                                                    local v564 = v562 + 1
                                                    local v565 = v458[v564]

                                                    v463[v565[2] ] = v463[v565[3] ][v565[4] ]

                                                    local v566 = v564 + 1
                                                    local v567 = v458[v566]

                                                    v463[v567[2] ][v567[3] ] = v463[v567[4] ]

                                                    local v568 = v566 + 1
                                                    local v569 = v458[v568]

                                                    v463[v569[2] ] = p456[v569[3] ]

                                                    local v570 = v568 + 1
                                                    local v571 = v458[v570]

                                                    v463[v571[2] ] = v463[v571[3] ][v571[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                        {
                                                            459,
                                                            304,
                                                            826,
                                                            873,
                                                        },
                                                    }] ]

                                                    local v572 = v570 + 1
                                                    local v573 = v458[v572]

                                                    v463[v573[2] ][v573[#{
                                                        {
                                                            456,
                                                            602,
                                                            411,
                                                            12,
                                                        },
                                                        {
                                                            926,
                                                            468,
                                                            422,
                                                            398,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ] = v463[v573[4] ]

                                                    local v574 = v572 + 1
                                                    local v575 = v458[v574]

                                                    v463[v575[2] ] = p456[v575[#{
                                                        '1 + 1 = 111',
                                                        {
                                                            807,
                                                            258,
                                                            868,
                                                            798,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ]

                                                    local v576 = v574 + 1
                                                    local v577 = v458[v576]

                                                    v463[v577[2] ] = v463[v577[3] ][v577[4] ]

                                                    local v578 = v576 + 1
                                                    local v579 = v458[v578]

                                                    v463[v579[2] ][v579[3] ] = v463[v579[4] ]

                                                    local v580 = v578 + 1
                                                    local v581 = v458[v580]

                                                    p456[v581[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                    }] ] = v463[v581[2] ]
                                                    v465 = v458[v580 + 1][3]
                                                else
                                                    v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                                    local v582 = v465 + 1
                                                    local v583 = v458[v582]

                                                    v463[v583[2] ] = p456[v583[3] ]

                                                    local v584 = v582 + 1
                                                    local v585 = v458[v584]

                                                    v463[v585[2] ] = v463[v585[3] ][v585[4] ]

                                                    local v586 = v584 + 1
                                                    local v587 = v458[v586]

                                                    v463[v587[#{
                                                        {
                                                            394,
                                                            217,
                                                            848,
                                                            789,
                                                        },
                                                        {
                                                            48,
                                                            639,
                                                            167,
                                                            195,
                                                        },
                                                    }] ] = v463[v587[3] ] + v463[v587[4] ]

                                                    local v588 = v586 + 1
                                                    local v589 = v458[v588]

                                                    if v463[v589[2] ] ~= v589[4] then
                                                        v465 = v589[3]
                                                    else
                                                        v465 = v588 + 1
                                                    end
                                                end
                                            else
                                                v463[v468[2] ]()
                                            end
                                        elseif v469 ~= 63 then
                                            v463[v468[2] ] = -v463[v468[3] ]
                                        else
                                            v463[v468[2] ] = v463[v468[3] ] * v463[v468[4] ]
                                        end
                                    elseif v469 > 57 then
                                        if v469 > #{
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                748,
                                                275,
                                                422,
                                                230,
                                            },
                                            {
                                                341,
                                                612,
                                                872,
                                                113,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                378,
                                                818,
                                                557,
                                                70,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                37,
                                                363,
                                                457,
                                                991,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                182,
                                                934,
                                                388,
                                                55,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                533,
                                                405,
                                                183,
                                                643,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                227,
                                                228,
                                                614,
                                                309,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                331,
                                                394,
                                                881,
                                                644,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                488,
                                                308,
                                                695,
                                                500,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                209,
                                                759,
                                                108,
                                                736,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                204,
                                                82,
                                                47,
                                                561,
                                            },
                                            {
                                                278,
                                                513,
                                                215,
                                                857,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                177,
                                                638,
                                                513,
                                                201,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                555,
                                                31,
                                                871,
                                                307,
                                            },
                                            {
                                                335,
                                                928,
                                                962,
                                                534,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                82,
                                                403,
                                                724,
                                                264,
                                            },
                                            {
                                                454,
                                                813,
                                                290,
                                                972,
                                            },
                                            {
                                                320,
                                                64,
                                                66,
                                                551,
                                            },
                                            {
                                                769,
                                                654,
                                                421,
                                                556,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                241,
                                                314,
                                                248,
                                                994,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                626,
                                                509,
                                                386,
                                                29,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                285,
                                                738,
                                                313,
                                                152,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                341,
                                                905,
                                                10,
                                                47,
                                            },
                                        } then
                                            if v469 > 60 then
                                                if v469 ~= 61 then
                                                    local v590 = v468[2]
                                                    local v591 = v463[v468[3] ]

                                                    v463[v590 + 1] = v591
                                                    v463[v590] = v591[v468[4] ]
                                                else
                                                    v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                                    local v592 = v465 + 1
                                                    local v593 = v458[v592]

                                                    v463[v593[2] ] = p456[v593[3] ]

                                                    local v594 = v592 + 1
                                                    local v595 = v458[v594]

                                                    v463[v595[2] ] = v463[v595[3] ][v595[4] ]

                                                    local v596 = v594 + 1
                                                    local v597 = v458[v596]

                                                    v463[v597[2] ] = v463[v597[#{
                                                        {
                                                            538,
                                                            4,
                                                            152,
                                                            802,
                                                        },
                                                        '1 + 1 = 111',
                                                        {
                                                            187,
                                                            973,
                                                            347,
                                                            987,
                                                        },
                                                    }] ] + v463[v597[4] ]

                                                    local v598 = v596 + 1
                                                    local v599 = v458[v598]

                                                    if v463[v599[#{
                                                        {
                                                            960,
                                                            581,
                                                            287,
                                                            33,
                                                        },
                                                        {
                                                            854,
                                                            984,
                                                            40,
                                                            818,
                                                        },
                                                    }] ] == v599[4] then
                                                        v465 = v599[3]
                                                    else
                                                        v465 = v598 + 1
                                                    end
                                                end
                                            else
                                                local v600 = v468[2]
                                                local v601 = v463[v468[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        856,
                                                        261,
                                                        720,
                                                        326,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ]

                                                v463[v600 + 1] = v601
                                                v463[v600] = v601[v468[4] ]
                                            end
                                        else
                                            if v469 > 58 then
                                                v463[v468[2] ] = v468[3] ~= 0

                                                local v602 = v465 + 1
                                                local v603 = v458[v602]

                                                p457[v603[3] ] = v463[v603[2] ]

                                                local v604 = v602 + 1
                                                local v605 = v458[v604]

                                                v463[v605[2] ] = p456[v605[3] ]

                                                local v606 = v604 + 1
                                                local v607 = v458[v606]
                                                local v608 = v607[2]
                                                local v609 = v463[v607[3] ]

                                                v463[v608 + 1] = v609
                                                v463[v608] = v609[v607[4] ]

                                                local v610 = v606 + 1
                                                local v611 = v458[v610][2]

                                                v463[v611](v463[v611 + 1])

                                                local _ = v458[v610 + 1]

                                                return
                                            end

                                            local v612 = v460[v468[3] ]
                                            local u613 = {}
                                            local v619 = p371({}, {
                                                __index = function(_, p614)
                                                    local v615 = u613[p614]

                                                    return v615[1][v615[2] ]
                                                end,
                                                __newindex = function(_, p616, p617)
                                                    local v618 = u613[p616]

                                                    v618[1][v618[2] ] = p617
                                                end,
                                            })
                                            local v620 = u613

                                            for v621 = 1, v468[4]do
                                                v465 = v465 + 1

                                                local v622 = v458[v465]

                                                if v622[1] ~= 37 then
                                                    v620[v621 - 1] = {
                                                        p456,
                                                        v622[3],
                                                    }
                                                else
                                                    v620[v621 - 1] = {
                                                        v463,
                                                        v622[3],
                                                    }
                                                end

                                                v466[#v466 + 1] = v620
                                            end

                                            v463[v468[2] ] = u1011(v612, v619, p457)
                                        end
                                    elseif v469 > 55 then
                                        if v469 <= 56 then
                                            v463[v468[2] ] = v463[v468[#{
                                                '1 + 1 = 111',
                                                {
                                                    851,
                                                    420,
                                                    790,
                                                    883,
                                                },
                                                '1 + 1 = 111',
                                            }] ] + v463[v468[4] ]
                                        else
                                            p457[v468[3] ] = v463[v468[2] ]
                                        end
                                    elseif v469 <= 54 then
                                        v463[v468[2] ] = p457[v468[3] ]
                                    else
                                        v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                        local v623 = v465 + 1
                                        local v624 = v458[v623]

                                        v463[v624[2] ] = v624[3]

                                        local v625 = v623 + 1
                                        local v626 = v458[v625]

                                        v463[v626[2] ] = v626[3]

                                        local v627 = v625 + 1
                                        local v628 = v458[v627]

                                        v463[v628[2] ] = v628[3]

                                        local v629 = v627 + 1
                                        local v630 = v458[v629]
                                        local v631 = v630[2]

                                        v463[v631] = v463[v631](u378(v463, v631 + 1, v630[3]))

                                        local v632 = v629 + 1
                                        local v633 = v458[v632]

                                        v463[v633[2] ][v633[3] ] = v463[v633[4] ]
                                        v465 = v632 + 1

                                        local v634 = v458[v465]

                                        v463[v634[#{
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                        }] ] = p457[v634[3] ]
                                    end
                                elseif v469 > 44 then
                                    if v469 > 48 then
                                        if v469 > 50 then
                                            if v469 > 51 then
                                                if v469 <= 52 then
                                                    v463[v468[2] ][v468[3] ] = v468[4]
                                                else
                                                    p456[v468[3] ] = v463[v468[#{
                                                        {
                                                            777,
                                                            735,
                                                            989,
                                                            134,
                                                        },
                                                        {
                                                            884,
                                                            487,
                                                            289,
                                                            726,
                                                        },
                                                    }] ]
                                                end
                                            else
                                                local v635 = v460[v468[#{
                                                    {
                                                        864,
                                                        199,
                                                        231,
                                                        479,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ]
                                                local u636 = {}
                                                local v642 = p371({}, {
                                                    __index = function(_, p637)
                                                        local v638 = u636[p637]

                                                        return v638[1][v638[2] ]
                                                    end,
                                                    __newindex = function(_, p639, p640)
                                                        local v641 = u636[p639]

                                                        v641[1][v641[2] ] = p640
                                                    end,
                                                })
                                                local v643 = u636

                                                for v644 = 1, v468[4]do
                                                    v465 = v465 + 1

                                                    local v645 = v458[v465]

                                                    if v645[1] ~= 37 then
                                                        v643[v644 - 1] = {
                                                            p456,
                                                            v645[3],
                                                        }
                                                    else
                                                        v643[v644 - 1] = {
                                                            v463,
                                                            v645[3],
                                                        }
                                                    end

                                                    v466[#v466 + 1] = v643
                                                end

                                                v463[v468[2] ] = u1011(v635, v642, p457)
                                            end
                                        elseif v469 ~= #{
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                932,
                                                600,
                                                676,
                                                346,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                521,
                                                220,
                                                414,
                                                152,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                596,
                                                11,
                                                471,
                                                867,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                386,
                                                758,
                                                983,
                                                60,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                947,
                                                41,
                                                40,
                                                837,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                52,
                                                369,
                                                166,
                                                474,
                                            },
                                            {
                                                269,
                                                268,
                                                993,
                                                28,
                                            },
                                            {
                                                366,
                                                205,
                                                787,
                                                883,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                550,
                                                793,
                                                769,
                                                995,
                                            },
                                            {
                                                668,
                                                288,
                                                733,
                                                628,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                549,
                                                33,
                                                405,
                                                92,
                                            },
                                            '1 + 1 = 111',
                                            {
                                                847,
                                                158,
                                                71,
                                                856,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                106,
                                                89,
                                                734,
                                                292,
                                            },
                                            {
                                                306,
                                                261,
                                                750,
                                                275,
                                            },
                                            {
                                                207,
                                                454,
                                                252,
                                                110,
                                            },
                                            {
                                                767,
                                                392,
                                                263,
                                                70,
                                            },
                                            {
                                                660,
                                                124,
                                                868,
                                                820,
                                            },
                                            {
                                                917,
                                                907,
                                                513,
                                                300,
                                            },
                                            {
                                                538,
                                                692,
                                                960,
                                                319,
                                            },
                                            {
                                                688,
                                                304,
                                                544,
                                                962,
                                            },
                                            {
                                                217,
                                                950,
                                                620,
                                                250,
                                            },
                                            {
                                                337,
                                                685,
                                                229,
                                                558,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                        } then
                                            local v646 = v468[#{
                                                '1 + 1 = 111',
                                                '1 + 1 = 111',
                                            }]

                                            v463[v646](u378(v463, v646 + 1, v468[3]))
                                        else
                                            local v647 = v468[2]

                                            v463[v647](u378(v463, v647 + 1, v468[3]))
                                        end
                                    elseif v469 > 46 then
                                        if v469 <= 47 then
                                            v463[v468[2] ] = p457[v468[3] ]

                                            local v648 = v465 + 1
                                            local v649 = v458[v648]

                                            v463[v649[2] ] = v463[v649[3] ][v649[4] ]

                                            local v650 = v648 + 1
                                            local v651 = v458[v650]

                                            v463[v651[2] ] = v463[v651[3] ][v651[4] ]

                                            local v652 = v650 + 1
                                            local v653 = v458[v652]

                                            v463[v653[2] ][v653[3] ] = v463[v653[4] ]

                                            local v654 = v652 + 1
                                            local v655 = v458[v654]

                                            v463[v655[2] ] = p457[v655[3] ]

                                            local v656 = v654 + 1
                                            local v657 = v458[v656]

                                            if v463[v657[2] ] then
                                                v465 = v657[3]
                                            else
                                                v465 = v656 + 1
                                            end
                                        else
                                            local v658 = v468[2]

                                            v463[v658](v463[v658 + 1])
                                        end
                                    elseif v469 <= 45 then
                                        p457[v468[3] ] = v463[v468[2] ]
                                    elseif v463[v468[2] ] ~= v468[4] then
                                        v465 = v468[3]
                                    else
                                        v465 = v465 + 1
                                    end
                                elseif v469 > 39 then
                                    if v469 > 41 then
                                        if v469 > 42 then
                                            if v469 <= 43 then
                                                v463[v468[2] ] = v468[3]
                                            else
                                                v463[v468[2] ] = p456[v468[3] ]
                                            end
                                        elseif v463[v468[2] ] == v468[4] then
                                            v465 = v468[3]
                                        else
                                            v465 = v465 + 1
                                        end
                                    else
                                        if v469 ~= 40 then
                                            return
                                        end

                                        v463[v468[2] ][v468[3] ] = v468[4]
                                    end
                                elseif v469 > 37 then
                                    if v469 <= 38 then
                                        v463[v468[2] ] = p456[v468[3] ]
                                    else
                                        v463[v468[2] ] = v463[v468[3] ] * v468[4]
                                    end
                                elseif v469 <= 36 then
                                    v463[v468[2] ] = v463[v468[3] ] + v463[v468[#{
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            960,
                                            871,
                                            789,
                                            846,
                                        },
                                    }] ]
                                else
                                    v463[v468[2] ] = v463[v468[3] ]
                                end
                            elseif v469 > 17 then
                                if v469 > 26 then
                                    if v469 > 30 then
                                        if v469 > 32 then
                                            if v469 > 33 then
                                                if v469 ~= 34 then
                                                    v463[v468[2] ] = v463[v468[3] ] - v463[v468[#{
                                                        '1 + 1 = 111',
                                                        '1 + 1 = 111',
                                                        {
                                                            136,
                                                            44,
                                                            944,
                                                            960,
                                                        },
                                                        '1 + 1 = 111',
                                                    }] ]
                                                else
                                                    v463[v468[2] ]()
                                                end
                                            else
                                                v463[v468[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ] = p457[v468[3] ]

                                                local v659 = v465 + 1
                                                local v660 = v458[v659]

                                                v463[v660[#{
                                                    {
                                                        904,
                                                        632,
                                                        53,
                                                        834,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ] = v463[v660[3] ][v660[4] ]

                                                local v661 = v659 + 1
                                                local v662 = v458[v661]

                                                v463[v662[2] ] = v463[v662[3] ][v662[4] ]

                                                local v663 = v661 + 1
                                                local v664 = v458[v663]

                                                v463[v664[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        225,
                                                        557,
                                                        172,
                                                        56,
                                                    },
                                                }] ] = v463[v664[3] ][v664[4] ]

                                                local v665 = v663 + 1
                                                local v666 = v458[v665]

                                                v463[v666[2] ] = p456[v666[3] ]

                                                local v667 = v665 + 1
                                                local v668 = v458[v667]

                                                v463[v668[2] ] = v463[v668[3] ][v668[4] ]

                                                local v669 = v667 + 1
                                                local v670 = v458[v669]

                                                v463[v670[2] ] = p456[v670[3] ]

                                                local v671 = v669 + 1
                                                local v672 = v458[v671]

                                                v463[v672[2] ] = v463[v672[3] ][v672[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        943,
                                                        308,
                                                        597,
                                                        683,
                                                    },
                                                    {
                                                        148,
                                                        947,
                                                        725,
                                                        385,
                                                    },
                                                    {
                                                        193,
                                                        10,
                                                        34,
                                                        185,
                                                    },
                                                }] ]

                                                local v673 = v671 + 1
                                                local v674 = v458[v673]

                                                v463[v674[2] ] = v463[v674[3] ] + v463[v674[4] ]

                                                local v675 = v673 + 1
                                                local v676 = v458[v675]

                                                v463[v676[#{
                                                    {
                                                        48,
                                                        328,
                                                        210,
                                                        65,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ] = v463[v676[3] ] * v463[v676[4] ]

                                                local v677 = v675 + 1
                                                local v678 = v458[v677]

                                                v463[v678[2] ] = p457[v678[3] ]

                                                local v679 = v677 + 1
                                                local v680 = v458[v679]

                                                v463[v680[2] ] = v463[v680[3] ][v680[4] ]

                                                local v681 = v679 + 1
                                                local v682 = v458[v681]

                                                v463[v682[2] ] = v463[v682[3] ][v682[4] ]

                                                local v683 = v681 + 1
                                                local v684 = v458[v683]

                                                v463[v684[2] ] = p457[v684[3] ]

                                                local v685 = v683 + 1
                                                local v686 = v458[v685]

                                                v463[v686[2] ] = v463[v686[3] ][v686[4] ]

                                                local v687 = v685 + 1
                                                local v688 = v458[v687]

                                                v463[v688[2] ] = p456[v688[3] ]

                                                local v689 = v687 + 1
                                                local v690 = v458[v689]

                                                v463[v690[2] ] = v463[v690[3] ][v690[4] ]

                                                local v691 = v689 + 1
                                                local v692 = v458[v691]

                                                v463[v692[2] ] = p456[v692[3] ]

                                                local v693 = v691 + 1
                                                local v694 = v458[v693]

                                                v463[v694[2] ] = v463[v694[3] ][v694[4] ]

                                                local v695 = v693 + 1
                                                local v696 = v458[v695]

                                                v463[v696[2] ] = v463[v696[3] ] + v463[v696[4] ]

                                                local v697 = v695 + 1
                                                local v698 = v458[v697]

                                                v463[v698[2] ] = p456[v698[#{
                                                    {
                                                        994,
                                                        950,
                                                        745,
                                                        485,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ]

                                                local v699 = v697 + 1
                                                local v700 = v458[v699]

                                                v463[v700[2] ] = v463[v700[3] ][v700[4] ]

                                                local v701 = v699 + 1
                                                local v702 = v458[v701]

                                                v463[v702[2] ] = p456[v702[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        165,
                                                        988,
                                                        566,
                                                        322,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ]

                                                local v703 = v701 + 1
                                                local v704 = v458[v703]

                                                v463[v704[2] ] = v463[v704[3] ][v704[4] ]

                                                local v705 = v703 + 1
                                                local v706 = v458[v705]

                                                v463[v706[2] ] = v463[v706[3] ] + v463[v706[4] ]

                                                local v707 = v705 + 1
                                                local v708 = v458[v707]

                                                v463[v708[2] ] = v463[v708[3] ] * v708[4]

                                                local v709 = v707 + 1
                                                local v710 = v458[v709]

                                                v463[v710[2] ] = v710[3]

                                                local v711 = v709 + 1
                                                local v712 = v458[v711]
                                                local v713 = v712[2]

                                                v463[v713] = v463[v713](u378(v463, v713 + 1, v712[3]))

                                                local v714 = v711 + 1
                                                local v715 = v458[v714]

                                                v463[v715[2] ] = v463[v715[3] ][v715[4] ]

                                                local v716 = v714 + 1
                                                local v717 = v458[v716]

                                                v463[v717[2] ] = v463[v717[3] ] * v463[v717[4] ]

                                                local v718 = v716 + 1
                                                local v719 = v458[v718]

                                                v463[v719[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        505,
                                                        573,
                                                        990,
                                                        204,
                                                    },
                                                }] ] = p457[v719[3] ]

                                                local v720 = v718 + 1
                                                local v721 = v458[v720]

                                                v463[v721[2] ] = v463[v721[3] ][v721[4] ]

                                                local v722 = v720 + 1
                                                local v723 = v458[v722]

                                                v463[v723[2] ] = v463[v723[3] ][v723[#{
                                                    {
                                                        993,
                                                        714,
                                                        206,
                                                        706,
                                                    },
                                                    {
                                                        81,
                                                        519,
                                                        682,
                                                        588,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        520,
                                                        613,
                                                        696,
                                                        772,
                                                    },
                                                }] ]

                                                local v724 = v722 + 1
                                                local v725 = v458[v724]

                                                v463[v725[2] ] = v463[v725[3] ][v725[4] ]

                                                local v726 = v724 + 1
                                                local v727 = v458[v726]

                                                v463[v727[2] ] = v463[v727[3] ] - v463[v727[4] ]

                                                local v728 = v726 + 1
                                                local v729 = v458[v728]

                                                v463[v729[2] ] = v463[v729[3] ] + v463[v729[4] ]

                                                local v730 = v728 + 1
                                                local v731 = v458[v730]

                                                v463[v731[2] ] = p457[v731[3] ]

                                                local v732 = v730 + 1
                                                local v733 = v458[v732]

                                                v463[v733[2] ] = v463[v733[3] ] * v463[v733[4] ]

                                                local v734 = v732 + 1
                                                local v735 = v458[v734]

                                                v463[v735[2] ][v735[3] ] = v463[v735[4] ]
                                                v465 = v458[v734 + 1][3]
                                            end
                                        elseif v469 ~= 31 then
                                            v463[v468[2] ] = v468[3] ~= 0
                                        else
                                            v463[v468[2] ] = {}
                                        end
                                    elseif v469 > 28 then
                                        if v469 <= 29 then
                                            local v736 = v468[2]

                                            v463[v736] = v463[v736](v463[v736 + 1])
                                        else
                                            local v737 = v468[2]

                                            v463[v737] = v463[v737](u378(v463, v737 + 1, v468[#{
                                                '1 + 1 = 111',
                                                '1 + 1 = 111',
                                                {
                                                    856,
                                                    875,
                                                    227,
                                                    566,
                                                },
                                            }]))
                                        end
                                    elseif v469 <= 27 then
                                        v463[v468[2] ] = v468[3]
                                    else
                                        p456[v468[3] ] = v463[v468[2] ]
                                    end
                                elseif v469 > 21 then
                                    if v469 > 23 then
                                        if v469 > 24 then
                                            if v469 <= 25 then
                                                v463[v468[2] ] = v463[v468[3] ][v468[4] ]
                                            else
                                                v463[v468[2] ][v468[3] ] = v463[v468[4] ]
                                            end
                                        else
                                            v463[v468[2] ] = p457[v468[3] ]
                                        end
                                    elseif #{
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            885,
                                            788,
                                            206,
                                            767,
                                        },
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            322,
                                            996,
                                            927,
                                            480,
                                        },
                                        {
                                            879,
                                            685,
                                            305,
                                            128,
                                        },
                                        {
                                            896,
                                            946,
                                            502,
                                            807,
                                        },
                                        {
                                            554,
                                            579,
                                            861,
                                            103,
                                        },
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            327,
                                            980,
                                            997,
                                            109,
                                        },
                                        {
                                            312,
                                            477,
                                            616,
                                            995,
                                        },
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            374,
                                            126,
                                            828,
                                            427,
                                        },
                                        {
                                            717,
                                            704,
                                            423,
                                            225,
                                        },
                                        {
                                            249,
                                            3,
                                            6,
                                            271,
                                        },
                                        '1 + 1 = 111',
                                        {
                                            893,
                                            92,
                                            642,
                                            495,
                                        },
                                        '1 + 1 = 111',
                                    } >= v469 then
                                        if v463[v468[2] ] then
                                            v465 = v468[3]
                                        else
                                            v465 = v465 + 1
                                        end
                                    elseif v463[v468[2] ] then
                                        v465 = v468[3]
                                    else
                                        v465 = v465 + 1
                                    end
                                elseif v469 > 19 then
                                    if v469 ~= 20 then
                                        v465 = v468[3]
                                    else
                                        v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                        local v738 = v465 + 1
                                        local v739 = v458[v738]

                                        v463[v739[2] ] = p456[v739[3] ]

                                        local v740 = v738 + 1
                                        local v741 = v458[v740]

                                        v463[v741[2] ] = v463[v741[3] ][v741[4] ]

                                        local v742 = v740 + 1
                                        local v743 = v458[v742]

                                        v463[v743[2] ] = v463[v743[3] ] + v463[v743[4] ]

                                        local v744 = v742 + 1
                                        local v745 = v458[v744]

                                        if v463[v745[2] ] ~= v745[4] then
                                            v465 = v745[3]
                                        else
                                            v465 = v744 + 1
                                        end
                                    end
                                elseif v469 ~= 18 then
                                    v463[v468[2] ] = p457[v468[3] ]

                                    local v746 = v465 + 1
                                    local v747 = v458[v746]

                                    v463[v747[2] ] = v463[v747[3] ][v747[4] ]

                                    local v748 = v746 + 1
                                    local v749 = v458[v748]

                                    v463[v749[2] ] = v749[#{
                                        {
                                            214,
                                            529,
                                            926,
                                            521,
                                        },
                                        {
                                            164,
                                            634,
                                            605,
                                            413,
                                        },
                                        {
                                            241,
                                            650,
                                            355,
                                            971,
                                        },
                                    }]

                                    local v750 = v748 + 1
                                    local v751 = v458[v750]

                                    v463[v751[2] ] = v751[3]

                                    local v752 = v750 + 1
                                    local v753 = v458[v752]

                                    v463[v753[2] ] = v753[#{
                                        '1 + 1 = 111',
                                        {
                                            914,
                                            221,
                                            978,
                                            103,
                                        },
                                        '1 + 1 = 111',
                                    }]

                                    local v754 = v752 + 1
                                    local v755 = v458[v754]
                                    local v756 = v755[2]

                                    v463[v756] = v463[v756](u378(v463, v756 + 1, v755[3]))
                                    v465 = v754 + 1

                                    local v757 = v458[v465]

                                    v463[v757[2] ][v757[3] ] = v463[v757[4] ]
                                else
                                    v463[v468[2] ] = v468[3] ~= 0
                                end
                            elseif v469 > 8 then
                                if v469 > 12 then
                                    if v469 > 14 then
                                        if v469 > 15 then
                                            if v469 <= 16 then
                                                v463[v468[2] ] = v463[v468[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        250,
                                                        730,
                                                        965,
                                                        354,
                                                    },
                                                }] ][v468[4] ]

                                                local v758 = v465 + 1
                                                local v759 = v458[v758]

                                                v463[v759[2] ] = p456[v759[3] ]

                                                local v760 = v758 + 1
                                                local v761 = v458[v760]

                                                v463[v761[2] ] = v463[v761[3] ][v761[4] ]

                                                local v762 = v760 + 1
                                                local v763 = v458[v762]

                                                v463[v763[#{
                                                    {
                                                        616,
                                                        765,
                                                        349,
                                                        631,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ] = v463[v763[3] ] + v463[v763[4] ]

                                                local v764 = v762 + 1
                                                local v765 = v458[v764]

                                                if v463[v765[2] ] == v765[4] then
                                                    v465 = v765[3]
                                                else
                                                    v465 = v764 + 1
                                                end
                                            else
                                                v463[v468[2] ] = p457[v468[3] ]

                                                local v766 = v465 + 1
                                                local v767 = v458[v766]

                                                v463[v767[2] ] = v463[v767[3] ][v767[4] ]

                                                local v768 = v766 + 1
                                                local v769 = v458[v768]

                                                v463[v769[2] ] = v463[v769[3] ][v769[4] ]

                                                local v770 = v768 + 1
                                                local v771 = v458[v770]
                                                local v772 = v771[2]
                                                local v773 = v463[v771[3] ]

                                                v463[v772 + 1] = v773
                                                v463[v772] = v773[v771[4] ]

                                                local v774 = v770 + 1
                                                local v775 = v458[v774][2]

                                                v463[v775] = v463[v775](v463[v775 + 1])

                                                local v776 = v774 + 1
                                                local v777 = v458[v776]

                                                v463[v777[2] ] = v463[v777[3] ][v777[4] ]

                                                local v778 = v776 + 1
                                                local v779 = v458[v778]

                                                v463[v779[2] ] = v463[v779[3] ][v779[4] ]

                                                local v780 = v778 + 1

                                                v463[v458[v780][#{
                                                    {
                                                        803,
                                                        74,
                                                        206,
                                                        966,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ] = {}

                                                local v781 = v780 + 1
                                                local v782 = v458[v781]

                                                v463[v782[2] ][v782[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ] = v782[4]

                                                local v783 = v781 + 1
                                                local v784 = v458[v783]

                                                v463[v784[2] ][v784[3] ] = v784[#{
                                                    {
                                                        20,
                                                        697,
                                                        864,
                                                        83,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        996,
                                                        957,
                                                        937,
                                                        180,
                                                    },
                                                    '1 + 1 = 111',
                                                }]

                                                local v785 = v783 + 1
                                                local v786 = v458[v785]

                                                v463[v786[2] ][v786[3] ] = v786[4]

                                                local v787 = v785 + 1
                                                local v788 = v458[v787]

                                                v463[v788[2] ][v788[3] ] = v788[4]

                                                local v789 = v787 + 1

                                                v463[v458[v789][2] ] = {}

                                                local v790 = v789 + 1
                                                local v791 = v458[v790]

                                                v463[v791[#{
                                                    {
                                                        837,
                                                        932,
                                                        412,
                                                        132,
                                                    },
                                                    {
                                                        158,
                                                        237,
                                                        819,
                                                        178,
                                                    },
                                                }] ][v791[3] ] = v791[4]

                                                local v792 = v790 + 1
                                                local v793 = v458[v792]

                                                v463[v793[#{
                                                    {
                                                        586,
                                                        722,
                                                        977,
                                                        83,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ][v793[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        21,
                                                        452,
                                                        726,
                                                        733,
                                                    },
                                                }] ] = v793[4]

                                                local v794 = v792 + 1
                                                local v795 = v458[v794]

                                                v463[v795[2] ][v795[3] ] = v795[4]

                                                local v796 = v794 + 1
                                                local v797 = v458[v796]

                                                v463[v797[2] ][v797[3] ] = v797[4]

                                                local v798 = v796 + 1
                                                local v799 = v458[v798]

                                                v463[v799[2] ] = p457[v799[3] ]

                                                local v800 = v798 + 1
                                                local v801 = v458[v800]

                                                v463[v801[2] ] = v463[v801[3] ][v801[4] ]

                                                local v802 = v800 + 1
                                                local v803 = v458[v802]

                                                v463[v803[2] ] = p457[v803[3] ]

                                                local v804 = v802 + 1
                                                local v805 = v458[v804]

                                                v463[v805[2] ] = v463[v805[3] ][v805[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        782,
                                                        414,
                                                        151,
                                                        743,
                                                    },
                                                    '1 + 1 = 111',
                                                }] ]

                                                local v806 = v804 + 1
                                                local v807 = v458[v806]

                                                v463[v807[2] ] = v807[3]

                                                local v808 = v806 + 1
                                                local v809 = v458[v808]

                                                v463[v809[2] ] = p457[v809[3] ]

                                                local v810 = v808 + 1
                                                local v811 = v458[v810]

                                                v463[v811[2] ] = v463[v811[3] ][v811[4] ]

                                                local v812 = v810 + 1
                                                local v813 = v458[v812]
                                                local v814 = v813[2]

                                                v463[v814] = v463[v814](u378(v463, v814 + 1, v813[3]))

                                                local v815 = v812 + 1
                                                local v816 = v458[v815]

                                                v463[v816[2] ] = p457[v816[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ]

                                                local v817 = v815 + 1
                                                local v818 = v458[v817]

                                                v463[v818[2] ] = v463[v818[3] ][v818[4] ]

                                                local v819 = v817 + 1
                                                local v820 = v458[v819]

                                                v463[v820[2] ] = v820[3]

                                                local v821 = v819 + 1
                                                local v822 = v458[v821]

                                                v463[v822[2] ] = v822[3]

                                                local v823 = v821 + 1
                                                local v824 = v458[v823]

                                                v463[v824[2] ] = v824[3]

                                                local v825 = v823 + 1
                                                local v826 = v458[v825]
                                                local v827 = v826[2]

                                                v463[v827] = v463[v827](u378(v463, v827 + 1, v826[3]))

                                                local v828 = v825 + 1
                                                local v829 = v458[v828]

                                                v463[v829[2] ][v829[3] ] = v463[v829[4] ]

                                                local v830 = v828 + 1
                                                local v831 = v458[v830]

                                                v463[v831[2] ][v831[3] ] = v831[4]

                                                local v832 = v830 + 1
                                                local v833 = v458[v832]

                                                v463[v833[2] ][v833[3] ] = v833[4]

                                                local v834 = v832 + 1
                                                local v835 = v458[v834]

                                                v463[v835[2] ][v835[#{
                                                    {
                                                        901,
                                                        641,
                                                        794,
                                                        659,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ] = v835[4]

                                                local v836 = v834 + 1
                                                local v837 = v458[v836]

                                                v463[v837[2] ] = p457[v837[3] ]

                                                local v838 = v836 + 1
                                                local v839 = v458[v838]

                                                v463[v839[2] ] = v463[v839[3] ][v839[4] ]

                                                local v840 = v838 + 1
                                                local v841 = v458[v840]

                                                v463[v841[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ] = v841[3]

                                                local v842 = v840 + 1
                                                local v843 = v458[v842]

                                                v463[v843[#{
                                                    {
                                                        227,
                                                        11,
                                                        25,
                                                        927,
                                                    },
                                                    {
                                                        129,
                                                        820,
                                                        517,
                                                        11,
                                                    },
                                                }] ] = v843[3]

                                                local v844 = v842 + 1
                                                local v845 = v458[v844]
                                                local v846 = v845[#{
                                                    {
                                                        862,
                                                        78,
                                                        53,
                                                        959,
                                                    },
                                                    '1 + 1 = 111',
                                                }]

                                                v463[v846] = v463[v846](u378(v463, v846 + 1, v845[3]))

                                                local v847 = v844 + 1
                                                local v848 = v458[v847]

                                                v463[v848[2] ][v848[3] ] = v463[v848[4] ]

                                                local v849 = v847 + 1
                                                local v850 = v458[v849]

                                                v463[v850[2] ] = p457[v850[3] ]

                                                local v851 = v849 + 1
                                                local v852 = v458[v851]

                                                v463[v852[2] ] = v463[v852[#{
                                                    {
                                                        275,
                                                        476,
                                                        722,
                                                        738,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        391,
                                                        719,
                                                        681,
                                                        745,
                                                    },
                                                }] ][v852[4] ]

                                                local v853 = v851 + 1
                                                local v854 = v458[v853]

                                                v463[v854[2] ] = v854[3]

                                                local v855 = v853 + 1
                                                local v856 = v458[v855]

                                                v463[v856[2] ] = v463[v856[3] ]

                                                local v857 = v855 + 1
                                                local v858 = v458[v857]
                                                local v859 = v858[2]

                                                v463[v859] = v463[v859](u378(v463, v859 + 1, v858[3]))

                                                local v860 = v857 + 1
                                                local v861 = v458[v860]

                                                v463[v861[#{
                                                    {
                                                        217,
                                                        820,
                                                        331,
                                                        51,
                                                    },
                                                    {
                                                        633,
                                                        849,
                                                        431,
                                                        390,
                                                    },
                                                }] ][v861[3] ] = v463[v861[#{
                                                    '1 + 1 = 111',
                                                    {
                                                        969,
                                                        290,
                                                        620,
                                                        122,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ]

                                                local v862 = v860 + 1
                                                local v863 = v458[v862]

                                                v463[v863[2] ] = v463[v863[3] ][v863[4] ]

                                                local v864 = v862 + 1
                                                local v865 = v458[v864]

                                                v463[v865[2] ] = v463[v865[3] ][v865[4] ]

                                                local v866 = v864 + 1
                                                local v867 = v458[v866]

                                                v463[v867[2] ][v867[3] ] = v463[v867[4] ]

                                                local v868 = v866 + 1
                                                local v869 = v458[v868]

                                                v463[v869[2] ] = v869[3] ~= 0

                                                local v870 = v868 + 1
                                                local v871 = v458[v870]

                                                p457[v871[3] ] = v463[v871[2] ]

                                                local v872 = v870 + 1
                                                local v873 = v458[v872]

                                                v463[v873[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }] ] = p457[v873[3] ]

                                                local v874 = v872 + 1
                                                local v875 = v458[v874]

                                                v463[v875[2] ] = v463[v875[3] ][v875[4] ]

                                                local v876 = v874 + 1
                                                local v877 = v458[v876]

                                                v463[v877[2] ] = v877[3]

                                                local v878 = v876 + 1
                                                local v879 = v458[v878]

                                                v463[v879[2] ] = v463[v879[3] ]

                                                local v880 = v878 + 1
                                                local v881 = v458[v880]
                                                local v882 = v881[2]

                                                v463[v882] = v463[v882](u378(v463, v882 + 1, v881[3]))

                                                local v883 = v880 + 1
                                                local v884 = v458[v883]

                                                v463[v884[2] ] = p457[v884[3] ]

                                                local v885 = v883 + 1
                                                local v886 = v458[v885]

                                                v463[v886[2] ] = v463[v886[3] ][v886[4] ]

                                                local v887 = v885 + 1
                                                local v888 = v458[v887]

                                                v463[v888[2] ] = v888[#{
                                                    {
                                                        646,
                                                        96,
                                                        233,
                                                        752,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        498,
                                                        461,
                                                        280,
                                                        605,
                                                    },
                                                }]

                                                local v889 = v887 + 1
                                                local v890 = v458[v889]

                                                v463[v890[2] ] = v463[v890[3] ]

                                                local v891 = v889 + 1
                                                local v892 = v458[v891]
                                                local v893 = v892[2]

                                                v463[v893] = v463[v893](u378(v463, v893 + 1, v892[3]))

                                                local v894 = v891 + 1
                                                local v895 = v458[v894]

                                                v463[v895[2] ][v895[3] ] = v895[4]

                                                local v896 = v894 + 1
                                                local v897 = v458[v896]

                                                v463[v897[2] ] = p457[v897[3] ]

                                                local v898 = v896 + 1
                                                local v899 = v458[v898]

                                                v463[v899[2] ] = v463[v899[3] ][v899[4] ]

                                                local v900 = v898 + 1
                                                local v901 = v458[v900]

                                                v463[v901[2] ] = v901[3]

                                                local v902 = v900 + 1
                                                local v903 = v458[v902]

                                                v463[v903[2] ] = v903[3]

                                                local v904 = v902 + 1
                                                local v905 = v458[v904]

                                                v463[v905[#{
                                                    {
                                                        140,
                                                        858,
                                                        861,
                                                        879,
                                                    },
                                                    {
                                                        31,
                                                        655,
                                                        862,
                                                        53,
                                                    },
                                                }] ] = v905[#{
                                                    {
                                                        709,
                                                        909,
                                                        845,
                                                        167,
                                                    },
                                                    {
                                                        251,
                                                        644,
                                                        215,
                                                        246,
                                                    },
                                                    {
                                                        299,
                                                        861,
                                                        398,
                                                        776,
                                                    },
                                                }]

                                                local v906 = v904 + 1
                                                local v907 = v458[v906]
                                                local v908 = v907[#{
                                                    {
                                                        767,
                                                        561,
                                                        783,
                                                        471,
                                                    },
                                                    '1 + 1 = 111',
                                                }]

                                                v463[v908] = v463[v908](u378(v463, v908 + 1, v907[3]))

                                                local v909 = v906 + 1
                                                local v910 = v458[v909]

                                                v463[v910[2] ][v910[#{
                                                    {
                                                        267,
                                                        399,
                                                        481,
                                                        579,
                                                    },
                                                    '1 + 1 = 111',
                                                    {
                                                        499,
                                                        239,
                                                        371,
                                                        969,
                                                    },
                                                }] ] = v463[v910[#{
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                    {
                                                        313,
                                                        418,
                                                        214,
                                                        235,
                                                    },
                                                    {
                                                        183,
                                                        240,
                                                        866,
                                                        515,
                                                    },
                                                }] ]

                                                local v911 = v909 + 1
                                                local v912 = v458[v911]

                                                v463[v912[2] ] = v463[v912[3] ][v912[4] ]

                                                local v913 = v911 + 1
                                                local v914 = v458[v913]

                                                v463[v914[2] ][v914[3] ] = v463[v914[4] ]

                                                local v915 = v913 + 1
                                                local v916 = v458[v915]

                                                v463[v916[2] ] = p457[v916[3] ]

                                                local v917 = v915 + 1
                                                local v918 = v458[v917]

                                                v463[v918[2] ] = v463[v918[3] ][v918[4] ]

                                                local v919 = v917 + 1
                                                local v920 = v458[v919]

                                                v463[v920[2] ] = v920[3]

                                                local v921 = v919 + 1
                                                local v922 = v458[v921]

                                                v463[v922[2] ] = v922[#{
                                                    {
                                                        527,
                                                        520,
                                                        144,
                                                        618,
                                                    },
                                                    {
                                                        84,
                                                        451,
                                                        48,
                                                        179,
                                                    },
                                                    {
                                                        787,
                                                        484,
                                                        737,
                                                        457,
                                                    },
                                                }]

                                                local v923 = v921 + 1
                                                local v924 = v458[v923]

                                                v463[v924[2] ] = v924[3]

                                                local v925 = v923 + 1
                                                local v926 = v458[v925]
                                                local v927 = v926[2]

                                                v463[v927] = v463[v927](u378(v463, v927 + 1, v926[#{
                                                    {
                                                        962,
                                                        937,
                                                        565,
                                                        828,
                                                    },
                                                    '1 + 1 = 111',
                                                    '1 + 1 = 111',
                                                }]))

                                                local v928 = v925 + 1
                                                local v929 = v458[v928]

                                                v463[v929[2] ][v929[3] ] = v463[v929[4] ]
                                                v465 = v928 + 1

                                                local v930 = v458[v465]

                                                v463[v930[2] ] = p457[v930[3] ]
                                            end
                                        else
                                            v463[v468[2] ] = v463[v468[3] ][v468[4] ]
                                        end
                                    elseif v469 ~= 13 then
                                        v463[v468[2] ][v468[3] ] = v463[v468[4] ]
                                    else
                                        v465 = v468[3]
                                    end
                                elseif v469 > 10 then
                                    if v469 ~= 11 then
                                        v463[v468[2] ] = -v463[v468[#{
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            {
                                                958,
                                                652,
                                                385,
                                                751,
                                            },
                                        }] ]
                                    elseif v463[v468[2] ] == v468[4] then
                                        v465 = v468[3]
                                    else
                                        v465 = v465 + 1
                                    end
                                elseif v469 <= 9 then
                                    v463[v468[2] ] = v463[v468[#{
                                        {
                                            62,
                                            988,
                                            322,
                                            420,
                                        },
                                        {
                                            688,
                                            227,
                                            251,
                                            369,
                                        },
                                        {
                                            284,
                                            137,
                                            690,
                                            738,
                                        },
                                    }] ][v468[4] ]

                                    local v931 = v465 + 1
                                    local v932 = v458[v931]

                                    v463[v932[2] ] = p456[v932[3] ]

                                    local v933 = v931 + 1
                                    local v934 = v458[v933]

                                    v463[v934[2] ] = v463[v934[3] ][v934[#{
                                        '1 + 1 = 111',
                                        {
                                            679,
                                            768,
                                            85,
                                            602,
                                        },
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                    }] ]

                                    local v935 = v933 + 1
                                    local v936 = v458[v935]

                                    v463[v936[2] ] = v463[v936[3] ] + v463[v936[4] ]

                                    local v937 = v935 + 1
                                    local v938 = v458[v937]

                                    if v463[v938[2] ] ~= v938[4] then
                                        v465 = v938[#{
                                            {
                                                72,
                                                16,
                                                617,
                                                252,
                                            },
                                            {
                                                140,
                                                320,
                                                811,
                                                218,
                                            },
                                            '1 + 1 = 111',
                                        }]
                                    else
                                        v465 = v937 + 1
                                    end
                                else
                                    local v939 = v468[2]

                                    v463[v939](u378(v463, v939 + 1, v468[3]))

                                    local v940 = v465 + 1
                                    local v941 = v458[v940]

                                    v463[v941[2] ] = v463[v941[#{
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        {
                                            558,
                                            511,
                                            812,
                                            148,
                                        },
                                    }] ][v941[4] ]

                                    local v942 = v940 + 1
                                    local v943 = v458[v942]

                                    v463[v943[2] ] = v463[v943[3] ][v943[4] ]

                                    local v944 = v942 + 1
                                    local v945 = v458[v944]

                                    v463[v945[2] ] = v463[v945[3] ][v945[4] ]
                                    v465 = v944 + 1

                                    local v946 = v458[v465]
                                    local v947 = v946[2]
                                    local v948 = v463[v946[3] ]

                                    v463[v947 + 1] = v948
                                    v463[v947] = v948[v946[#{
                                        {
                                            799,
                                            180,
                                            555,
                                            202,
                                        },
                                        '1 + 1 = 111',
                                        {
                                            11,
                                            56,
                                            709,
                                            262,
                                        },
                                        {
                                            115,
                                            924,
                                            479,
                                            342,
                                        },
                                    }] ]
                                end
                            elseif v469 > 3 then
                                if v469 > 5 then
                                    if v469 > 6 then
                                        if v469 <= 7 then
                                            v463[v468[2] ] = v463[v468[3] ] * v468[4]
                                        else
                                            v463[v468[2] ]()

                                            local v949 = v465 + 1
                                            local v950 = v458[v949]

                                            v463[v950[2] ] = p456[v950[3] ]

                                            local v951 = v949 + 1
                                            local v952 = v458[v951]

                                            v463[v952[2] ] = v463[v952[3] ][v952[4] ]

                                            local v953 = v951 + 1
                                            local v954 = v458[v953]

                                            v463[v954[2] ] = p456[v954[3] ]

                                            local v955 = v953 + 1
                                            local v956 = v458[v955]

                                            v463[v956[2] ] = v463[v956[3] ][v956[4] ]

                                            local v957 = v955 + 1
                                            local v958 = v458[v957]

                                            v463[v958[2] ] = v463[v958[3] ] + v463[v958[4] ]

                                            local v959 = v957 + 1
                                            local v960 = v458[v959]

                                            if v463[v960[2] ] == v960[4] then
                                                v465 = v960[3]
                                            else
                                                v465 = v959 + 1
                                            end
                                        end
                                    else
                                        v463[v468[2] ] = v463[v468[3] ][v468[4] ]

                                        local v961 = v465 + 1
                                        local v962 = v458[v961]

                                        v463[v962[2] ] = p456[v962[3] ]

                                        local v963 = v961 + 1
                                        local v964 = v458[v963]

                                        v463[v964[2] ] = v463[v964[3] ][v964[4] ]

                                        local v965 = v963 + 1
                                        local v966 = v458[v965]

                                        v463[v966[2] ] = v463[v966[3] ] + v463[v966[4] ]

                                        local v967 = v965 + 1
                                        local v968 = v458[v967]

                                        if v463[v968[#{
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                        }] ] == v968[4] then
                                            v465 = v968[3]
                                        else
                                            v465 = v967 + 1
                                        end
                                    end
                                else
                                    if v469 == #{
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                        '1 + 1 = 111',
                                    } then
                                        v463[v468[2] ][v468[3] ] = v468[4]

                                        local v969 = v465 + 1
                                        local v970 = v458[v969]

                                        v463[v970[2] ][v970[#{
                                            '1 + 1 = 111',
                                            {
                                                505,
                                                218,
                                                613,
                                                327,
                                            },
                                            {
                                                935,
                                                127,
                                                380,
                                                593,
                                            },
                                        }] ] = v970[4]

                                        local v971 = v969 + 1
                                        local v972 = v458[v971]

                                        v463[v972[2] ][v972[3] ] = v972[4]

                                        local v973 = v971 + 1
                                        local v974 = v458[v973]

                                        v463[v974[2] ][v974[3] ] = v974[4]

                                        local v975 = v973 + 1
                                        local v976 = v458[v975]

                                        p456[v976[3] ] = v463[v976[2] ]

                                        local v977 = v975 + 1

                                        v463[v458[v977][2] ] = {}

                                        local v978 = v977 + 1
                                        local v979 = v458[v978]

                                        v463[v979[2] ][v979[3] ] = v979[4]

                                        local v980 = v978 + 1
                                        local v981 = v458[v980]

                                        v463[v981[2] ][v981[3] ] = v981[#{
                                            '1 + 1 = 111',
                                            {
                                                926,
                                                199,
                                                932,
                                                484,
                                            },
                                            {
                                                293,
                                                761,
                                                300,
                                                957,
                                            },
                                            '1 + 1 = 111',
                                        }]

                                        local v982 = v980 + 1
                                        local v983 = v458[v982]

                                        v463[v983[2] ][v983[3] ] = v983[#{
                                            {
                                                53,
                                                72,
                                                223,
                                                401,
                                            },
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                            '1 + 1 = 111',
                                        }]

                                        local v984 = v982 + 1
                                        local v985 = v458[v984]

                                        v463[v985[2] ][v985[#{
                                            {
                                                856,
                                                401,
                                                635,
                                                359,
                                            },
                                            {
                                                925,
                                                419,
                                                821,
                                                393,
                                            },
                                            {
                                                118,
                                                308,
                                                19,
                                                470,
                                            },
                                        }] ] = v985[4]

                                        local v986 = v984 + 1
                                        local v987 = v458[v986]

                                        p456[v987[3] ] = v463[v987[2] ]

                                        local v988 = v986 + 1
                                        local v989 = v458[v988]

                                        v463[v989[#{
                                            '1 + 1 = 111',
                                            {
                                                287,
                                                65,
                                                63,
                                                928,
                                            },
                                        }] ] = v989[3]

                                        local v990 = v988 + 1
                                        local v991 = v458[v990]

                                        p457[v991[3] ] = v463[v991[2] ]

                                        local v992 = v990 + 1
                                        local v993 = v458[v992]

                                        v463[v993[#{
                                            '1 + 1 = 111',
                                            {
                                                175,
                                                386,
                                                203,
                                                759,
                                            },
                                        }] ] = p456[v993[3] ]

                                        local v994 = v992 + 1
                                        local v995 = v458[v994]
                                        local v996 = v995[2]
                                        local v997 = v463[v995[3] ]

                                        v463[v996 + 1] = v997
                                        v463[v996] = v997[v995[4] ]

                                        local v998 = v994 + 1
                                        local v999 = v458[v998][2]

                                        v463[v999](v463[v999 + 1])

                                        local v1000 = v998 + 1
                                        local v1001 = v458[v1000]

                                        v463[v1001[2] ] = p456[v1001[3] ]

                                        local v1002 = v1000 + 1
                                        local v1003 = v458[v1002]
                                        local v1004 = v1003[2]
                                        local v1005 = v463[v1003[3] ]

                                        v463[v1004 + 1] = v1005
                                        v463[v1004] = v1005[v1003[4] ]

                                        local v1006 = v1002 + 1
                                        local v1007 = v458[v1006][2]

                                        v463[v1007](v463[v1007 + 1])

                                        local _ = v458[v1006 + 1]

                                        return
                                    end

                                    v463[v468[2] ] = v463[v468[#{
                                        '1 + 1 = 111',
                                        {
                                            128,
                                            78,
                                            920,
                                            396,
                                        },
                                        '1 + 1 = 111',
                                    }] ]
                                end
                            elseif v469 > #{
                                {
                                    240,
                                    879,
                                    523,
                                    193,
                                },
                            } then
                                if v469 <= 2 then
                                    if v463[v468[2] ] ~= v468[4] then
                                        v465 = v468[3]
                                    else
                                        v465 = v465 + 1
                                    end
                                else
                                    local v1008 = v468[2]

                                    v463[v1008] = v463[v1008](u378(v463, v1008 + 1, v468[3]))
                                end
                            elseif v469 <= 0 then
                                local v1009 = v468[2]

                                v463[v1009] = v463[v1009](v463[v1009 + 1])
                            else
                                local v1010 = v468[2]

                                v463[v1010](v463[v1010 + 1])
                            end

                            v465 = v465 + 1
                        end
                    end
                end

                return u1011(true, {}, v376())()
            end)(string.byte, table.insert, setmetatable)
        end

        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false

        local v1012, v1013, v1014 = pairs(game.Workspace:GetChildren())

        while true do
            local v1015

            v1014, v1015 = v1012(v1013, v1014)

            if v1014 == nil then
                break
            end
            if v1015:IsA('Part') and v1015:FindFirstChild('BodyVelocity') then
                v1015:Destroy()
            end
        end
    end
end)
v317:Button('\u{631}\u{633}\u{628}\u{648}\u{646}', function()
    local v1016, v1017, v1018 = pairs(game.Players.LocalPlayer.Character:GetChildren())

    while true do
        local v1019

        v1018, v1019 = v1016(v1017, v1018)

        if v1018 == nil then
            break
        end
        if v1019:IsA('MeshPart') or v1019:IsA('Part') then
            v1019:Destroy()
        end
    end

    local v1020, v1021, v1022 = pairs(game.Players.LocalPlayer.Character:GetChildren())

    while true do
        local v1023

        v1022, v1023 = v1020(v1021, v1022)

        if v1022 == nil then
            break
        end
        if v1023:IsA('Accessory') then
            v1023.Handle:Destroy()
        end
    end

    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
        ';res',
    }))
end)
v317:TabFix()
v319:Toggle('Anti fling', function(p1024)
    getgenv().AntiFling = p1024

    spawn(function()
        while getgenv().AntiFling == false do
            wait()

            local v1025, v1026, v1027 = pairs(game:GetService('Players'):GetChildren())

            while true do
                local v1028

                v1027, v1028 = v1025(v1026, v1027)

                if v1027 == nil then
                    break
                end
                if v1028 ~= game.Players.LocalPlayer and v1028.Character then
                    local v1029, v1030, v1031 = pairs(v1028.Character:GetChildren())

                    while true do
                        local v1032

                        v1031, v1032 = v1029(v1030, v1031)

                        if v1031 == nil then
                            break
                        end
                        if v1032:IsA('BasePart') or v1032:IsA('Part') or v1032.Name == 'HumanoidRootPart' then
                            v1032.CanCollide = true
                            v1032.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                            v1032.Velocity = Vector3.new(0, 0, 0)
                            v1032.RotVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end
        end
    end)
    spawn(function()
        while getgenv().AntiFling == true do
            wait()

            local v1033, v1034, v1035 = pairs(game:GetService('Players'):GetChildren())

            while true do
                local v1036

                v1035, v1036 = v1033(v1034, v1035)

                if v1035 == nil then
                    break
                end
                if v1036 ~= game.Players.LocalPlayer and v1036.Character then
                    local v1037, v1038, v1039 = pairs(v1036.Character:GetChildren())

                    while true do
                        local v1040

                        v1039, v1040 = v1037(v1038, v1039)

                        if v1039 == nil then
                            break
                        end
                        if v1040:IsA('BasePart') or v1040:IsA('Part') or v1040.Name == 'HumanoidRootPart' then
                            v1040.CanCollide = false
                            v1040.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                            v1040.Velocity = Vector3.new(0, 0, 0)
                            v1040.RotVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end
        end
    end)
end)
v319:Toggle('Anti Sit', function(p1041)
    if p1041 == true then
        game:GetService('RunService'):BindToRenderStep('sit', 0, function()
            if game.Players.LocalPlayer.Character.Humanoid.Sit then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end)
    else
        game:GetService('RunService'):UnbindFromRenderStep('sit')
    end
end)
v319:Toggle('Anti AFK', function(p1042)
    getgenv().AntiAfk = p1042

    spawn(function()
        while getgenv().AntiAfk == true do
            wait(8)
            game:service('VirtualUser'):CaptureController()
            game:service('VirtualUser'):ClickButton2(Vector2.new())
        end
    end)
end)
v319:Toggle('\u{627}\u{644}\u{644}\u{64a}\u{644} / \u{627}\u{644}\u{646}\u{647}\u{627}\u{631}', function(p1043)
    if p1043 == true then
        game:GetService('RunService'):UnbindFromRenderStep('number 14')
        game:GetService('RunService'):BindToRenderStep('number 0', 0, function()
            game:GetService('Lighting').ClockTime = 0
        end)
    else
        game:GetService('RunService'):UnbindFromRenderStep('number 0')
        game:GetService('RunService'):BindToRenderStep('number 14', 0, function()
            game:GetService('Lighting').ClockTime = 14
        end)
    end
end)
v319:Button('\u{627}\u{644}\u{62a}\u{62c}\u{633}\u{633} \u{639}\u{644}\u{649} \u{645}\u{62d}\u{627}\u{62f}\u{62b}\u{627}\u{62a} \u{627}\u{644}\u{62e}\u{627}\u{635}', function()
    Config = {
        enabled = true,
        spyOnMyself = true,
        public = false,
        publicItalics = true,
    }
    PrivateProperties = {
        Color = Color3.fromRGB(0, 0, 0),
        Font = Enum.Font.SourceSansBold,
        TextSize = 23,
    }

    local _StarterGui = game:GetService('StarterGui')
    local _Players2 = game:GetService('Players')
    local _LocalPlayer10 = _Players2.LocalPlayer
    local _SayMessageRequest = game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest')
    local _OnMessageDoneFiltering = game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('OnMessageDoneFiltering')
    local u1049 = (_G.chatSpyInstance or 0) + 1

    _G.chatSpyInstance = u1049

    local function u1058(p1050, p1051)
        if _G.chatSpyInstance == u1049 then
            if p1050 ~= _LocalPlayer10 or p1051:lower():sub(1, 4) ~= '/spy' then
                if Config.enabled and (Config.spyOnMyself == true or p1050 ~= _LocalPlayer10) then
                    local u1052 = p1051:gsub('[\n\r]', ''):gsub('\t', ' '):gsub('[ ]+', ' ')
                    local u1053 = true
                    local v1057 = _OnMessageDoneFiltering.OnClientEvent:Connect(function(p1054, p1055)
                        if p1054.SpeakerUserId == p1050.UserId then
                            local v1056 = u1052

                            if p1054.Message == v1056:sub(#u1052 - #p1054.Message + 1) and (p1055 == 'All' or p1055 == 'Team' and Config.public == false and _Players2[p1054.FromSpeaker].Team == _LocalPlayer10.Team) then
                                u1053 = false
                            end
                        end
                    end)

                    wait(1)
                    v1057:Disconnect()

                    if u1053 and Config.enabled then
                        if Config.public then
                            _SayMessageRequest:FireServer((Config.publicItalics and '/me ' or '') .. '{SPY} [' .. p1050.DisplayName .. ']: ' .. u1052, 'All')
                        else
                            PrivateProperties.Text = '[' .. p1050.DisplayName .. ']: ' .. u1052

                            _StarterGui:SetCore('ChatMakeSystemMessage', PrivateProperties)
                        end
                    end
                end
            else
                Config.enabled = not Config.enabled

                wait(0.3)

                PrivateProperties.Text = '{SPY ' .. (Config.enabled and 'EN' or 'DIS') .. 'ABLED}'

                _StarterGui:SetCore('ChatMakeSystemMessage', PrivateProperties)
            end
        end
    end

    local v1059, v1060, v1061 = ipairs(_Players2:GetPlayers())

    while true do
        local u1062

        v1061, u1062 = v1059(v1060, v1061)

        if v1061 == nil then
            break
        end

        u1062.Chatted:Connect(function(p1063)
            u1058(u1062, p1063)
        end)
    end

    _Players2.PlayerAdded:Connect(function(p1064)
        p1064.Chatted:Connect(function(p1065)
            u1058(p1064, p1065)
        end)
    end)

    PrivateProperties.Text = '{SPY ' .. (Config.enabled and 'EN' or 'DIS') .. 'ABLED}'

    _StarterGui:SetCore('ChatMakeSystemMessage', PrivateProperties)

    local _Frame21 = _LocalPlayer10.PlayerGui.Chat.Frame

    _Frame21.ChatChannelParentFrame.Visible = true
    _Frame21.ChatBarParentFrame.Position = _Frame21.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), _Frame21.ChatChannelParentFrame.Size.Y)
end)
v319:Button('Infinite Yield', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
v319:Button('Nameless Admin', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)
v319:Button('\u{627}\u{639}\u{627}\u{62f}\u{629} \u{62f}\u{62e}\u{648}\u{644} \u{644}\u{644}\u{633}\u{64a}\u{631}\u{641}\u{631}', function()
    game:GetService('TeleportService'):Teleport(game.PlaceId)
end)
v319:Button('\u{62f}\u{62e}\u{648}\u{644} \u{633}\u{64a}\u{631}\u{641}\u{631} \u{627}\u{62e}\u{631}', function()
    local u1067 = {}
    local u1068 = ''
    local _hour = os.date('!*t').hour
    local _TeleportService = game:GetService('TeleportService')
    local _HttpService = game:GetService('HttpService')

    if not pcall(function()
        u1067 = _HttpService:JSONDecode(readfile('server-hop-temp.json'))
    end) then
        table.insert(u1067, _hour)
        pcall(function()
            local v1072 = _HttpService

            writefile('server-hop-temp.json', v1072:JSONEncode(u1067))
        end)
    end

    local function u1087(p1073)
        local v1074

        if u1068 ~= '' then
            v1074 = _HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. p1073 .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. u1068))
        else
            v1074 = _HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. p1073 .. '/servers/Public?sortOrder=Asc&limit=100'))
        end
        if v1074.nextPageCursor and v1074.nextPageCursor ~= 'null' and v1074.nextPageCursor ~= nil then
            u1068 = v1074.nextPageCursor
        end

        local v1075, v1076, v1077 = pairs(v1074.data)
        local v1078 = 0

        while true do
            local v1079

            v1077, v1079 = v1075(v1076, v1077)

            if v1077 == nil then
                break
            end

            local v1080 = true
            local u1081 = tostring(v1079.id)

            if tonumber(v1079.maxPlayers) > tonumber(v1079.playing) then
                local v1082, v1083, v1084 = pairs(u1067)

                while true do
                    local v1085

                    v1084, v1085 = v1082(v1083, v1084)

                    if v1084 == nil then
                        break
                    end
                    if v1078 == 0 then
                        if tonumber(_hour) ~= tonumber(v1085) then
                            pcall(function()
                                delfile('server-hop-temp.json')

                                u1067 = {}

                                table.insert(u1067, _hour)
                            end)
                        end
                    elseif u1081 == tostring(v1085) then
                        v1080 = false
                    end

                    v1078 = v1078 + 1
                end

                if v1080 == true then
                    table.insert(u1067, u1081)
                    wait()
                    pcall(function()
                        local v1086 = _HttpService

                        writefile('server-hop-temp.json', v1086:JSONEncode(u1067))
                        wait()
                        _TeleportService:TeleportToPlaceInstance(p1073, u1081, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    local v1089 = {
        Teleport = function(_, p1088)
            while wait() do
                pcall(function()
                    u1087(p1088)

                    if u1068 ~= '' then
                        u1087(p1088)
                    end
                end)
            end
        end,
    }

    v1089:Teleport(game.PlaceId)

    return v1089
end)
v320:Button('Astronaut', function()
    local _Animate = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=891621366'
    _Animate.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=891633237'
    _Animate.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=891667138'
    _Animate.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=891636393'
    _Animate.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=891627522'
    _Animate.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=891609353'
    _Animate.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=891617961'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Bubbly', function()
    local _Animate2 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate2.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=910004836'
    _Animate2.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=910009958'
    _Animate2.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=910034870'
    _Animate2.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=910025107'
    _Animate2.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=910016857'
    _Animate2.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=910001910'
    _Animate2.swimidle.SwimIdle.AnimationId = 'http://www.roblox.com/asset/?id=910030921'
    _Animate2.swim.Swim.AnimationId = 'http://www.roblox.com/asset/?id=910028158'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Cartoony', function()
    local _Animate3 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate3.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=742637544'
    _Animate3.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=742638445'
    _Animate3.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=742640026'
    _Animate3.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=742638842'
    _Animate3.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=742637942'
    _Animate3.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=742636889'
    _Animate3.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=742637151'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Elder', function()
    local _Animate4 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate4.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=845397899'
    _Animate4.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=845400520'
    _Animate4.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=845403856'
    _Animate4.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=845386501'
    _Animate4.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=845398858'
    _Animate4.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=845392038'
    _Animate4.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=845396048'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Knight', function()
    local _Animate5 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate5.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=657595757'
    _Animate5.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=657568135'
    _Animate5.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=657552124'
    _Animate5.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=657564596'
    _Animate5.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=658409194'
    _Animate5.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=658360781'
    _Animate5.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=657600338'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Levitation', function()
    local _Animate6 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate6.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=616006778'
    _Animate6.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=616008087'
    _Animate6.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=616013216'
    _Animate6.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=616010382'
    _Animate6.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=616008936'
    _Animate6.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=616003713'
    _Animate6.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=616005863'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Mage', function()
    local _Animate7 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate7.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=707742142'
    _Animate7.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=707855907'
    _Animate7.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=707897309'
    _Animate7.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=707861613'
    _Animate7.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=707853694'
    _Animate7.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=707826056'
    _Animate7.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=707829716'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Ninja', function()
    local _Animate8 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate8.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=656117400'
    _Animate8.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=656118341'
    _Animate8.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=656121766'
    _Animate8.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=656118852'
    _Animate8.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=656117878'
    _Animate8.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=656114359'
    _Animate8.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=656115606'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Pirate', function()
    local _Animate9 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate9.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=750781874'
    _Animate9.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=750782770'
    _Animate9.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=750785693'
    _Animate9.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=750783738'
    _Animate9.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=750782230'
    _Animate9.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=750779899'
    _Animate9.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=750780242'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Robot', function()
    local _Animate10 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate10.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=616088211'
    _Animate10.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=616089559'
    _Animate10.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=616095330'
    _Animate10.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=616091570'
    _Animate10.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=616090535'
    _Animate10.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=616086039'
    _Animate10.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=616087089'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Stylish', function()
    local _Animate11 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate11.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=616136790'
    _Animate11.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=616138447'
    _Animate11.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=616146177'
    _Animate11.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=616140816'
    _Animate11.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=616139451'
    _Animate11.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=616133594'
    _Animate11.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=616134815'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Superhero', function()
    local _Animate12 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate12.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=616111295'
    _Animate12.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=616113536'
    _Animate12.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=616122287'
    _Animate12.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=616117076'
    _Animate12.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=616115533'
    _Animate12.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=616104706'
    _Animate12.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=616108001'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Toy', function()
    local _Animate13 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate13.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=782841498'
    _Animate13.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=782845736'
    _Animate13.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=782843345'
    _Animate13.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=782842708'
    _Animate13.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=782847020'
    _Animate13.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=782843869'
    _Animate13.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=782846423'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Vampire', function()
    local _Animate14 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate14.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=1083445855'
    _Animate14.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=1083450166'
    _Animate14.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083473930'
    _Animate14.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083462077'
    _Animate14.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083455352'
    _Animate14.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083439238'
    _Animate14.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083443587'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Werewolf', function()
    local _Animate15 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate15.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=1083195517'
    _Animate15.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=1083214717'
    _Animate15.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083178339'
    _Animate15.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083216690'
    _Animate15.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083218792'
    _Animate15.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083182000'
    _Animate15.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=1083189019'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v320:Button('Zombie', function()
    local _Animate16 = game.Players.LocalPlayer.Character.Animate

    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)

    _Animate16.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=616158929'
    _Animate16.idle.Animation2.AnimationId = 'http://www.roblox.com/asset/?id=616160636'
    _Animate16.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=616168032'
    _Animate16.run.RunAnim.AnimationId = 'http://www.roblox.com/asset/?id=616163682'
    _Animate16.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=616161997'
    _Animate16.climb.ClimbAnim.AnimationId = 'http://www.roblox.com/asset/?id=616156119'
    _Animate16.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=616157476'
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
v321:ImageLabel('https://www.roblox.com/headshot-thumbnail/image?userId=1847542223&width=420&height=420&format=png', 'N0kia', 'Scripter / Ui Designer')
v321:ImageLabel('https://www.roblox.com/headshot-thumbnail/image?userId=12982577&width=420&height=420&format=png', 'Xwanted33', 'Scripter')
v321:ImageLabel('https://www.roblox.com/headshot-thumbnail/image?userId=1259903042&width=420&height=420&format=png', 'Banda Mod', 'Famous / Showcaser')
v321:TabFix()

local u1106 = {4334994690, 12982577, 3933568115}

coroutine.resume(coroutine.create(function()
    while wait(6) do
        local _, _ = pcall(function()
            local v1107, v1108, v1109 = pairs(game.Players:GetChildren())

            while true do
                local v1110

                v1109, v1110 = v1107(v1108, v1109)

                if v1109 == nil then
                    break
                end
                if v1110.Character and table.find(u1106, v1110.UserId) then
                    v1110.Character.Humanoid.DisplayName = '[\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}]' .. v1110.DisplayName
                end
            end
        end)
    end
end))
