local passwords = {
    "absolute", "abstract", "academic", "accepted", "accident", "accuracy", "accurate", "achieved", "acquired",
    "activity", "actually", "addition", "adequate", "adjacent", "adjusted", "advanced", "advisory", "advocate",
    "affected", "aircraft", "alliance", "although", "aluminum", "analysis", "announce", "anything", "anywhere",
    "apparent", "appendix", "approach", "approval", "argument", "artistic", "assembly", "assuming", "athletic",
    "attached", "attitude", "attorney", "audience", "autonomy", "aviation", "bachelor", "bacteria", "baseball",
    "bathroom", "becoming", "birthday", "boundary", "breaking", "breeding", "building", "bulletin", "business",
    "calendar", "campaign", "capacity", "casualty", "catching", "category", "cautious", "cellular", "ceremony",
    "chairman", "champion", "chemical", "children", "circular", "civilian", "clearing", "clinical", "clothing",
    "collapse", "colonial", "colorful", "commence", "commerce", "complain", "complete", "composed", "compound",
    "computer", "conclude", "concrete", "conflict", "confused", "congress", "consider", "constant", "consumer",
    "continue", "contract", "contrary", "contrast", "convince", "corridor", "coverage", "creating", "creation",
    "creative", "criminal", "critical", "crossing", "cultural", "currency", "customer", "database", "daughter",
    "daylight", "deadline", "decision", "decrease", "deferred", "definite", "delicate", "delivery", "describe",
    "designer", "detailed", "dialogue", "diameter", "directly", "director", "disaster", "disclose", "discount",
    "discover", "disorder", "distance", "distinct", "district", "dividend", "domestic", "dominion", "doubtful",
    "dramatic", "dressing", "dropping", "duration", "dynamics", "earnings", "economic", "educated", "eighteen",
    "election", "electric", "eligible", "embraced", "emphasis", "employee", "endeavor", "engineer",
    "enormous", "entirely", "entrance", "envelope", "equality", "estimate", "evaluate", "eventual", "everyone",
    "exchange", "exciting", "exercise", "explicit", "extended", "external", "facility", "familiar", "featured",
    "feedback", "festival", "finished", "football", "forecast", "foremost", "formerly", "fraction", "frequent",
    "friendly", "frontier", "function", "generate", "generous", "genomics", "gigantic", "goodwill", "governor",
    "graduate", "graphics", "grateful", "guidance", "handling", "hardware", "heritage", "hesitate", "hospital",
    "identify", "identity", "ideology", "illusion", "imagined", "imminent", "improved", "incident", "included",
    "increase", "indicate", "indirect", "industry", "informal", "innocent", "inspired", "instance",
    "integral", "intended", "interact", "interest", "interior", "internal", "interval", "intimate", "invasion",
    "investor", "involved", "isolated", "judgment", "keyboard", "language", "laughter", "learning", "lecturer",
    "leverage", "lighting", "literacy", "location", "magazine", "magnetic", "maintain",
    "majority", "marginal", "marriage", "material", "maturity", "measured", "medicine", "medieval", "membrane",
    "memorial", "merchant", "midnight", "military", "minimize", "ministry", "mobility", "modeling", "moderate",
    "momentum", "monetary", "mortgage", "mountain", "movement", "multiple", "national", "negative",
    "neighbor", "notebook", "numerous", "observer", "occasion", "offender", "official", "operator", "opponent",
    "opposite", "optimism", "optional", "ordinary", "organize", "original", "outdoors", "overcome", "painting",
    "parallel", "parental", "particle", "patented", "patience", "peaceful", "peculiar", "pipeline", "platform",
    "pleasant", "pleasure", "plumbing", "portable", "position", "positive", "possible", "powerful", "practice",
    "precious", "predator", "presence", "preserve", "pressure", "previous", "printing", "priority", "probably",
    "producer", "profound", "progress", "property", "proposal", "prospect", "provided", "provider", "province",
    "publicly", "purchase", "quantity", "question", "rational", "reaction", "receiver", "recovery", "regional",
    "register", "relation", "relative", "relocate", "reliable", "reminded", "removing", "relevant", "remember",
    "rendered", "religion", "resource", "response", "restrict", "revision", "roadside", "robustly",
    "sampling", "scenario", "schedule", "scrutiny", "seasonal", "secluded", "security", "segments", "seminars",
    "sensible", "sequence", "shoulder", "simplify", "situated", "slightly", "software", "solution", "somewhat",
    "speaking", "specific", "spectrum", "spending", "standard", "standing", "starting", "straight", "strategy",
    "strength", "striking", "struggle", "students", "stunning", "suburban", "suitable", "superior", "supposed",
    "surgical", "surprise", "survival", "sweeping", "swimming", "syndrome", "systemic", "tactical",
    "tailored", "takeover", "taxation", "teachers", "teaching", "tendency", "terminal", "terrific", "testimon",
    "textbook", "thorough", "thoughts", "threaten", "together", "tracking", "training", "transfer", "traveled",
    "triangle", "tropical", "turnover", "ultimate", "umbrella", "uncommon", "underway", "unfolded", "universe",
    "unlawful", "unlikely", "unwanted", "upcoming", "updating", "uprights", "vacation", "valuable", "variable",
    "variance", "vertical", "vicinity", "violence", "virtuous", "visitors", "vitamins",
    "volatile", "vouchers", "voyagers", "warnings", "warranty",
}

local scaleform = nil
local ClickReturn 
local lives = 5 --In the original scaleform minigame which you can play online, there are 7 lives given to the player.
local gamePassword = passwords[1]:upper() --It's possible to use a table and assign random passwords to the minigame.
local ProgramID = nil
local callback = function(success)end

Citizen.CreateThread(function()
    function Initialize(sf)
        sf = RequestScaleformMovieSkipRenderWhilePaused(sf)
        while not HasScaleformMovieLoaded(sf) do
            Citizen.Wait(0)
        end

        BeginScaleformMovieMethod(sf, "SET_LABELS") --this allows us to label every item inside My Computer
        ScaleformMovieMethodAddParamTextureNameString("Local Disk (C:)")
        ScaleformMovieMethodAddParamTextureNameString("Network")
        ScaleformMovieMethodAddParamTextureNameString("External Device (J:)")
        ScaleformMovieMethodAddParamTextureNameString("HackConnect.exe")
        ScaleformMovieMethodAddParamTextureNameString("BruteForce.exe")
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_BACKGROUND") --We can set the background of the scaleform, so far 0-6 works.
        ScaleformMovieMethodAddParamInt(0)
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "ADD_PROGRAM") --We add My Computer application to the scaleform
        ScaleformMovieMethodAddParamFloat(1.0) -- Position in the scaleform most left corner
        ScaleformMovieMethodAddParamFloat(4.0)
        ScaleformMovieMethodAddParamTextureNameString("My Computer")
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "ADD_PROGRAM") --Power Off app.
        ScaleformMovieMethodAddParamFloat(6.0) -- Position in the scaleform most right corner
        ScaleformMovieMethodAddParamFloat(6.0)
        ScaleformMovieMethodAddParamTextureNameString("Power Off")
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED") --Column speed used in the minigame, (0-255). 
        ScaleformMovieMethodAddParamInt(0)
        ScaleformMovieMethodAddParamInt(math.random(150,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(1)
        ScaleformMovieMethodAddParamInt(math.random(160,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(2)
        ScaleformMovieMethodAddParamInt(math.random(170,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(3)
        ScaleformMovieMethodAddParamInt(math.random(190,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(4)
        ScaleformMovieMethodAddParamInt(math.random(200,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(5)
        ScaleformMovieMethodAddParamInt(math.random(210,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(6)
        ScaleformMovieMethodAddParamInt(math.random(220,255))
        EndScaleformMovieMethod()

        BeginScaleformMovieMethod(sf, "SET_COLUMN_SPEED")
        ScaleformMovieMethodAddParamInt(7)
        ScaleformMovieMethodAddParamInt(255)
        EndScaleformMovieMethod()

        return sf
    end

    while true do
        Citizen.Wait(0)
		if HasScaleformMovieLoaded(scaleform) then
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			BeginScaleformMovieMethod(scaleform, "SET_CURSOR") --We use this scaleform function to define what input is going to move the cursor
			ScaleformMovieMethodAddParamFloat(GetControlNormal(0, 239))
			ScaleformMovieMethodAddParamFloat(GetControlNormal(0, 240))
			EndScaleformMovieMethod()
			if IsDisabledControlJustPressed(0,24) then -- IF LEFT CLICK IS PRESSED WE SELECT SOMETHING IN THE SCALEFORM
				BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT_SELECT")
				ClickReturn = EndScaleformMovieMethodReturnValue()
				PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
			elseif IsDisabledControlJustPressed(0, 25) then -- IF RIGHT CLICK IS PRESSED WE GO BACK.
				BeginScaleformMovieMethod(scaleform, "SET_INPUT_EVENT_BACK")
				EndScaleformMovieMethod()
				PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasScaleformMovieLoaded(scaleform) then
            if IsScaleformMovieMethodReturnValueReady(ClickReturn) then -- old native?
                ProgramID = GetScaleformMovieMethodReturnValueInt(ClickReturn)

                if ProgramID == 82 then --HACKCONNECT.EXE
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif ProgramID == 83 then  --BRUTEFORCE.EXE
                    BeginScaleformMovieMethod(scaleform, "RUN_PROGRAM")
                    ScaleformMovieMethodAddParamFloat(83.0)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_WORD")
                    ScaleformMovieMethodAddParamTextureNameString(gamePassword)
                    EndScaleformMovieMethod()
                elseif ProgramID == 87 then --IF YOU CLICK THE WRONG LETTER IN BRUTEFORCE APP
                    lives -= 1

                    BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_WORD")
                    ScaleformMovieMethodAddParamTextureNameString(gamePassword)
                    EndScaleformMovieMethod()

                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                    BeginScaleformMovieMethod(scaleform, "SET_LIVES")
                    ScaleformMovieMethodAddParamInt(lives) --We set how many lives our user has before he fails the bruteforce.
                    ScaleformMovieMethodAddParamInt(5)
                    EndScaleformMovieMethod()
                elseif ProgramID == 92 then --IF YOU CLICK THE RIGHT LETTER IN BRUTEFORCE APP, you could add more lives here.
                    PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)

                elseif ProgramID == 86 then --IF YOU SUCCESSFULY GET ALL LETTERS RIGHT IN BRUTEFORCE APP
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)

                    BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_OUTCOME")
                    ScaleformMovieMethodAddParamBool(true)
                    ScaleformMovieMethodAddParamTextureNameString("BRUTEFORCE SUCCESSFUL!")
                    EndScaleformMovieMethod()

                    Citizen.Wait(2800) --We wait 2.8 to let the bruteforce message sink in before we continue
                    BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "OPEN_LOADING_PROGRESS")
                    ScaleformMovieMethodAddParamBool(true)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_PROGRESS")
                    ScaleformMovieMethodAddParamInt(35)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_TIME")
                    ScaleformMovieMethodAddParamInt(35)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_MESSAGE")
                    ScaleformMovieMethodAddParamTextureNameString("Writing data to buffer..")
                    ScaleformMovieMethodAddParamFloat(2.0)
                    EndScaleformMovieMethod()
                    Citizen.Wait(1500)

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_MESSAGE")
                    ScaleformMovieMethodAddParamTextureNameString("Executing malicious code..")
                    ScaleformMovieMethodAddParamFloat(2.0)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_TIME")
                    ScaleformMovieMethodAddParamInt(15)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "SET_LOADING_PROGRESS")
                    ScaleformMovieMethodAddParamInt(75)
                    EndScaleformMovieMethod()

                    Citizen.Wait(1500)
                    BeginScaleformMovieMethod(scaleform, "OPEN_LOADING_PROGRESS")
                    ScaleformMovieMethodAddParamBool(false)
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "OPEN_ERROR_POPUP")
                    ScaleformMovieMethodAddParamBool(true)
                    ScaleformMovieMethodAddParamTextureNameString("MEMORY LEAK DETECTED, DEVICE SHUTTING DOWN")
                    EndScaleformMovieMethod()

                    Citizen.Wait(3500)
                    SetScaleformMovieAsNoLongerNeeded(scaleform) --EXIT SCALEFORM
                    EndScaleformMovieMethod()
					callback(true)
					callback = function()end

                elseif ProgramID == 6 then
                    Citizen.Wait(500) -- WE WAIT 0.5 SECONDS TO EXIT SCALEFORM, JUST TO SIMULATE A SHUTDOWN, OTHERWISE IT CLOSES INSTANTLY
                    SetScaleformMovieAsNoLongerNeeded(scaleform) --EXIT SCALEFORM
					callback(false)
					callback = function()end
                end

                if lives == 0 then
                    PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                    BeginScaleformMovieMethod(scaleform, "SET_ROULETTE_OUTCOME")
                    ScaleformMovieMethodAddParamBool(false)
                    ScaleformMovieMethodAddParamTextureNameString("BRUTEFORCE FAILED!")
                    EndScaleformMovieMethod()

                    Citizen.Wait(3500) --WE WAIT 3.5 seconds here aswell to let the bruteforce message sink in before exiting.
                    BeginScaleformMovieMethod(scaleform, "CLOSE_APP")
                    EndScaleformMovieMethod()

                    BeginScaleformMovieMethod(scaleform, "OPEN_ERROR_POPUP")
                    ScaleformMovieMethodAddParamBool(true)
                    ScaleformMovieMethodAddParamTextureNameString("MEMORY LEAK DETECTED, DEVICE SHUTTING DOWN")
                    EndScaleformMovieMethod()

                    Citizen.Wait(2500)
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    EndScaleformMovieMethod()
					callback(false)
					callback = function()end
                end
            end
        end
    end
end)

exports("Bruteforce", function(cb)
	gamePassword = passwords[math.random(1, #passwords)]:upper()
	scaleform = Initialize("HACKING_PC")
	callback = cb
end)
