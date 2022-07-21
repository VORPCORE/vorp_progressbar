exports('initiate', function()
    local self = {}

    self.start = function(message, miliseconds, cb, theme)
        if theme == nil then
            theme = "linear"
        end

        SetNuiFocus(true, false)
        SendNUIMessage({
            type = 'vp-open',
            message = message,
            mili = miliseconds,
            theme = theme
        })
        RegisterNUICallback('ProgressFinished', function(args, nuicb)
            SetNuiFocus(false, false)
            cb()
            nuicb('ok')
        end)
    end

    return self
end)
