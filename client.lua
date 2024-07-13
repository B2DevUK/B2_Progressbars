local isProgressBarActive = false

local presetColors = {
    red = "#e74c3c",
    blue = "#3498db",
    orange = "#e67e22",
    teal = "#1abc9c",
    yellow = "#f1c40f",
    purple = "#9b59b6",
    green = "#2ecc71"
}

RegisterNetEvent('showProgressBar')
AddEventHandler('showProgressBar', function(message, duration, color)
    if isProgressBarActive then
        return
    end

    isProgressBarActive = true
    TriggerEvent('disablePlayerActions', true)

    local selectedColor = presetColors[color] or color

    SendNUIMessage({
        type = 'show',
        label = message,
        value = 0,
        color = selectedColor
    })

    local startTime = GetGameTimer()
    local endTime = startTime + duration

    Citizen.CreateThread(function()
        while GetGameTimer() < endTime do
            local elapsedTime = GetGameTimer() - startTime
            local progress = (elapsedTime / duration) * 100
            SendNUIMessage({
                type = 'update',
                value = progress
            })
            Citizen.Wait(100)
        end

        SendNUIMessage({
            type = 'update',
            value = 100
        })

        Citizen.Wait(1000)
        SendNUIMessage({
            type = 'remove'
        })

        TriggerEvent('disablePlayerActions', false)
        isProgressBarActive = false
    end)
end)

function ShowProgressBar(message, duration, color)
    TriggerEvent('showProgressBar', message, duration, color)
end

exports('ShowProgressBar', ShowProgressBar)

RegisterNetEvent('disablePlayerActions')
AddEventHandler('disablePlayerActions', function(disable)
    if disable then
        DisableControlAction(0, 24, true) -- Attack
        DisableControlAction(0, 257, true) -- Attack 2
        DisableControlAction(0, 25, true) -- Aim
        DisableControlAction(0, 263, true) -- Melee Attack 1
        DisableControlAction(0, 32, true) -- W
        DisableControlAction(0, 34, true) -- A
        DisableControlAction(0, 31, true) -- S
        DisableControlAction(0, 30, true) -- D
        DisableControlAction(0, 45, true) -- Reload
        DisableControlAction(0, 22, true) -- Jump
        DisableControlAction(0, 44, true) -- Cover
        DisableControlAction(0, 37, true) -- Select Weapon
        DisableControlAction(0, 288, true) -- Disable phone
        DisableControlAction(0, 289, true) -- Inventory
        DisableControlAction(0, 170, true) -- Animations
        DisableControlAction(0, 167, true) -- Job
        DisableControlAction(0, 0, true) -- Disable changing view
        DisableControlAction(0, 26, true) -- Disable looking behind
        DisableControlAction(0, 73, true) -- Disable clearing animation
        DisableControlAction(2, 199, true) -- Disable pause screen
        DisableControlAction(0, 47, true) -- Disable weapon
        DisableControlAction(0, 264, true) -- Disable melee
        DisableControlAction(0, 257, true) -- Disable melee
        DisableControlAction(0, 140, true) -- Disable melee
        DisableControlAction(0, 141, true) -- Disable melee
        DisableControlAction(0, 142, true) -- Disable melee
        DisableControlAction(0, 143, true) -- Disable melee
        DisableControlAction(0, 75, true) -- Disable exit vehicle
        DisableControlAction(0, 21, true) -- Disable sprint
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isProgressBarActive then
            TriggerEvent('disablePlayerActions', true)
        else
            Citizen.Wait(500)
        end
    end
end)
