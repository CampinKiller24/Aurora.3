/datum/ghostspawner/human/house_volvalaad_voidsman
	short_name = "house_volvalaad_voidsman"
	name = "House Volvalaad Voidsman"
	desc = "You are an enlisted Ma’zal voidsman of the Imperial Fleet, seconded to House Volvalaad for a scientific mission. Voidsmen are generally recruited from the Imperial Frontier and are eager to pay off their Mo’ri’zal (“Blood Debt,” the Empire’s form of taxation) via military service. Few serve more than a few tours of duty due to the lonely and hazardous nature of interstellar military service. You have been trained to obey your superior, and most Primaries, without question or delay. (OOC Note: Players should be familiar with Dominian lore and play a character with a background appropriate to a Dominian Ma'zal.)"
	tags = list("External")
	mob_name_prefix = "VDSMN. " //Voidsman

	spawnpoints = list("house_volvalaad_voidsman")
	max_count = 2

	outfit = /datum/outfit/admin/house_volvalaad_voidsman
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "House Volvalaad Voidsman"
	special_role = "House Volvalaad Voidsman"
	respawn_flag = null


/datum/outfit/admin/house_volvalaad_voidsman
	name = "House Volvalaad Voidsman"

	uniform = /obj/item/clothing/under/dominia/fleet
	head = /obj/item/clothing/head/dominia/fleet
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel

	id = /obj/item/card/id/house_volvalaad

	l_ear = /obj/item/device/radio/headset/ship

	backpack_contents = list(/obj/item/storage/box/survival = 1)

/datum/outfit/admin/house_volvalaad_voidsman/get_id_access()
	return list(ACCESS_HOUSE_VOLVALAAD_SHIP, ACCESS_EXTERNAL_AIRLOCKS)

/datum/ghostspawner/human/house_volvalaad_officer
	short_name = "house_volvalaad_officer"
	name = "House Volvalaad Captain"
	desc = "You are a Secondary affiliated with House Volvalaad assigned to captain a science ship. Serve House Volvalaad by searching for artifacts, surveying planetary bodies, and making scientific discoveries. Goddess protect and keep you. (OOC Note: Players should be familiar with Dominian lore and play a character with a background appropriate to a Dominian Secondary.)"

	spawnpoints = list("house_volvalaad_officer")
	max_count = 1

	outfit = /datum/outfit/admin/house_volvalaad_officer

	assigned_role = "House Volvalaad Captain"
	special_role = "House Volvalaad Captain"


/datum/outfit/admin/house_volvalaad_officer
	name = "House Volvalaad Captain"
	uniform = /obj/item/clothing/under/dominia/imperial_suit/volvalaad
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel
	id = /obj/item/card/id/house_volvalaad

	l_ear = /obj/item/device/radio/headset/ship


/datum/ghostspawner/human/house_volvalaad_armsman
	short_name = "house_volvalaad_armsman"
	name = "House Volvalaad Armsman"
	desc = "You are a Ma’zal who serves as an Imperial Fleet armsman aboard a House Volvalaad science vessel, and are expected to defend the ship from boarders. Armsmen are experienced enlisted personnel of the Imperial Fleet who are often recruited from the Imperial Army. While not one of the elite Marines you are well-trained and well-equipped to defend their vessel. Armsmen are often older and more experienced than voidsmen and many have continued to serve in order to pay off the Mo’ri’zal (“Blood Debt,” the Empire’s form of taxation) of their relatives. You have been trained to obey your officer, and most Primaries, without question or hesitation. (OOC Note: Players should be familiar with Dominian lore and play a character with a background appropriate to a Dominian Ma'zal.)"
	mob_name_prefix = "ARMSN. " //Armsman

	spawnpoints = list("house_volvalaad_armsman")
	max_count = 2

	outfit = /datum/outfit/admin/house_volvalaad_armsman

	assigned_role = "House Volvalaad Armsman"
	special_role = "House Volvalaad Armsman"


/datum/outfit/admin/house_volvalaad_armsman
	name = "House Volvalaad Armsman"
	head = /obj/item/clothing/head/dominia/fleet/armsman
	uniform = /obj/item/clothing/under/dominia/fleet/armsman
	accessory = /obj/item/clothing/accessory/poncho/dominia_cape/mantle
	back = /obj/item/storage/backpack/satchel
	id = /obj/item/card/id/house_volvalaad

	l_ear = /obj/item/device/radio/headset/ship

/datum/ghostspawner/human/house_volvalaad_scientist
	short_name = "house_volvalaad_scientist"
	name = "House Volvalaad Scientist"
	desc = "You are a Secondary or Ma'zal affiliated with House Volvalaad who serves as a scientist aboard a House Volvalaad science vessel. Visit planetary bodies, make new discoveries, and bring honor to the Goddess and House. (OOC Note: Players should be familiar with Dominian lore and play a character with a background appropriate to a Dominian Ma'zal or Secondary.)"
	mob_name_prefix = null

	spawnpoints = list("house_volvalaad_scientist")
	max_count = 2

	outfit = /datum/outfit/admin/house_volvalaad_scientist

	assigned_role = "House Volvalaad Scientist"
	special_role = "House Volvalaad Scientist"


/datum/outfit/admin/house_volvalaad_scientist
	name = "House Volvalaad Scientist"
	uniform = /obj/item/clothing/under/dominia/imperial_suit/volvalaad
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel
	id = /obj/item/card/id/house_volvalaad

	l_ear = /obj/item/device/radio/headset/ship

//items

/obj/item/card/id/house_volvalaad
	name = "house volvalaad id"
	access = list(ACCESS_HOUSE_VOLVALAAD_SHIP, ACCESS_EXTERNAL_AIRLOCKS)
