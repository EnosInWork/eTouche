function OpenTouche()
    local main = RageUI.CreateMenu(Config.MenuName, Config.SubName)
    if Config.BanniereCouleur == true then 
        main:SetRectangleBanner(Config.ColorMenu.R, Config.ColorMenu.G, Config.ColorMenu.B, Config.ColorMenu.O)
    end
        RageUI.Visible(main, not RageUI.Visible(main))
        while main do
            Citizen.Wait(0)
            RageUI.IsVisible(main, true, true, true, function()  
				for _,v in pairs(Config.Raccourcis) do
					RageUI.ButtonWithStyle(v.label, v.desc, { RightLabel = v.touche }, true, function(Hovered, Active, Selected)
					end)
				end
            end, function()
            end)
            if not RageUI.Visible(main) then
            main = RMenu:DeleteType(main, true)
        end
    end
end

exports("OpenTouche", OpenTouche)

if Config.UseOpenKey == true then 
    RegisterCommand('OuvrirRaccourcis', function()
        if IsEntityDead(PlayerPedId()) then return end 
        OpenTouche()
    end, false)
    RegisterKeyMapping('OuvrirRaccourcis', 'Nos raccourcis', 'keyboard', Config.OpenKey)
end