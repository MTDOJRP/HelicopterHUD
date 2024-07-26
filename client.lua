local UI = { 
	x = 0.3,
	y = 0.43,
}


function Text(text, x, y, scale)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextOutline()
	SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		local Ped = GetPlayerPed(-1)
		local Heli = IsPedInAnyHeli(Ped)

		if Heli then
			local PedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local HeliSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
			local Engine = GetIsVehicleEngineRunning(PedVehicle)
			local Height = GetEntityHeightAboveGround(PedVehicle)
			local MainRotorHealth = GetHeliMainRotorHealth(PedVehicle)
			local TailRotorHealth = GetHeliTailRotorHealth(PedVehicle)

			if Engine then
				Text("~g~ENG", UI.x + 0.4016, UI.y + 0.476, 0.55)
				Text("~g~__", UI.x + 0.4016, UI.y + 0.47, 0.79)
			elseif Engine == false then
				Text("~r~ENG", UI.x + 0.4016, UI.y + 0.476, 0.55)
				Text("~r~__", UI.x + 0.4016, UI.y + 0.47, 0.79)
			end

			if MainRotorHealth > 800 and Engine then
				Text("~g~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
				Text("~g~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
			elseif MainRotorHealth > 200 and MainRotorHealth < 800 and Engine then
				Text("~y~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
				Text("~y~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
			elseif MainRotorHealth < 200 and Engine then
				Text("~r~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
				Text("~r~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
			elseif Engine == false then
				Text("~r~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
				Text("~r~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
			end

			if TailRotorHealth > 300 and Engine then
				Text("~g~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
				Text("~g~__", UI.x + 0.5, UI.y + 0.47, 0.79)
			elseif TailRotorHealth > 100 and TailRotorHealth < 300 and Engine then
				Text("~y~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
				Text("~y~__", UI.x + 0.5, UI.y + 0.47, 0.79)
			elseif TailRotorHealth < 100 and Engine then
				Text("~r~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
				Text("~r~__", UI.x + 0.5, UI.y + 0.47, 0.79)
			elseif Engine == false then
				Text("~r~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
				Text("~r~__", UI.x + 0.5, UI.y + 0.47, 0.79)
			end

			Text(math.ceil(Height), UI.x + 0.549, UI.y + 0.476, 0.45)
			Text("ALTITUDE", UI.x + 0.549, UI.y + 0.502, 0.29)

			Text(math.ceil(HeliSpeed), UI.x + 0.598, UI.y + 0.476, 0.45)
			Text("AIR SPEED", UI.x + 0.598, UI.y + 0.502, 0.29)

			if HeliSpeed < 0.9 and HeliSpeed > 0.1 then
				Text("1", UI.x + 0.598, UI.y + 0.476, 0.45)
			elseif HeliSpeed == 0.0 then
				Text("0", UI.x + 0.598, UI.y + 0.476, 0.45)
			end

			DrawRect(UI.x + 0.5, UI.y + 0.5, 0.255, 0.085, 25, 25, 25, 255)
			DrawRect(UI.x + 0.5, UI.y + 0.5, 0.25, 0.075, 51, 51, 51, 255)

			DrawRect(UI.x + 0.402, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
			DrawRect(UI.x + 0.4516, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
			DrawRect(UI.x + 0.5, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
			DrawRect(UI.x + 0.549, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
			DrawRect(UI.x + 0.598, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)

			if HeliSpeed > 15.0 and Height < 30.0 then
				SetEntityMaxSpeed(PedVehicle, 300.0)
			elseif HeliSpeed > 15.0 and Height < 10.0 then
				SetEntityMaxSpeed(PedVehicle, 20.0)
			elseif Height < 3.0 then
				SetEntityMaxSpeed(PedVehicle, 1.0)
			elseif Height < 5.0 then
				SetEntityMaxSpeed(PedVehicle, 2.0)
			elseif Height > 5.0 and Height < 10.0 then
				SetEntityMaxSpeed(PedVehicle, 3.0)
			elseif Height > 10.0 and Height < 15.0 then
				SetEntityMaxSpeed(PedVehicle, 4.0)
			elseif Height > 15.0 and Height < 20.0 then
				SetEntityMaxSpeed(PedVehicle, 6.0)
			elseif Height > 20.0 and Height < 25.0 then
				SetEntityMaxSpeed(PedVehicle, 7.0)
			elseif Height > 25.0 and Height < 30.0 then
				SetEntityMaxSpeed(PedVehicle, 10.0)
			elseif Height > 30.0 then
				SetEntityMaxSpeed(PedVehicle, 300.0)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		local Ped = GetPlayerPed(-1)
		local Heli = IsPedInAnyHeli(Ped)
		if Heli then
			local PedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local HeliSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
			local Engine = GetIsVehicleEngineRunning(PedVehicle)
			local Height = GetEntityHeightAboveGround(PedVehicle)
			if Height < 3.0 and HeliSpeed == 0 and Engine then
				Citizen.Wait(5000)
				SetVehicleEngineOn(PedVehicle, false, true, true)
			end
		end
	end
end)
