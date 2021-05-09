

function BuildNPC(hash, coords, heading, events, jobs, drawDistance, animDict, anim)
    
    if not hash then print('Invalid Hash for NPC.') return end
    if type(events) ~= 'table' then print('Invalid events format.') return end
    if not jobs then jobs = {'all'} end
    if type(jobs) ~= 'table' then print('Invalid jobs format.') return end
    if not drawDistance then drawDistance = Config.defaultDrawDistance end

    exports['bt-target']:AddTargetModel({npc.hash}, {
        options = {events},
        job = jobs,
        distance = drawDistance
    })

    local dict = Config.defaultAnimDict
    local anim = Config.defaultAnim

    if anim then 
        dict = animDict 
        animation = anim 
    end

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(1)
    end

    local npcped =  CreatePed(4, hash, coords.x, coords.y, coords.z-1, heading, false, true)

    SetEntityHeading(npcped, heading)
    FreezeEntityPosition(npcped, true)
    SetEntityInvincible(npcped, true)
    SetBlockingOfNonTemporaryEvents(npcped, true)
    TaskPlayAnim(npcped, dict, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)

end

exports('BuildNPC', BuildNPC)
