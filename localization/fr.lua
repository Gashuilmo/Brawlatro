return {
    descriptions = {
    Joker = {
            j_brawl_buffet = {
                name = "Buffet",
                text = { "Pour chaque {C:blue}consumable{} utilisé",
               "ce joker gagne {X:chips,C:white}+#2#{} Jetons.",
                "{C:inactive}Maintenant {C:blue}+#1# {C:inactive}Jetons",
                },
            },
                        j_brawl_chesterjoker = {
                name = "Qu'est Ce Qu'il En Sera",
                text = {"Lorqu'une carte est jouée",
                "il y a des chances que quelque choses" ,
                "se produisent !",
                },
            },
            j_brawl_surged = {
                name = "Module D'amélioration",
                text = { 
                "Améliore {X:mult,C:white}X#2#{} Mult",
                "pour chaque {C:attention}Boss Blinde{}",
                "battue durant cette partie.",
                "{C:inactive}Actuellement {C:red}x#1# {C:inactive}Mult",
                },
            },
            j_brawl_commando = {
                name = "Commando",
                text = { 
                "Ce Joker gagne {C:red}+#2#{} Mult",
                "lorsqu'une carte jouée marque des points.",
                "{C:inactive}Actuellement {C:red}+#1# {C:inactive}Mult",
                },
            },
            j_brawl_cheater = {
                name = "Tricheur",
                text = { 
                "Clairement tu n'as pas lu la section 426",
                "sous-section 98 division 4 sous de l'encre invisible.",
                "{C:dark_edition}+1{} {C:inactive}Taille de main, Mains, Défausses, Emplacement de Joker, {}",
                "{C:inactive}Emplacement de consommable et Emplacement de carte dans le magasin.{}",
                },            
            },
            j_brawl_grisgris = {
                name = "Gris-Gris",
                text = { 
                "Pas de points ? ?",
		        "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre.",
                },
            },
            j_brawl_grisgris2 = {
                name = "Gris-Gris",
                text = { 
                "Baby Shark Doo Doo",
                "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre.",
                },
            },
            j_brawl_grisgris3 = {
                name = "Gris-Gris",
                text = { 
                "Peu original mais ça reste travaillé dessus ",
                "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre.",
                },
            },
            j_brawl_shaman = {
                name = "Appel De La Nature",
                text = {"Toutes les {C:attention}#3#{} cartes marquant des points",
                "fait apparaître un Bruce." ,
                "{C:inactive}Actuellement #4# cartes marquantes restantes.{}",
                "Gagne aussi {X:mult,C:white}X#1#{} Mult pour chaque Bruce actif.{}",
                "{C:inactive}Actuellement {X:mult,C:white}X#2#{} Mult {}",
                },
            },
            j_brawl_bruce = {
                name = "Bruce",
                text = {"Je suis un ours",
                "Il me reste {C:attention}#2#{}/3 manche(s) à vivre",
                },
        },
            j_brawl_jae_yong = {
                name = "Mix It Up !",
                text = {"Change enntre 2 modes à chaque manche",
                "Work mode : {X:chips,C:white,E:2}X#1#{} Chips",
                "Party mode : {X:mult,C:white,E:1}X#2#{} Mult",
                --"Currently {C:attention}#4#{} mode",
                },
            },
        },
    Other = {
			brawl_gadget_seal = {
                name = "Gadget Seal",
                text = {
                    "Create a {C:attention}Brawl{} {C:blue}consumable{}",
                    "when scoring this card",
                    "Upon scoring also {C:red}destroy{} this card"
                }
            },
        },
    Other = {
			brawl_gadget_seal = {
                name = "Gadget Seal",
                text = {
                    "Create a {C:attention}Brawl{} {C:blue}consumable{}",
                    "when scoring this card",
                    "Upon scoring also {C:red}destroy{} this card"
                }
            },
        },
        Voucher = {
            v_brawl_brawlpass = {
                name = "Brawl Pass",
                text = { "Gives {C:money}$#1#{} per hand at the end of every round."},            
            },
            v_brawl_brawlpassplus ={
                name = "Brawl Pass Plus",
                text = { "Gives {C:money}$#1#{} per discard at the end of every round.",
                            "Stack with {C:attention}Brawl Pass{}" 
                }
            },
        },
    Gear = {
            c_brawl_jujucurse = {
                name = "Curse Of Juju",
                text={
                "The curse of Juju may be rewarding ...",
                "Or not !",
                "{C:inactive}(Must have room to spawn Gris-Gris){}",
                },
            },
            c_brawl_mandycrush = {
                name = "Sugar Crush",
                text={
                "Destroy 3 random {C:attention}Cards{} in your hand",
                },
            },

            c_brawl_taracard = {
                name = "What's In The Cards",
                text={
                "Create a {C:green}Gadget{} seal on 1 selected card",
                },
            },
        },
    },
    misc = {
        dictionary = {
            k_work_ex = "Travail",
            b_powerup_cards = "Gear Cards",
            k_powerup = "Gear",
        },
        labels = {
            brawl_gadget_seal = "Gadget",
        }
    }
}