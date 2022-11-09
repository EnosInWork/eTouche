Config = {

    UseESX = true,
    ESXTrigg = "esx:getSharedObject",

    UseOpenKey = true,
    OpenKey = "F3",

    MenuName = "Reality",
    SubName = "Nos raccourcis",

    BanniereCouleur = true,
    ColorMenu = {R = 10, G = 10, B = 125, O = 255},
    
    Raccourcis = {
        {
            touche = "~r~F1", 
            label = "Téléphone", 
            desc = "Permet d'ouvrir votre téléphone", 
        },

        {
            touche = "~r~F2", 
            label = "Inventaire", 
            desc = "Permet d'ouvrir votre inventaire", 
        },

        {
            touche = "~r~F3", 
            label = "Menu emotes", 
            desc = nil, 
        },

    }

}

if Config.UseESX == true then 
    if IsDuplicityVersion() then 
        ESX = nil
        TriggerEvent(Config.ESXTrigg, function(obj) ESX = obj end)
    else
        ESX = nil
        Citizen.CreateThread(function()
            while ESX == nil do
                TriggerEvent(Config.ESXTrigg, function(obj) ESX = obj end)
                Citizen.Wait(0)
            end
        end)
    end
end