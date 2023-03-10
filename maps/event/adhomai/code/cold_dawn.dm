
/area/palace_free
	name = "Palace of the Free Tajara"
	icon_state = "bluenew"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/mineral/adhomai
	flags = RAD_SHIELDED

/obj/item/clothing/under/tajaran/pra_uniform/guard
	name = "republican guard uniform"
	desc = "A fancy uniform used by the elites of the Republican Guard."
	icon_state = "republican_guard"
	item_state = "republican_guard"

/obj/item/clothing/head/beret/tajaran/pra/guard
	name = "republican guard beret"
	desc = "A fancy hat used by the elites of the Republican Guard."
	icon_state = "republican_guard_beret"
	item_state = "republican_guard_beret"


/obj/structure/silo
	name = "silo"
	desc = "An ominous structure."
	icon = 'icons/obj/silo.dmi'
	icon_state = "hidden"

/obj/structure/silo/proc/open()
	flick("reveal", src)
	icon_state = "revealed"

/datum/outfit/admin/pra_soldier_vr
	name = "People's Republic of Adhomai Soldier"

	uniform = /obj/item/clothing/under/tajaran/pra_uniform
	head = /obj/item/clothing/head/beret/tajaran/pra
	suit = /obj/item/clothing/suit/storage/tajaran/pra_jacket/armored
	back = /obj/item/gun/projectile/shotgun/pump/rifle
	shoes = /obj/item/clothing/shoes/tajara/combat
	belt = /obj/item/storage/belt/military
	accessory = /obj/item/clothing/accessory/badge/hadii_card
	l_ear = null
	belt_contents = list(
		/obj/item/ammo_magazine/boltaction = 4,
		/obj/item/grenade/frag = 2,
		/obj/item/gun/projectile/pistol/adhomai = 1,
		/obj/item/ammo_magazine/mc9mm = 2 )
	id = /obj/item/card/id

/datum/outfit/admin/pra_soldier_vr/get_id_access()
	return list(access_pra)

/datum/outfit/admin/pra_soldier_vr/commissar
	name = "People's Republic of Adhomai Party Commissar"

	uniform = /obj/item/clothing/under/tajaran/army_commissar
	head = /obj/item/clothing/head/tajaran/army_commissar
	suit = null
	belt = /obj/item/gun/projectile/deagle/adhomai
	belt_contents = null
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
						/obj/item/ammo_magazine/a50 = 3,
						/obj/item/material/knife/trench = 1
						)
	l_hand = /obj/item/device/megaphone

	accessory = /obj/item/clothing/accessory/hadii_pin

/datum/outfit/admin/pra_soldier_vr/guard
	name = "Republican Guard"

	uniform = /obj/item/clothing/under/tajaran/pra_uniform/guard
	head = /obj/item/clothing/head/beret/tajaran/pra/guard
	suit = null
	back = /obj/item/gun/projectile/automatic/rifle/adhomian

	belt_contents = list(
		/obj/item/ammo_magazine/boltaction = 4,
		/obj/item/grenade/frag = 2,
		/obj/item/gun/projectile/pistol/adhomai = 1,
		/obj/item/ammo_magazine/mc9mm = 1,
		/obj/item/material/knife/trench = 1)


/datum/outfit/admin/ala_base_vr
	name = "Adhomai Liberation Army Soldier"

	uniform = /obj/item/clothing/under/tajaran/ala
	head = /obj/item/clothing/head/beret/tajaran/dpra/alt
	back = /obj/item/gun/projectile/shotgun/pump/rifle
	shoes = /obj/item/clothing/shoes/tajara/combat
	belt = /obj/item/storage/belt/military
	l_ear = null

	belt_contents = list(
		/obj/item/ammo_magazine/boltaction = 4,
		/obj/item/grenade/frag = 2,
		/obj/item/gun/projectile/silenced = 1,
		/obj/item/ammo_magazine/c45m = 2)

	id = /obj/item/card/id

/datum/outfit/admin/ala_base_vr/get_id_access()
	return list(access_dpra)

/datum/outfit/admin/ala_base_vr/sniper
	name = "Das’nrra Marksmen"

	uniform = /obj/item/clothing/under/tajaran/ala/black
	head = /obj/item/clothing/head/beret/tajaran/dpra/alt
	back = /obj/item/gun/projectile/dragunov


	belt_contents = list(
		/obj/item/ammo_magazine/d762 = 3,
		/obj/item/gun/projectile/silenced = 1,
		/obj/item/ammo_magazine/c45m = 2)

/datum/outfit/admin/ala_base_vr/spy
	name = "Hotak's Commando"

	uniform = /obj/item/clothing/under/tajaran/ala/wraps
	head = /obj/item/clothing/head/tajaran/ala_wraps
	belt = /obj/item/gun/projectile/shotgun/foldable
	back = null
	accessory = /obj/item/clothing/accessory/storage/bandolier
	accessory_contents = list(/obj/item/ammo_casing/shotgun = 5,
							/obj/item/ammo_casing/shotgun/pellet = 5)

	back = /obj/item/gun/projectile/shotgun/pump/rifle
	belt_contents = null

	backpack_contents = list(
		/obj/item/grenade/frag = 2,
		/obj/item/material/knife/trench = 1,
		/obj/item/gun/projectile/silenced = 1,
		/obj/item/ammo_magazine/c45m = 2)


//tanks

/mob/living/heavy_vehicle/premade/pra_tank
	name = "Nav'twir MK.III light tank"
	desc = "An early light tank model used by the People's Republic of Adhomai."
	icon_state = "durand"

	h_head = null
	e_head = /obj/item/mech_component/sensors/combat/tank
	e_body = /obj/item/mech_component/chassis/combat/tank
	e_arms = /obj/item/mech_component/manipulators/combat/tank
	e_legs = /obj/item/mech_component/propulsion/tracks/tank
	e_color = "#78866b"

	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg/tank
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/tank_cannon

/obj/item/mech_component/manipulators/combat/tank
	name = "tank cannon"
	exosuit_desc_string = "a light tank cannon"
	desc = "A ballistic cannon used by an Adhomian tank."
	icon_state = "pra_cannon"

/obj/item/mech_component/propulsion/tracks/tank
	icon_state = "treads"

/obj/item/mech_component/sensors/combat/tank
	name = "tank turret"
	gender = PLURAL
	exosuit_desc_string = "tank turret"
	desc = "The cockpit of an Adhomian tank."
	icon_state = "pra_turret"

/obj/item/mech_component/chassis/combat/tank
	name = "tank hull"
	hatch_descriptor = "canopy"
	exosuit_desc_string = "an armored hull"
	desc = "The hull of an adhomian tank."
	icon_state = "pra_hull"
	transparent_cabin = FALSE

/mob/living/heavy_vehicle/premade/dpra_tank
	name = "Yve'kha III light tank"
	desc = "An light tank model used by the Adhomai Liberation Army."
	icon_state = "durand"

	h_head = null
	e_head = /obj/item/mech_component/sensors/combat/tank/ala
	e_body = /obj/item/mech_component/chassis/combat/tank/ala
	e_arms = /obj/item/mech_component/manipulators/combat/tank/ala
	e_legs = /obj/item/mech_component/propulsion/tracks/tank
	e_color = COLOR_DARK_GUNMETAL

	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg/tank
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/tank_cannon

/obj/item/mech_component/manipulators/combat/tank/ala
	icon_state = "dpra_cannon"

/obj/item/mech_component/sensors/combat/tank/ala
	icon_state = "dpra_turret"

/obj/item/mech_component/chassis/combat/tank/ala
	icon_state = "dpra_hull"


/mob/living/heavy_vehicle/premade/nka_tank
	name = "Zhsram II light tank"
	desc = "A pre-war light tank model used by the New Kingdom of Adhomai."
	icon_state = "durand"

	h_head = null
	e_head = /obj/item/mech_component/sensors/combat/tank/nka
	e_body = /obj/item/mech_component/chassis/combat/tank/nka
	e_arms = /obj/item/mech_component/manipulators/combat/tank/nka
	e_legs = /obj/item/mech_component/propulsion/tracks/tank
	e_color = COLOR_TITANIUM

	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg/tank
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/tank_cannon

/obj/item/mech_component/manipulators/combat/tank/nka
	icon_state = "nka_cannon"

/obj/item/mech_component/sensors/combat/tank/nka
	icon_state = "nka_turret"

/obj/item/mech_component/chassis/combat/tank/nka
	icon_state = "nka_hull"

/obj/item/mecha_equipment/mounted_system/combat/smg/tank
	icon_state = "tank_lmg"

/obj/item/mecha_equipment/mounted_system/combat/tank_cannon
	name = "tank cannon"
	desc = "A tank cannon."
	icon_state = "tank_canon"
	holding_type = /obj/item/gun/energy/mountedcannon/tank

/obj/item/gun/energy/mountedcannon/tank
	projectile_type = /obj/item/projectile/bullet/tank
	max_shots = 1

/obj/item/projectile/bullet/tank
	name = "warhead"
	icon_state = "missile"
	damage = 50
	armor_penetration = 30
	anti_materiel_potential = 4
	embed = FALSE
	penetrating = FALSE
	var/heavy_impact_range = 1

/obj/item/projectile/bullet/tank/on_impact(var/atom/A)
	explosion(A, -1, 0, 2)
	..()

//wheel tank

/mob/living/heavy_vehicle/premade/wheel_tank
	name = "wheel tank"
	desc = "A single-track-wheeled light reconnaissance vehicle inspired by the Tajaran monowheels. It has room for a single driver who also controls its armament, a pair of machine guns."
	icon_state = "durand"

	h_head = null
	e_head = /obj/item/mech_component/sensors/combat/tank/wheel
	e_body = /obj/item/mech_component/chassis/combat/tank/wheel
	e_arms = /obj/item/mech_component/manipulators/combat/tank/wheel
	e_legs = /obj/item/mech_component/propulsion/tracks/tank/wheel
	e_color = COLOR_TITANIUM

	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg/tank/wheel
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg/tank/wheel

/obj/item/mech_component/manipulators/combat/tank/wheel
	icon_state = "wheeltank_arms"
	max_damage = 90

/obj/item/mech_component/sensors/combat/tank/wheel
	icon_state = "wheeltank_head"
	max_damage = 30

/obj/item/mech_component/chassis/combat/tank/wheel
	icon_state = "wheeltank_chassis"
	max_damage = 120

/obj/item/mech_component/propulsion/tracks/tank/wheel
	icon_state = "wheeltank_legs"

/obj/item/mecha_equipment/mounted_system/combat/smg/tank/wheel
	icon_state = "gunpod"

/obj/item/badmoon_map
	name = "adhomian map replica"
	desc = "A replica of an old adhomian map."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "map"
	w_class = ITEMSIZE_SMALL

/mob/living/bot/beer
	name = "alcohol serving bot"
	desc = "A small bot full of alcohol."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "beerbot"

/mob/living/bot/beer/attackby(var/obj/item/O, var/mob/user)
	..()
	if(!user.Adjacent(src)) return
	var/obj/item/reagent_containers/RG = O
	if (istype(RG) && RG.is_open_container())
		if(RG.reagents.total_volume >= RG.volume)
			to_chat(usr, SPAN_WARNING("\The [RG] is already full."))
			return
		RG.reagents.add_reagent(/singleton/reagent/alcohol/victorygin, min(RG.volume - RG.reagents.total_volume))
		playsound(src.loc, 'sound/machines/reagent_dispense.ogg', 25, 1)

/mob/living/bot/beer/think()
	..()
	if(prob(5))
		var/moving_to = 0 // otherwise it always picks 4, fuck if I know.   Did I mention fuck BYOND
		moving_to = pick(alldirs)
		set_dir(moving_to)			//How about we turn them the direction they are moving, yay.
		Move(get_step(src,moving_to))

/mob/living/bot/beer/death()
	..(null, "blows apart!")
	var/T = get_turf(src)
	new /obj/effect/gibspawner/robot(T)
	spark(T, 1, alldirs)
	qdel(src)

/obj/structure/tank_dispenser
	name = "tank dispenser"
	desc = "A virtual reality capable of summoning a tank."
	icon = 'icons/obj/glasscasebutton.dmi'
	icon_state = "c1"
	var/used = FALSE
	var/tank_type = /mob/living/heavy_vehicle/premade/pra_tank

/obj/structure/tank_dispenser/Initialize()
	. = ..()
	add_overlay("b41")

/obj/structure/tank_dispenser/examine(mob/user)
	. = ..()
	if(used)
		to_chat(user, SPAN_WARNING("\The [src] is not ready to dispense another tank."))
	else
		to_chat(user, SPAN_NOTICE("\The [src] is ready."))

/obj/structure/tank_dispenser/attack_hand(mob/user as mob)
	if(used)
		return
	spawn_tank()

/obj/structure/tank_dispenser/proc/spawn_tank()
	used = TRUE
	new tank_type (get_turf(src))

	addtimer(CALLBACK(src, PROC_REF(rearm)), 5 MINUTES)

/obj/structure/tank_dispenser/proc/rearm()
	used = FALSE

/obj/structure/tank_dispenser/ala
	tank_type = /mob/living/heavy_vehicle/premade/dpra_tank

/obj/vehicle/bike/monowheel/aerosled
	name = "armored aerosled"
	desc = "A propeller-driven sled used for reconnaissance."
	icon = 'icons/obj/aerosled.dmi'
	icon_state = "aerosled_off"
	bike_icon = "aerosled"
	pixel_x = -16
	mob_offset_y = 4

/obj/vehicle/bike/monowheel/aerosled/check_destination(var/turf/destination)
	var/static/list/types = typecacheof(list(/turf/space, /turf/simulated/floor/exoplanet/mineral/adhomai))
	if(is_type_in_typecache(destination,types) || pulledby)
		return TRUE
	else
		return FALSE

/obj/item/gun/projectile/automatic/rifle/nka
	name = "prototype assault rifle"
	desc = "A rustic-looking rifle. It is made with unpainted metal and has little to no finishing."
	icon = 'icons/obj/guns/nka_assault.dmi'
	icon_state = "nka_ar"
	item_state = "nka_ar"

	can_bayonet = TRUE
	knife_x_offset = 22
	knife_y_offset = 13

	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	fire_sound = 'sound/weapons/gunshot/gunshot_rifle.ogg'

	is_wieldable = TRUE

	can_bayonet = TRUE

	jam_chance = 25
	magazine_type = /obj/item/ammo_magazine/c762/nka
	allowed_magazines = list(/obj/item/ammo_magazine/c762/nka)

/obj/item/gun/projectile/automatic/rifle/nka/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "nka_ar"
		item_state = "nka_ar"
	else
		icon_state = "nka_ar_nomag"
		item_state = "nka_ar_nomag"

/obj/item/ammo_magazine/c762/nka
	icon = 'icons/obj/guns/nka_assault.dmi'
	icon_state = "nka_mag"
	max_ammo = 15

/obj/structure/chandelier
	name = "chandelier"
	desc = "A fancy ornament with suspended lights."
	light_color = COLOR_ORANGE
	icon = 'icons/obj/chandelier.dmi'
	icon_state = "chandelier"
	anchored = TRUE
	density = FALSE
	light_wedge = LIGHT_OMNI
	light_range = 4
	light_power = 4
	layer = ABOVE_ALL_MOB_LAYER
	var/fallen = FALSE

/obj/structure/chandelier/Crossed(AM as mob|obj, var/ignore_deployment = FALSE)
	if(!fallen)
		if(isliving(AM))
			var/mob/living/L = AM
			if(prob(5))
				trigger(L)
			else
				visible_message("<span class='danger'>The [src] swings ominously.</span>")
				flick("chandelier_fast", src)

	..()

/obj/structure/chandelier/proc/trigger(mob/living/L)
	fallen = TRUE
	spark(src, 3, alldirs)
	if(ishuman(L))
		L.Weaken(2)
	flick("chandelier_fall", src)
	visible_message(	"<span class='danger'>The [src] falls on top of \the [L]!</span>")
	L.adjustBruteLoss(45)
	icon_state = "chandelier_down"
	density = TRUE

/area/exoplanet/adhomai/north_pole
	name = "Adhomian North Pole"
	flags = HIDE_FROM_HOLOMAP

/area/exoplanet/adhomai/shelter
	name = "Adhomian North Pole"
	icon_state = "purple"
	flags = RAD_SHIELDED
	requires_power = FALSE

/obj/structure/lattice/catwalk/indoor/grate/pier
	name = "pier"
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "planks"

/obj/structure/railing/ropes
	name = "rope fence"
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "rope-railing"
	color = null
	anchored = TRUE

/obj/structure/railing/ropes/Initialize()
	. = ..()
	color = null

/obj/structure/railing/ropes/update_icon()
	return

/area/da_boat
	name = "Minharrzka Heart"
	icon_state = "bluenew"
	requires_power = FALSE
	dynamic_lighting = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/mineral/adhomai
	flags = RAD_SHIELDED

/area/da_boat/bar
	name = "The Zhan Pit Bar"
	icon_state = "maint_bar"

/obj/machinery/media/jukebox/phonograph/bar
	tracks = list(
		new/datum/track("Call of the Stars", 'sound/music/resurrection.ogg'),
		new/datum/track("March of the Progress", 'sound/music/NTorchestra.ogg'),
		new/datum/track("A Warm Morning", 'sound/music/winterspell.ogg'),
		new/datum/track("Winds from Beyond Adhomai", 'sound/music/pole.ogg'),
		new/datum/track("A Night in Crevus", 'sound/music/tranquilite.ogg'),
		new/datum/track("Adhomaykh", 'sound/music/siberiade.ogg')
	)
	anchored = TRUE

/turf/simulated/floor/exoplanet/cold_dawn_cave
	name = "cavern floor"
	icon = 'icons/turf/basalt.dmi'
	icon_state = "basalt0"
	dirt_color = "#2F2F2F"

/turf/simulated/floor/exoplanet/cold_dawn_cave/Initialize(mapload)
	if (prob(20))
		var/variant = rand(0,12)
		icon_state = "basalt[variant]"
	temperature = T0C-10

/turf/simulated/mineral/cold_dawn_cave
	mined_turf = /turf/simulated/floor/exoplanet/cold_dawn_cave

/material/stone/castle_wall
	name = MATERIAL_CASTLE
	icon_colour = "#6D6C74"

/turf/simulated/wall/castle/Initialize(mapload)
	canSmoothWith = list(src.type)
	. = ..(mapload, MATERIAL_CASTLE)
	canSmoothWith = list(src.type)

/turf/simulated/floor/exoplanet/castle
	name = "adhomian masonry floor"
	base_icon = 'icons/obj/cold_dawn.dmi'
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "stonebrick"
	smooth = SMOOTH_FALSE
	canSmoothWith = null

/turf/simulated/floor/exoplanet/castle/large
	icon_state = "stonebricklarge"

/turf/simulated/floor/exoplanet/castle/raskara
	icon_state = "raskara-slab"

/area/da_boat/mountains
	name = "Din'akk Mountains"
	ambience = list('sound/effects/wind/tundra0.ogg', 'sound/effects/wind/tundra1.ogg', 'sound/effects/wind/tundra2.ogg', 'sound/effects/wind/spooky0.ogg', 'sound/effects/wind/spooky1.ogg')

/area/da_boat/mountains/caverns
	name = "Caverns"
	ambience = AMBIENCE_OTHERWORLDLY
	base_turf = /turf/simulated/floor/exoplanet/cold_dawn_cave

/obj/item/treasure
	name = "silver mortar"
	desc = "A mortar made of solid silver."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "silvermortar"
	w_class = ITEMSIZE_NORMAL
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/treasure/alembic
	name = "gilded alembic"
	desc = "An alchemical still covered in gold."
	icon_state = "goldalembic"

/obj/item/treasure/figurine
	name = "gold figurine"
	desc = "A figurine made from pure gold. It is oddly familiar..."
	icon_state = "gold_schlorrgo"
	w_class = ITEMSIZE_LARGE

/obj/item/treasure/bowl
	name = "silver bowl"
	desc = "An ancient adhomian bowl made of fine silver."
	icon_state = "bowl"

/obj/item/treasure/plate
	name = "silver plate"
	desc = "An ancient adhomian plate made of gold and silver."
	icon_state = "platter"
	w_class = ITEMSIZE_LARGE

/obj/item/reagent_containers/glass/goblet
	name = "silver goblet"
	desc = "A fancy goblet made of pure silver."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "goblet"
	w_class = ITEMSIZE_NORMAL

/obj/structure/raskara
	name = "black mirror"
	desc = "A mirror made from dark glass. Your reflection stares back at you."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "blackmirror"

/obj/item/storage/box/fancy/cold_dawn
	name = "jewel box"
	desc = "A fancy box adorned by precious adhomian gems."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "jewelbox"
	use_sound = 'sound/items/drop/glass.ogg'
	drop_sound = 'sound/items/drop/toolbox.ogg'
	pickup_sound = 'sound/items/pickup/toolbox.ogg'
	storage_slots = 6
	can_hold = list(/obj/item/clothing/ring,)
	starts_with = list(/obj/item/clothing/ring/material/gold = 2, /obj/item/clothing/ring/material/silver = 2, /obj/item/coin/gold = 2)
	chewable = FALSE
	opened = FALSE
	closable = TRUE
	w_class = ITEMSIZE_LARGE

/obj/item/storage/box/fancy/cold_dawn/update_icon()
	. = ..()
	if(opened)
		icon_state = "jewelbox-open"
	else
		icon_state = "jewelbox"

/obj/item/treasure/urn
	name = "small urn"
	desc = "A small adhomian urn."
	icon_state = "urn-small"
	var/broken = FALSE

/obj/item/treasure/urn/update_icon()
	if(broken)
		icon_state = "urn-small-broken"
	else
		icon_state = "urn-small"

/obj/item/treasure/urn/proc/damage()
	if(broken)
		return
	visible_message(SPAN_WARNING("\The [src] breaks!"))
	playsound(src, /singleton/sound_category/glass_break_sound, 70, 1)
	broken = TRUE
	update_icon()

/obj/item/treasure/urn/attackby(obj/item/W, mob/user)
	if(broken)
		return
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(src)
	if(W.force <= 5)
		visible_message(SPAN_WARNING("\The [W] bounces off \the [src]!"))
		return
	visible_message(SPAN_WARNING("\The [user] strikes \the [src] with \the [W]!"))
	damage()

/obj/item/treasure/urn/ex_act(severity)
	damage()

/obj/item/treasure/urn/bullet_act(var/obj/item/projectile/Proj)
	if(broken)
		return
	if(!Proj)
		return
	if(!Proj.damage)
		return
	damage()

/obj/item/treasure/urn/attack_hand(var/mob/user)
	if (user.a_intent == I_HURT)
		if(broken)
			return
		visible_message(SPAN_WARNING("\The [user] kicks \the [src]!"))
		damage()
	else
		..()

/obj/item/treasure/urn/throw_impact(atom/hit_atom, var/speed)
	..()

	if(!broken)
		damage()

/obj/item/treasure/urn/large
	name = "large urn"
	desc = "A large adhomian urn."
	icon_state = "urn-large"
	w_class = ITEMSIZE_LARGE

/obj/item/treasure/urn/large/update_icon()
	if(broken)
		icon_state = "urn-large-broken"
	else
		icon_state = "urn-large"

/obj/structure/treasure_pile
	name = "treasure pile"
	desc = "A pile of treasures."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "gold1"
	anchored = TRUE
	var/small_pile = FALSE

/obj/structure/treasure_pile/attack_hand(mob/user)
	//Human mob
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.visible_message("<b>[user]</b> starts searching through \the [src]...", SPAN_NOTICE("You start searching through \the [src]..."))
		//Do the searching
		if(do_after(user, rand(4 SECONDS, 6 SECONDS)))
			var/obj/item/I = give_item()
			H.put_in_hands(I)
			to_chat(H, SPAN_NOTICE("You found \a [I]!"))
	else
		return ..()

/obj/structure/treasure_pile/proc/give_item()
	var/treasure

	if(small_pile)
		treasure = /obj/item/coin/gold
	else
		treasure = pick (/obj/item/coin/gold, /obj/item/clothing/ring/material/silver, /obj/item/clothing/ring/material/gold, /obj/item/storage/box/fancy/cold_dawn, /obj/item/treasure/urn, /obj/item/treasure, /obj/item/treasure/figurine, /obj/item/treasure/bowl, /obj/item/treasure/plate, /obj/item/reagent_containers/glass/goblet, /obj/item/stack/material/silver, /obj/item/stack/material/gold, /obj/item/stack/material/diamond)

	var/obj/item/I = new treasure()
	return I

/obj/item/clothing/head/helmet/cold_dawn
	name = "ancient adhomian helmet"
	desc = "A helmeted used by ancient Tajaran warriors."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "helm"
	item_state = "helm"
	contained_sprite = TRUE
	w_class = ITEMSIZE_LARGE
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)
	has_storage = FALSE

/obj/item/clothing/suit/armor/cold_dawn
	name = "ancient adhomian armor"
	desc = "A suit of armor used by ancient Tajaran warriors."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "armor"
	item_state = "armor"
	w_class = ITEMSIZE_LARGE
	contained_sprite = TRUE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)
	siemens_coefficient = 0.35

/obj/structure/closet/sarcophagus
	name = "sarcophagus"
	desc = "An adhomian sarcophagus made of stone."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "sarcophagus-base"
	store_structure = TRUE
	dense_when_open = TRUE
	open_sound = 'sound/effects/stonedoor_openclose.ogg'
	close_sound = 'sound/effects/stonedoor_openclose.ogg'
	layer = 2.98
	var/lid_icon = "lid-messa"
	var/trapped = FALSE
	var/triggered = FALSE

/obj/structure/closet/sarcophagus/update_icon()
	if(!opened)
		layer = OBJ_LAYER
		add_overlay(lid_icon)

	else
		layer = BELOW_OBJ_LAYER
		cut_overlays()

/obj/structure/closet/sarcophagus/animate_door(var/closing = FALSE)
	return

/obj/structure/closet/sarcophagus/attack_hand(mob/user as mob)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(trapped && !triggered)
			do_trap_effect(H)

/obj/structure/closet/sarcophagus/proc/do_trap_effect(var/mob/living/carbon/human/H)
	if(triggered)
		return

	var/trap = pick ("shotgun", "fire", "shock", "mob")

	switch(trap)
		if("shotgun")
			var/turf/T = get_turf(src)
			var/obj/item/projectile/bullet/pellet/shotgun/LE = new (T)
			playsound(usr.loc, 'sound/weapons/gunshot/gunshot_shotgun2.ogg', 75, 1)
			LE.launch_projectile(H)
			new /obj/item/gun/projectile/shotgun/improvised(get_turf(src))

		if("fire")
			visible_message(SPAN_DANGER("Flames engulf \the [H]!"))
			H.adjustFireLoss(30)
			H.IgniteMob(5)

		if("shock")
			visible_message(SPAN_DANGER("\The [src] crackles with energy!"))
			H.electrocute_act(20,src, 1)
			spark(src, 3, alldirs)

		if("mob")
			visible_message(SPAN_DANGER("A creature flies from \the [src]!"))
			new /mob/living/simple_animal/hostile/wind_devil(get_turf(src))

	triggered = TRUE

/obj/structure/closet/sarcophagus/mummy
	lid_icon = "lid-raskara"

/obj/structure/closet/sarcophagus/mummy/fill()
	new /obj/structure/mummy(src)

/obj/structure/mummy
	name = "adhomian mummy"
	desc = "The preserved body of a long dead adhomian monarch."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "mummy"
	anchored = FALSE

/obj/structure/table/rack/fancy_table
	name = "stone slab"
	desc = "A large stone slab."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "standalone"
	table_mat = MATERIAL_CASTLE

/obj/structure/table/rack/fancy_table/center
	icon_state = "center"

/obj/structure/table/rack/fancy_table/left
	icon_state = "left"

/obj/structure/table/rack/fancy_table/right
	icon_state = "right"

/obj/structure/spike_trap
	name = "holes"
	desc = "Multiples hole in the ground."
	icon = 'icons/obj/spike_trap.dmi'
	icon_state = "retracted"
	var/triggered = FALSE
	mouse_opacity = FALSE
	layer = BELOW_OBJ_LAYER

/obj/structure/spike_trap/Crossed(AM as mob|obj, var/ignore_deployment = FALSE)
	if(!triggered)
		if(ishuman(AM))
			var/mob/living/carbon/human/L = AM
			trigger(L)

	..()

/obj/structure/spike_trap/proc/trigger(var/mob/living/carbon/human/L)
	triggered = TRUE
	L.Weaken(3)
	visible_message(SPAN_DANGER("Spikes emerge from the ground!"))
	flick("extend", src)
	L.adjustBruteLoss(45)
	mouse_opacity = TRUE
	name = "spike trap"
	desc = "A trap with multiple spikes emerging from the ground."
	icon_state = "static"

/area/shuttle/scc_evac
	name = "SCC Evacuation Shuttle"

//shuttle

/datum/shuttle/autodock/ferry/scc_evac
	name = "SCC Evac Shuttle"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/scc_evac
	move_time = 20
	dock_target = "scc_evac"
	waypoint_station = "nav_scc_evac_dock"
	landmark_transition = "nav_scc_evac_interim"
	waypoint_offsite = "nav_scc_evac_start"

/obj/effect/shuttle_landmark/scc_evac/start
	name = "SCC Evac Landing"
	landmark_tag = "nav_scc_evac_start"
	docking_controller = "scc_evac_station"
	base_turf = /turf/simulated/floor/exoplanet/snow
	base_area = /area/da_boat/mountains

/obj/effect/shuttle_landmark/scc_evac/interim
	name = "In Transit"
	landmark_tag = "nav_scc_evac_interim"
	base_turf = /turf/space/transit/bluespace/west

/obj/effect/shuttle_landmark/scc_evac/dock
	name = "SCC Evac Shuttle Dock"
	landmark_tag = "nav_scc_evac_dock"
	docking_controller = "scc_evac_shuttle_dock"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/machinery/computer/shuttle_control/scc_evac
	name = "evacuation shuttle control console"
	req_access = list(access_merchant)
	shuttle_tag = "SCC Evac Shuttle"

/obj/structure/stone_slab
	name = "adhomian calendar stone"
	desc = "A large sone slab with some ancient text on it."
	icon = 'icons/obj/stone_slab.dmi'
	icon_state = "slab"
	pixel_x = -16
	opacity = TRUE


/mob/living/simple_animal/snow_strider
	name = "snow strider"
	desc = "An animal hunted and farmed by the Tajara for its meat and fur."
	icon = 'icons/obj/cold_dawn_48.dmi'
	icon_state = "snow_strider"
	icon_living = "snow_strider"
	icon_dead = "snow_strider_dead"
	turns_per_move = 3
	speak_emote = list("chuffs")
	emote_hear = list("growls")
	emote_see = list("shakes its head", "stamps a foot", "glares around")
	a_intent = I_HURT
	stop_automated_movement_when_pulled = 0
	mob_size = 12
	meat_type = /obj/item/reagent_containers/food/snacks/meat/adhomai
	organ_names = list("head", "chest", "right fore leg", "left fore leg", "right rear leg", "left rear leg")

	maxHealth = 50
	health = 50

	butchering_products = list(/obj/item/stack/material/animalhide = 5)
	meat_amount = 8
	faction = "Adhomai"
	pixel_x = -8


/mob/living/simple_animal/climber
	name = "snow strider"
	desc = "A rideable beast of burden, large enough for one adult rider only but perfectly adapted for the rough terrain on Adhomai."
	icon = 'icons/obj/cold_dawn_48.dmi'
	icon_state = "climber"
	icon_living = "climber"
	icon_dead = "climber_dead"
	turns_per_move = 3
	speak_emote = list("chuffs")
	emote_hear = list("growls")
	emote_see = list("shakes its head", "stamps a foot", "glares around")
	a_intent = I_HURT
	stop_automated_movement_when_pulled = 0
	mob_size = 12
	meat_type = /obj/item/reagent_containers/food/snacks/meat/adhomai
	organ_names = list("head", "chest", "right fore leg", "left fore leg", "right rear leg", "left rear leg")

	maxHealth = 100
	health = 100

	butchering_products = list(/obj/item/stack/material/animalhide = 5)
	meat_amount = 4
	faction = "Adhomai"
	pixel_x = -8

/mob/living/simple_animal/climber/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/saddle))
		to_chat(user, SPAN_NOTICE("You place \the [O] on \the [src]."))
		user.drop_from_inventory(O)
		O.forceMove(get_turf(src))
		qdel(O)
		new /obj/vehicle/bike/climber(get_turf(src))
		qdel(src)
	else
		..()

/obj/item/saddle
	name = "saddle"
	desc = "A structure used to ride animals."
	icon = 'icons/obj/cold_dawn.dmi'
	icon_state = "saddle"
	w_class = ITEMSIZE_NORMAL


/obj/vehicle/bike/climber
	name = "climber"
	desc = "A rideable beast of burden, large enough for one adult rider only but perfectly adapted for the rough terrain on Adhomai. This one has a saddle mounted on it."
	icon = 'icons/obj/cold_dawn_48.dmi'
	icon_state = "climber_s"
	bike_icon = "climber_s"
	pixel_x = -8
	mob_offset_y = 8
	kickstand = FALSE
	on = TRUE
	land_speed = 2
	space_speed = 0

	health = 100

	can_hover = FALSE
	organic = TRUE

/obj/vehicle/bike/climber/setup_vehicle()
	..()
	on = TRUE

/obj/vehicle/bike/climber/CtrlClick(var/mob/user)
	return

/obj/vehicle/bike/climber/toggle_engine(var/mob/user)
	return

/obj/vehicle/bike/climber/kickstand(var/mob/user)
	return

/obj/vehicle/bike/climber/explode()
	if(istype(load, /mob/living))
		var/mob/living/M = load
		M.apply_effects(5, 5)

	unload()
	var/mob/living/simple_animal/climber/M = new (get_turf(src))
	M.icon_state = "climber_s_on"
	M.icon_living = "climber_s_on"
	M.icon_dead = "climber_s_dead"
	M.death()
	qdel(src)

/obj/vehicle/bike/climber/check_destination(var/turf/destination)
	var/static/list/types = typecacheof(list(/turf/space))
	if(is_type_in_typecache(destination,types) || pulledby)
		return TRUE
	else
		return FALSE

/material/plasteel/meteoric
	name = MATERIAL_METEORIC
	icon_colour = "#817E79"

/obj/item/material/sword/amohdan_sword/legendary
	name = "meteoric iron amohdan sword"
	default_material = MATERIAL_METEORIC