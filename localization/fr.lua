return {
    descriptions = {
    Joker = {
            j_brawl_buffet = {
                name = "Buffet",
                text = { "Pour chaque {C:blue}consumable{} utilisé",
               "ce joker gagne {X:chips,C:white}+#2#{} Jetons",
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
                "Améliore {X:mult,C:white}X#2#{} Multi",
                "pour chaque {C:attention}Boss Blinde{} battue",
                "{C:inactive}Actuellement {C:red}x#1# {C:inactive}Multi",
                },
            },
            j_brawl_commando = {
                name = "Commando",
                text = { 
                "Ce Joker gagne {C:red}+#2#{} Multi",
                "lorsqu'une carte jouée marque des points",
                "{C:inactive}Actuellement {C:red}+#1# {C:inactive}Multi",
                },
            },
            j_brawl_cheater = {
                name = "Tricheur",
                text = { 
                "Clairement tu n'as pas lu la section 426",
                "sous-section 98 division 4 sous de l'encre invisible",
                "{C:dark_edition}+1{} {C:inactive}Taille de main, Mains, Défausses, Emplacement de Joker, {}",
                "{C:inactive}Emplacement de consommable et Emplacements dans le magasin{}",
                },            
            },
            j_brawl_grisgris = {
                name = "Gris-Gris",
                text = { 
                "Pas de points ?",
		        "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre",
                },
            },
            j_brawl_grisgris2 = {
                name = "Gris-Gris",
                text = { 
                "Baby Shark Doo Doo",
                "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre",
                },
            },
            j_brawl_grisgris3 = {
                name = "Gris-Gris",
                text = { 
                "Peu original mais ça reste travaillé dessus ",
                "Récupère {C:money}20${} après avoir vaincu la malédiction",
                "Il reste {C:attention}#3#{}/3 manche(s) avant de la vaincre",
                },
            },
            j_brawl_shaman = {
                name = "Appel De La Nature",
                text = {"Toutes les {C:attention}#3#{} cartes marquant des points",
                "fait apparaître un Bruce" ,
                "{C:inactive}Actuellement #4# cartes marquantes restantes{}",
                "Gagne aussi {X:mult,C:white}X#1#{} Multi pour chaque Bruce actif{}",
                "{C:inactive}Actuellement {X:mult,C:white}X#2#{} Multi {}",
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
                "Mode Travail : {X:chips,C:white,E:2}X#1#{} Chips",
                "Mode fête : {X:mult,C:white,E:1}X#2#{} Multi",
                --"Currently {C:attention}#4#{} mode",
                },
            },
            j_brawl_activator = {
                name = "Gadget Gadget Gadget !",
                text = {
                    "Pour chaque carte marquantes ",
                    "avec un {C:green}Sceau Vert{}",
                    "Ce joker gagne {X:mult,C:white}X#2#{} Multi",
                    "{C:inactive}Actuellement {X:mult,C:white}X#1#{} Multi",
                },
            },
            j_brawl_colette = {
                name = "TON PLUS GRAND FAN",
                text = {
                    "Pour chaque Joker {C:attention}Brawler{}",
                    "dans votre deck, Ce Joker ajoute {X:mult,C:white}X#2#{} au Multi",
                    "{C:inactive}Actuellement {X:mult,C:white}X#1#{} {C:inactive}Multi{}",
                }
            },
        },
    Other = {
			brawl_gadget_seal = {
                name = "Sceau Gadget",
                text = {
                    "Crée un {C:blue}consommable{} {C:attention}Brawl{}",
                    "lorsque la carte marque des points",
                    "En jouant cette carte elle se ",
                    "{C:red}détruit{} en marquant des points",
                }
            },
            brawl_tooltip_gadget ={
                name = "Sceau Gadget",
                text = {
                    "Crée un {C:blue}consommable{} {C:attention}Brawl{}",
                    "lorsque la carte marque des points",
                    "En jouant cette carte elle se ",
                    "{C:red}détruit{} en marquant des points",
                }
            },
            brawl_tooltip_brawler ={
                name = "Brawler Joker",
                text = {
                    "Joker à thème autour d'un",
                    "Brawler provenant de {C:money}Brawl Stars{}"
                },
            },
        },
        Voucher = {
            v_brawl_brawlpass = {
                name = "Brawl Pass",
                text = { "Gives {C:money}$#1#{} per hand at the end of every round"},            
            },
            v_brawl_brawlpassplus ={
                name = "Brawl Pass Plus",
                text = { "Gives {C:money}$#1#{} per discard at the end of every round",
                            "Stack with {C:attention}Brawl Pass{}" 
                }
            },
        },
    Spectral = {
        c_brawl_gadgetspectral = {
                name = "What's In The Cards",
                text={
                "Ajoute un {C:green}Sceau Vert{}",
                "à {C:attention}1{} carte selectionné",
                "dans votre main",
                },
            },
        },
    Tarot = {
            c_brawl_jujucurse = {
                name = "Curse Of Juju",
                text={
                "La malédiction de Juju vous récompensera ...",
                "Ou pas !",
                "{C:inactive}Dois avoir de la place{}",
                "{C:inactive}pour faire apparaitre la malédiction{}",
                },
            },
        },     
    Gear = {
            c_brawl_mandycrush = {
                name = "Sugar Crush",
                text={
                "Détruit {C:attention}3{} {C:attention}Cards{} ",
                "aléatoire dans votre main",
                },
            },
        },
    },
    misc = {
        dictionary = {
            b_gear_cards = "Cartes Equipement",
            k_gear = "Equipement",
            k_plus_gear = "+1 Equipement"
        },
        labels = {
            brawl_gadget_seal = "Gadget",
        }
    }
}