local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Mohammed Hub",
    Icon = "crown", -- lucide icon
    Author = "by Mohammed",
    Folder = "Mohammed Hub",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = false,
    
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = false,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
    
    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
        KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "THE KING 123", "كيفك" },
        
        Note = "Example Key System.",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "نورت سكربت Mohammed",
        },
        
        -- ↓ Optional. You can remove it.
        URL = "https://mhamd12345.github.io/blox-fruits-services/",
        
        -- ↓ Optional. You can remove it.
        SaveKey = false, -- automatically save and load the key.
        
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})
Window:EditOpenButton({
    Title = "اضغط لفتح سكربت",
    Icon = "aperture",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})
Window:Tag({
    Title = "v1.0",
    Icon = "badge-check",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 0, -- from 0 to 13
})
local Tab = Window:Tab({
    Title = "قائمة رئيسية",
    Icon = "blend", -- optional
    Locked = false,
})
local Code = Tab:Code({
    Title = "رابط الدسكورد",
    Code = [[https://discord.gg/x2qpUxD4eg")]]
})
WindUI:Notify({
    Title = "نورت/ي ✨ السكربت",
    Content = "تم تفعيل سكربت Mohammed Hub",
    Duration = 3, -- 3 seconds
    Icon = "crown",
})

local Tab = Window:Tab({
    Title = "السكربتات",
    Icon = "scroll", -- optional
    Locked = false,
})
local Button = Tab:Button({
    Title = "سكربت طيران",
    Desc = "اضغط لتشغيل سكربت",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Yusufly-fly-gui-79716"))()
    end
})
local Button = Tab:Button({
    Title = "سكربت AIMBOT",
    Desc = "اضغط لتشغيل سكربت",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-No-banned-aimbot-script-83677"))()
    end
})
-- التبويب
local ScriptTab = Window:Tab({
    Title = "Player",
    Icon = "user",
})
-- Spin System
local spinEnabled = false
local spinSpeed = 0

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local function getRoot()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

-- دوران سلس بدون while true
RunService.RenderStepped:Connect(function(dt)
    if spinEnabled and spinSpeed ~= 0 then
        local root = getRoot()
        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(spinSpeed) * dt, 0)
    end
end)

-- Toggle
ScriptTab:Toggle({
    Title = "تفعيل Spin",
    Default = false,
    Callback = function(state)
        spinEnabled = state
    end
})

-- Slider
ScriptTab:Slider({
    Title = "سرعة الدوران",
    Step = 10,
    Value = {
        Min = 0,
        Max = 100000,
        Default = 0,
    },
    Callback = function(value)
        spinSpeed = value
    end
})

-- Reset Button
ScriptTab:Button({
    Title = "إيقاف Spin",
    Callback = function()
        spinEnabled = false
        spinSpeed = 0
    end
})

-- خدمات
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- قيم افتراضية
local defaultSpeed = 16
local currentSpeed = 16
local speedEnabled = false

-- دالة تجيب الهيومنود
local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- تثبيت السرعة باستمرار (حل المشكلة)
RunService.RenderStepped:Connect(function()
    if speedEnabled then
        local hum = getHumanoid()
        if hum and hum.WalkSpeed ~= currentSpeed then
            hum.WalkSpeed = currentSpeed
        end
    end
end)

-- يرجع يطبق بعد الموت
player.CharacterAdded:Connect(function()
    task.wait(1)
    if speedEnabled then
        getHumanoid().WalkSpeed = currentSpeed
    end
end)

-- تفعيل السرعة
ScriptTab:Toggle({
    Title = "تفعيل السرعة",
    Default = false,
    Callback = function(state)
        speedEnabled = state
        if not state then
            getHumanoid().WalkSpeed = defaultSpeed
        end
    end
})

-- سلايدر السرعة
ScriptTab:Slider({
    Title = "قيمة السرعة",
    Step = 1,
    Value = {
        Min = 16,
        Max = 300,
        Default = 16,
    },
    Callback = function(value)
        currentSpeed = value
        if speedEnabled then
            getHumanoid().WalkSpeed = value
        end
    end
})

-- زر يرجع طبيعي
ScriptTab:Button({
    Title = "إرجاع للوضع الطبيعي",
    Callback = function()
        speedEnabled = false
        currentSpeed = defaultSpeed
        getHumanoid().WalkSpeed = defaultSpeed
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- قيم افتراضية
local defaultJump = 50  -- القفزة الافتراضية
local currentJump = 50
local jumpEnabled = false

-- دالة تجيب الهيومنود
local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- تثبيت القفزة باستمرار
RunService.RenderStepped:Connect(function()
    if jumpEnabled then
        local hum = getHumanoid()
        if hum and hum.JumpPower ~= currentJump then
            hum.JumpPower = currentJump
        end
    end
end)

-- يرجع يطبق بعد الموت
player.CharacterAdded:Connect(function()
    task.wait(1)
    if jumpEnabled then
        getHumanoid().JumpPower = currentJump
    end
end)

-- تفعيل القفزة
ScriptTab:Toggle({
    Title = "تفعيل القفزة",
    Default = false,
    Callback = function(state)
        jumpEnabled = state
        if not state then
            getHumanoid().JumpPower = defaultJump
        end
    end
})

-- سلايدر للقفزة
ScriptTab:Slider({
    Title = "قيمة القفزة",
    Step = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = 50,
    },
    Callback = function(value)
        currentJump = value
        if jumpEnabled then
            getHumanoid().JumpPower = value
        end
    end
})

-- زر يرجع طبيعي
ScriptTab:Button({
    Title = "إرجاع للوضع الطبيعي",
    Callback = function()
        jumpEnabled = false
        currentJump = defaultJump
        getHumanoid().JumpPower = defaultJump
    end
})
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local espEnabled = false

local function addESP(plr)
    if not plr.Character then return end
    local char = plr.Character

    -- Highlight
    if not char:FindFirstChild("ESP") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESP"
        highlight.FillColor = Color3.fromRGB(255,0,0)
        highlight.OutlineColor = Color3.fromRGB(255,255,255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = char
    end

    -- Name فوق الرأس
    local head = char:FindFirstChild("Head")
    if head and not head:FindFirstChild("ESP_Name") then
        local gui = Instance.new("BillboardGui")
        gui.Name = "ESP_Name"
        gui.Size = UDim2.new(0,200,0,40)
        gui.StudsOffset = Vector3.new(0,2.5,0)
        gui.AlwaysOnTop = true
        gui.Parent = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.Text = plr.Name
        label.TextScaled = true
        label.TextStrokeTransparency = 0
        label.TextColor3 = Color3.new(1,1,1)
        label.Parent = gui
    end
end

local function removeESP(plr)
    if not plr.Character then return end
    local char = plr.Character

    if char:FindFirstChild("ESP") then
        char.ESP:Destroy()
    end

    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("ESP_Name") then
        head.ESP_Name:Destroy()
    end
end

local function updateESP()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player then
            if espEnabled then
                addESP(plr)
            else
                removeESP(plr)
            end
        end
    end
end

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(1)
        if espEnabled then
            addESP(plr)
        end
    end)
end)

ScriptTab:Toggle({
    Title = "ESP",
    Default = false,
    Callback = function(state)
        espEnabled = state
        updateESP()
    end
})
-- Infinite Jump System
local infJumpEnabled = false
local jumpBoost = 1 -- عدد القفزات الإضافية

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local jumps = 0
local maxJumps = 1

local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- إعادة ضبط بعد لمس الأرض
local function setupCharacter(char)
    local hum = char:WaitForChild("Humanoid")
    hum.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.Landed then
            jumps = 0
        end
    end)
end

player.CharacterAdded:Connect(setupCharacter)
if player.Character then
    setupCharacter(player.Character)
end

-- عند طلب القفز
UserInputService.JumpRequest:Connect(function()
    if not infJumpEnabled then return end

    local hum = getHumanoid()

    if jumps < jumpBoost then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
        jumps += 1
    end
end)

-- Toggle
ScriptTab:Toggle({
    Title = "Infinite Jump تفعيل ",
    Default = false,
    Callback = function(state)
        infJumpEnabled = state
    end
})

-- Slider لعدد القفزات
ScriptTab:Slider({
    Title = "Infinite Jump",
    Step = 1,
    Value = {
        Min = 1,
        Max = 100000,
        Default = 1,
    },
    Callback = function(value)
        jumpBoost = value
    end
})

-- زر إيقاف
ScriptTab:Button({
    Title = "Infinite Jump اضغط لي ايقاف ",
    Callback = function()
        infJumpEnabled = false
        jumps = 0
    end
})
-- Noclip System
local noclipEnabled = false
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

RunService.Stepped:Connect(function()
    if noclipEnabled and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

ScriptTab:Toggle({
    Title = "تفعيل Noclip",
    Default = false,
    Callback = function(state)
        noclipEnabled = state
    end
})
local camera = workspace.CurrentCamera
local defaultFov = 70

ScriptTab:Slider({
    Title = "FOV",
    Step = 1,
    Value = {
        Min = 50,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        camera.FieldOfView = value
    end
})
-- Anti Tab
local AntiTab = Window:Tab({
    Title = "Anti",
    Icon = "shield",
    Locked = false,
})

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Anti Kick
local antiKickEnabled = false
AntiTab:Toggle({
    Title = "Anti Kick",
    Default = false,
    Callback = function(state)
        antiKickEnabled = state
        WindUI:Notify({
            Title = state and "تم تفعيل Anti Kick ✅" or "تم إيقاف Anti Kick ⚠️",
            Duration = 3,
            Icon = "shield"
        })
    end
})

-- Anti Fly
local antiFlyEnabled = false
AntiTab:Toggle({
    Title = "Anti Fly",
    Default = false,
    Callback = function(state)
        antiFlyEnabled = state
        WindUI:Notify({
            Title = state and "تم تفعيل Anti Fly ✅" or "تم إيقاف Anti Fly ⚠️",
            Duration = 3,
            Icon = "shield"
        })
    end
})

local antiSitEnabled = true
local antiSitConnection
local seatConnection

local function setupAntiSit(character)
    local humanoid = character:WaitForChild("Humanoid")

    -- منع حالة الجلوس نهائيًا
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    -- لو حاول يجلس يرجعه واقف
    if antiSitConnection then
        antiSitConnection:Disconnect()
    end

    antiSitConnection = humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
        if antiSitEnabled and humanoid.Sit then
            humanoid.Sit = false
        end
    end)

    -- لو قعد على Seat فعلًا نفكه
    if seatConnection then
        seatConnection:Disconnect()
    end

    seatConnection = humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
        if antiSitEnabled and humanoid.SeatPart then
            humanoid.Sit = false
            humanoid.Jump = true
        end
    end)
end

-- أول ما تدخل
if player.Character then
    setupAntiSit(player.Character)
end

-- بعد كل ريسباون
player.CharacterAdded:Connect(function(char)
    setupAntiSit(char)
end)

-- Anti Crash / Anti Exploit
local antiCrashEnabled = false
AntiTab:Toggle({
    Title = "Anti Crash / Exploit",
    Default = false,
    Callback = function(state)
        antiCrashEnabled = state
        WindUI:Notify({
            Title = state and "تم تفعيل Anti Crash ✅" or "تم إيقاف Anti Crash ⚠️",
            Duration = 3,
            Icon = "shield"
        })
    end
})

-- Anti Chat Spam
local antiSpamEnabled = false
AntiTab:Toggle({
    Title = "Anti Chat Spam",
    Default = false,
    Callback = function(state)
        antiSpamEnabled = state
        WindUI:Notify({
            Title = state and "تم تفعيل Anti Chat Spam ✅" or "تم إيقاف Anti Chat Spam ⚠️",
            Duration = 3,
            Icon = "shield"
        })
    end
})

-- منع الجلوس أو التحكم من الآخرين
player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    
    -- Anti Sit
    hum:GetPropertyChangedSignal("Sit"):Connect(function()
        if antiSitEnabled then
            hum.Sit = false
        end
    end)
    
    -- Anti Fly (تثبيت الوضع الطبيعي)
    RunService.RenderStepped:Connect(function()
        if antiFlyEnabled then
            hum.PlatformStand = false
        end
    end)
end)

-- Anti Kick / Anti Crash / Anti Exploit / Anti Chat Spam
-- هذه تحتاج أن تكون على مستوى اللعبة أو الخادم، مجرد إشعارات وحماية عامة
RunService.RenderStepped:Connect(function()
    if antiKickEnabled then
        -- حماية عامة: إعادة أي حذف أو إبعاد لللاعب
        if not player.Parent then
            player.Parent = game.Players
        end
    end

    if antiCrashEnabled then
        -- حماية عامة ضد بعض الانهيارات البسيطة
        -- هنا مجرد placeholder، يمكن إضافة حماية حسب نوع اللعبة
    end

    if antiSpamEnabled then
        -- حماية من الرسائل المزعجة
        -- إذا اللعبة فيها دردشة، يمكن تجاهل الرسائل المتكررة
    end
end)
local player = game.Players.LocalPlayer
local godEnabled = false

local function getHumanoid()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("Humanoid")
end

-- تثبيت الصحة باستمرار
game:GetService("RunService").RenderStepped:Connect(function()
    if godEnabled then
        local hum = getHumanoid()
        if hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end
end)

-- تفعيل/إيقاف مع إشعار
AntiTab:Toggle({
    Title = "Anti Kill (God Mode)",
    Default = false,
    Callback = function(state)
        godEnabled = state
        WindUI:Notify({
            Title = "God Mode",
            Content = state and "تم تفعيل Anti Kill ✅" or "تم إيقاف Anti Kill ❌",
            Duration = 3,
            Icon = "shield"
        })
    end
})
-- التأكد من إن التبويب موجود
local ScriptTab = Window:Tab({
    Title = "Misc",
    Icon = "diamond-plus",
})

-- زر Rejoin
ScriptTab:Button({
    Title = "Rejoin",
    Desc = "اضغط لإعادة دخول اللعبة",
    Callback = function()
        if WindUI and WindUI.Notify then
            WindUI:Notify({
                Title = "Rejoin 🔄",
                Content = "جاري إعادة دخول اللعبة...",
                Duration = 2,
                Icon = "aperture"
            })
        end

        local Players = game:GetService("Players")
        local TeleportService = game:GetService("TeleportService")
        local player = Players.LocalPlayer
        local placeId = game.PlaceId

        TeleportService:Teleport(placeId, player)
    end
})