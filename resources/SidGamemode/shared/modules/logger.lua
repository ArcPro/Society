SharedModules = SharedModules or {}
SharedModules.Log = {}
SharedModules.Log.Titles = {
	INVENTORIES	= {
		INVENTORY_CREATE	= "Inventaire créé",
		INVENTORY_UPDATE	= "Inventaire mis à jour",
		INVENTORY_DELETE	= "Inventaire supprimé",
		ITEM_REMOVE			= "Item enlevé",
		ITEM_CREATE			= "Item créé",
		ITEM_UPDATE			= "Item mis à jour",
		ITEM_THROW			= "Item jeté",
		ITEM_GIVE			= "Item donné",
		ITEM_MOVE			= "Item déplacé",
		ITEM_ADD			= "Item ajouté",
	},

	PROPERTIES	= {
		DELETE				= "Propriété supprimée",
		CREATE				= "Propriété créée",
		ENTER				= "Entrée dans la propriété",
		LEAVE				= "Sortie de la propriété",
	},

	SOCIETIES	= {
		SOCIETY_UPDATEGRADE		= "Grade mis à jour",
		EMPLOYEES_SETGRADE		= "Changement de grade",
		EMPLOYEES_REMOVE		= "Employé viré",
		SOCIETY_ADDGRADE		= "Grade créé",
		SOCIETY_ANNOUNCE		= "Annonce",
		SOCIETY_DELGRADE		= "Grade supprimé",
		DISPATCH_ACTION			= "Dispatch",
		SOCIETY_CREATE			= "Entreprise créée",
		SOCIETY_DELETE			= "Entreprise supprimée",
		SOCIETY_UPDATE			= "Entreprise mise à jour",
		EMPLOYEES_ADD			= "Employé recruté",
		DUTY_TOGGLE				= "Service",
	},

	VEHICLES	= {
		UNCOVER					= "Véhicule débâché",
		CREATE					= "Véhicule créé",
		DELETE					= "Véhicule supprimé",
		COVER					= "Véhicule bâché",
	},

	WEAPONS		= {
		UNEQUIP 				= "Arme déséquipée",
		EQUIP 					= "Arme équipée",
		SHOOT 					= "Tir",
	},

	PLAYER 		= {
		CONNECT 				= "Connexion",
		CREATE 					= "Création de personnage",
		DELETE 					= "Suppression de personnage",
		REVIVE 					= "Revive",
		SWITCH 					= "Changement de personnage",
		UPDATE 					= "Mise à jour du personnage",
		LEAVE					= "Déconnexion",
		DIE 					= "Mort du personnage",
		ME						= "Me",
	},

	BANK		= {
		ACCOUNT_CREATE			= "Création de compte",
		REMOVE_BILL				= "Facture payée",
		ADD_BILL				= "Facture à payer",
		WITHDRAW 				= "Retrait",
		TRANSFER 				= "Transfert",
		DEPOSIT 				= "Dépot",
		DELETE					= "Compte supprimé",
		UPDATE					= "Compte mis à jour",
	},

	ILLEGAL		= {
		DRUG_SELLING			= "Vente de drogue",
		LABORATORY				= "Laboratoire",
		MINIMARKET				= "Supérette",
		CONTAINER 				= "Conteneurs",
		CARJACK 				= "Vol de voiture",
		FLEECA 					= "Braquage de banque",
		ORDER 					= "Commande",
		WEED 					= "Weed",
		ATM						= "ATM",
	},

	STAFF		= {
		LOCK_UNLOCK_CHARACTER	= "Personnage bloqué",
		CHANGE_PHONE_NUMBER		= "Numéro de téléphone changé",
		CHANGE_SOURCE			= "Controle du personnage",
		SEND_MESSAGE			= "Message",
		MAKE_EM_FLY				= "Le faire voler",
		SET_SLOTS				= "Changement des slots",
		INVISIBLE				= "Invisible",
		GODMODE					= "God mode",
		RAGDOLL					= "Ragdoll",
		BRING					= "Bring",
		BLIPS					= "Blips",
		EMOTE					= "Emote",
		NAMES					= "Noms",
		GOTO					= "Goto",
		WIPE					= "Wipe",
		KICK					= "Kick",
		BAN						= "Ban",
	}
}

function SharedModules.Log:Parse(source, fields)
	if Config.Env ~= "server" then
		return {}
	end

	local player = Players.Get(source)

	local data = {
		discord = Identifiers.Parse(GetPlayerIdentifiers(source)).discord,
		fullname = "Pas encore chargé",
		job = "Pas encore chargé",
		id = "Pas encore chargé",
	}

	if player ~= nil then
		data.job = ("%s"):format(player:job().label, player:job_grade().label)
		data.fullname = player:fullname()
		data.id = player:id()
	end

	local parsed_fields = {
		{
			name = "Discord du joueur",
			value = ("<@%s>"):format(data.discord)
		},
		{
			name = "Personnage",
			value = ("```%s | %s```"):format(tostring(data.id), data.fullname)
		},
		{
			name = "Job",
			value = ("```%s```"):format(data.job)
		},
	}

	for name, value in pairs(fields) do
		if type(value) == "table" then
			value = json.encode(value)
		end

		table.insert(parsed_fields, {
			name = name,
			value = string.find(tostring(value), "<@") and value or ("```%s```"):format(value)
		})
	end

	return parsed_fields
end

function SharedModules.Log:Send(url, title, fields)
	if Config.Env ~= "server" then return end

	PerformHttpRequest(
		url,
		function(err, text, header)end,
		'POST',
		json.encode({
			username = "Arkeus le sbire",
			avatar_url = "https://cdnrv.sysscripts.com/other/logo.webp",
			embeds = {
				{
					timestamp = os.date('!%Y-%m-%dT%H:%M:%S.000Z'),
					fields = fields,
					title = title,
					color = 46590,

					author = {
						name = "JSP Logs"
					},

					footer = {
						text = "JSP Logs"
					},
				}
			}
		}),
		{['Content-Type'] = 'application/json'}
	)
end

function SharedModules.Log:Create(source, category, log_type, raw_fields)
	category = category:upper()
	log_type = log_type:upper()

	if Config.Env == "client" then
		Events.TriggerServer("log", category, log_type, raw_fields)
	else
		self:Send(
			Config.Webhooks[category][log_type],
			self.Titles[category][log_type],
			self:Parse(source, raw_fields)
		)
	end
end

function SharedModules.Log:Initialize()
	if Config.Env ~= "server" then return end

	Events.Register("log", function(source, category, log_type, raw_fields)
		self:Create(source, category, log_type, raw_fields)
	end)
end

SharedModules.Log:Initialize()
