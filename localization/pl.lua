return {
    descriptions = {
    Joker = {
            j_brawl_buffet = {
                name = "Bufet",
                text = { "Każda użyta {C:blue}jednorazówka{}",
               "dodaje {X:chips,C:white}+#2#{} żetonów.",
                "{C:inactive}Aktualnie {C:blue}+#1# {C:inactive}żetonów",
                },
            },
            j_brawl_chesterjoker = {
                name = "What Will It Be",
                text = {"Has a random chance to trigger",
                "different effects when" ,
                "scoring cards.",
                },
            },
            j_brawl_surged = {
                name = "Upgrade Module",
                text = { 
                "Upgrade {X:mult,C:white}X#2#{} Mult",
                "for every {C:attention}Boss Blind{}",
                "defeated this run.",
                "{C:inactive}Currently {C:red}x#1# {C:inactive}Mult",
                },
            },
            j_brawl_commando = {
                name = "Commando",
                text = { 
                "This Joker gains {C:red}+#2#{} Mult",
                "when a card is scored.",
                "{C:inactive}Currently {C:red}+#1# {C:inactive}Mult",
                },
            },
            j_brawl_cheater = {
                name = "Rule Bender",
                text = { 
                "Clearly you haven't read section 426",
                "subsection 98 division 4 under invisible ink.",
                "{C:dark_edition}+1{} {C:inactive}Hand size, Hands, Discards, Joker slot, {}",
                "{C:inactive}Consumable slot and Card area in the shop{}",
                },            
            },
            j_brawl_grisgris = {
                name = "Gris-Gris",
                text = { 
                "No Score ?",
		        "Get {C:money}20${} after defeating the curse",
                "Debuff last for {C:attention}#3#{}/3 more rounds",
                },
            },
            j_brawl_grisgris2 = {
                name = "Gris-Gris",
                text = { 
                "Baby Shark Doo Doo",
                "Get {C:money}20${} after defeating the curse",
                "Debuff last {C:attention}#2#{}/3 more rounds",
                },
            },
            j_brawl_grisgris3 = {
                name = "Gris-Gris",
                text = { 
                "Unorigal but it's a WIP mod",
                "Get {C:money}20${} after defeating the curse",
                "Debuff last {C:attention}#2#{}/3 more rounds",
                },
            },
            j_brawl_shaman = {
                name = "Call Of The Wild",
                text = {"Every {C:attention}#3#{} scoring card",
                "summon one Bruce" ,
                "{C:inactive}Currently #4# scoring card left{}",
                "Gain {X:mult,C:white}X#1#{} Mult per Bruce active{}",
                "{C:inactive}Currently {X:mult,C:white}X#2#{} Mult {}",
                },
            },
            j_brawl_bruce = {
                name = "Bruce",
                text = {"I'm a bear",
                "I have {C:attention}#2#{}/3 round left to live",
                },
                },
            j_brawl_jae_yong = {
                name = "Mix It Up !",
                text = {"Switch between 2 modes every round",
                "Work mode : {X:chips,C:white,E:2}X#1#{} Chips",
                "Party mode : {X:mult,C:white,E:1}X#2#{} Mult",
                --"Currently {C:attention}#4#{} mode",
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
                "Stack with {C:attention}Brawl Pass{}" }
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
                "Create a {C;green}Gadget{} seal on 1 selected card",
                },
            },
        },
    },
    misc = {
        dictionary = {
            k_work_ex = "Work",
            b_powerup_cards = "Gear Cards",
            k_powerup = "Gear",
        },
        labels = {
            brawl_gadget_seal = "Gadget",
        }
    }
}