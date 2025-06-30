
Events.Register("job_listing:toggle", function(source, data, toggle)
    data = {
        ['jobs'] = {
            {
                ['name'] = 'public_fleetex',
                ['companyName'] = '🚚 Chauffeur / Livreur',
                ['description'] = "## Description du Job\nLe **Chauffeur / Livreur** est un employé polyvalant travaillant pour **FleetEx Delivery**. Société spécialisées dans les livraisons d'entrepôts. Sans votre travail, nos entrepôts ne sont pas ravitaillés et, en fin de chaîne, ce sont les clients qui n'ont pas leurs colis.\n\n## Description des Tâches\n1. **Récupération des Colis**: \n   - La première étape consiste à aller faire le plein de colis.\n   - Les colis seront marqués selon l'entrepôt auquel ils doivent être livrés.\n2. **Livraison aux Entrepôts**: \n   - Prenez le camion qui vous sera fourni par l'entreprise pour aller déposer les colis dans les bons entrepôts.\n   - En échange de ces dépôts, vous recevrez un bon de récéption de la part de chaque entrepôt.\n4. **Récupération de la Paie**:\n   - Rendez-vous au service comptabilité de la société pour récupérer votre paie en échange des bons de livraison.\n\n## Votre employeur\n**FleetEx Delivery** est reconnu pour sa ponctualité et sa fiabilité. Vous représenterez l'entreprise à chaque livraison effectuée.",
            },
            {
                ['name'] = 'public_scrapper',
                ['companyName'] = '🗑️ Ferrailleur',
                ['description'] = "## Description du Job\nLe **Ferrailleur** est un employé polyvalent travaillant pour **ScrapMasters Inc.**. Société spécialisée dans la récupération et le recyclage de métaux. Sans votre travail, l'île serait encombrée de déchets, et nos ressources ne seraient pas optimisées.\n\n## Description des Tâches\n1. **Récupération des Déchets**:\n   - La première étape consiste à aller fouiller toutes les poubelles de l'île.\n   - Vous récupérerez les papiers et les canettes vides.\n2. **Fonte des Matériaux**:\n   - Une fois à la fonderie, faites fondre les matériaux récupérés.\n   - Vous recevrez un bon de fonte indiquant le poids des matériaux fondus.\n3. **Récupération de la Paie**:\n   - Rendez-vous au service comptabilité de la société pour échanger vos bons de fonte contre votre paie.\n\n## Votre Employeur\n**ScrapMasters Inc.** est reconnu pour son engagement envers l'environnement et sa fiabilité. Vous représenterez l'entreprise à chaque collecte et chaque fonte effectuée.\n",
            },
            {
                ['name'] = 'public_woodcuter',
                ['companyName'] = '🌳 Bucheron',
                ['description'] = "## Description du Job\nLe **Bûcheron** est un employé polyvalent travaillant pour **TimberWorks Ltd.**. Société spécialisée dans l'exploitation forestière durable. Sans votre travail, les ressources en bois ne seraient pas gérées de manière optimale, impactant les industries et les consommateurs.\n\n## Description des Tâches\n1. **Récupération du Camion**:\n   - La première étape consiste à récupérer votre camion de bûcheron aux locaux de la société.\n2. **Coupe du Bois**:\n   - Vous irez ensuite couper du bois dans la forêt.\n3. **Transport à la Scierie**:\n   - Transportez les grumes directement à la scierie pour qu'elles soient débitées en planches de bois.\n4. **Livraison au Magasin de Bricolage**:\n   - Une fois les planches de bois chargées dans le camion, transportez-les au magasin de bricolage qui les revend. Vous obtiendrez un bon de reception en échange de votre livraison\n5. **Récupération de la Paie**:\n   - Rendez-vous au service comptabilité de la société pour échanger votre bon contre votre paie.\n\n## Votre Employeur\n**TimberWorks Ltd.** est reconnue pour sa gestion durable des forêts et sa fiabilité. Vous représenterez l'entreprise à chaque étape de l'exploitation forestière et de la distribution de bois.\n",
            }
        }
    }
    UI:Toggle("job_listing", toggle, data, toggle, false, toggle)
    ToggleRadar(not toggle)
end)

UI:RegisterCallback("job_listing:closed", function(data, cb)
    TriggerScreenblurFadeOut(250.0)
    ToggleRadar(true)
    ClientModules.Misc.Animations:Stop()
end)

UI:RegisterCallback("job_listing:recruit", function(data, cb)
	Events.Trigger("job_listing:toggle", {}, false)
    cb(true)
end)
