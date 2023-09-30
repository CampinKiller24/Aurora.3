//##############################################
//################### NEWSCASTERS BE HERE! ####
//###-Agouri###################################

#define PRESET_NORTH \
dir = NORTH; \
pixel_y = 30;

#define PRESET_SOUTH \
dir = SOUTH; \
pixel_y = -26;

#define PRESET_WEST \
dir = WEST; \
pixel_x = -8;

#define PRESET_EAST \
dir = EAST; \
pixel_x = 8;

///Global list that contains reference to all newscasters in existence.
var/list/obj/machinery/newscaster/allCasters = list()

/obj/machinery/newscaster
	name = "newscaster"
	desc = "A standard newsfeed handler for use on commercial space stations. All the news you absolutely have no use for, in one place!"
	icon = 'icons/obj/machinery/wall/terminals.dmi'
	icon_state = "newscaster"
	anchored = TRUE
	appearance_flags = TILE_BOUND // prevents people from viewing the overlay through a wall
	obj_flags = OBJ_FLAG_MOVES_UNSUPPORTED

	///If the newscaster is broken, boolean
	var/isbroken = FALSE

	///If it starts powered on, boolean
	var/ispowered = TRUE //starts powered, changes with power_change()

	/**
	 * What the screen is displaying
	 *
	 * main = main menu
	 * viewchannels = view feed channels
	 * createchannel = create feed channel
	 * submitstory = create feed story
	 * viewstories = viewing channel feeds
	 * censor = censor feed story
	 * dnotice = censor feed channel
	 * viewwantedissue = view wanted issue
	 * createwantedissue = create wanted issue
	 */
	var/screen = main

	var/paper_remaining = 0

	///If the caster can be used to issue wanted posters, boolean
	var/securityCaster = FALSE

	///Unique newscaster unit number
	var/unit_no = 0 //Each newscaster has a unit number

	var/alert_delay = 500

	///If there hasn't been a news/wanted update in the last alert_delay, boolean
	var/alert = FALSE

	///Contains the name of the person who currently uses the newscaster
	var/scanned_user = "Unknown"

	///Feed message
	var/msg = "";

	var/datum/news_photo/photo_data = null
	var/paper_data = ""
	var/paper_name = ""

	///The feed channel which will be receiving the feed, or being created
	var/channel_name = "";

	///If our new channel will be locked to public submissions, boolean
	var/c_locked=FALSE

	///How many hits the newscaster has taken
	var/hitstaken = 0

	var/datum/feed_channel/viewing_channel = null
	var/datum/feed_message/viewing_message = null
	var/global/list/screen_overlays

/obj/machinery/newscaster/north
	PRESET_NORTH

/obj/machinery/newscaster/south
	PRESET_SOUTH

/obj/machinery/newscaster/west
	PRESET_WEST

/obj/machinery/newscaster/east
	PRESET_EAST

/obj/machinery/newscaster/proc/generate_overlays(var/force = 0)
	if(LAZYLEN(screen_overlays) && !force)
		return
	LAZYINITLIST(screen_overlays)
	screen_overlays["newscaster-screen"] = make_screen_overlay(icon, "newscaster-screen")
	screen_overlays["newscaster-title"] = make_screen_overlay(icon, "newscaster-title")
	screen_overlays["newscaster-wanted"] = make_screen_overlay(icon, "newscaster-wanted")
	screen_overlays["newscaster-scanline"] = make_screen_overlay(icon, "newscaster-scanline")
	for(var/i in 1 to 3)
		screen_overlays["crack[i]"] = make_screen_overlay(icon, "crack[i]")

/obj/machinery/newscaster/security_unit
	name = "Security Newscaster"
	securityCaster = 1

/obj/machinery/newscaster/security_unit/north
	PRESET_NORTH

/obj/machinery/newscaster/security_unit/south
	PRESET_SOUTH

/obj/machinery/newscaster/security_unit/west
	PRESET_WEST

/obj/machinery/newscaster/security_unit/east
	PRESET_EAST

/obj/machinery/newscaster/Initialize(mapload)
	. = ..()                                //I just realised the newscasters weren't in the global machines list. The superconstructor call will tend to that
	allCasters += src
	paper_remaining = 15            // Will probably change this to something better
	unit_no = allCasters.len + 1
	if(dir & NORTH)
		alpha = 127
	generate_overlays()
	update_icon() //for any custom ones on the map...

	if(!mapload)
		set_pixel_offsets()

/obj/machinery/newscaster/Destroy()
	allCasters -= src
	return ..()

/obj/machinery/newscaster/set_pixel_offsets()
	pixel_x = DIR2PIXEL_X(dir)
	pixel_y = DIR2PIXEL_Y(dir)

/obj/machinery/newscaster/update_icon()
	if(!ispowered || isbroken)
		icon_state = initial(icon_state)
		set_light(FALSE)
		if(isbroken) //If the thing is smashed, add crack overlay on top of the unpowered sprite.
			cut_overlays()
			add_overlay(screen_overlays["crack3"])
		return

	cut_overlays() //reset overlays

	add_overlay(screen_overlays["newscaster-screen"])
	set_light(1.4, 1.3, COLOR_CYAN)

	if(!alert || !SSnews.wanted_issue) // since we're transparent I don't want overlay nonsense
		add_overlay(screen_overlays["newscaster-title"])

	if(SSnews.wanted_issue) //wanted icon state, there can be no overlays on it as it's a priority message
		add_overlay(screen_overlays["newscaster-wanted"])
		return

	if(alert) //new message alert overlay
		add_overlay(screen_overlays["newscaster-alert"])

	if(hitstaken == 0)
		add_overlay(screen_overlays["newscaster-scanline"])

	if(hitstaken > 0) //Cosmetic damage overlay
		add_overlay(screen_overlays["crack[hitstaken]"])

	icon_state = initial(icon_state)
	return

/obj/machinery/newscaster/power_change()
	if(isbroken) //Broken shit can't be powered.
		return
	..()
	if( !(stat & NOPOWER) )
		src.ispowered = 1
		src.update_icon()
	else
		addtimer(CALLBACK(src, PROC_REF(post_power_loss)), rand(1, 15))

/obj/machinery/newscaster/proc/post_power_loss()
	ispowered = 0
	update_icon()

/obj/machinery/newscaster/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			src.isbroken=1
			if(prob(50))
				qdel(src)
			else
				src.update_icon() //can't place it above the return and outside the if-else. or we might get runtimes of null.update_icon() if(prob(50)) goes in.
			return
		else
			if(prob(50))
				src.isbroken=1
			src.update_icon()
			return

/obj/machinery/newscaster/attack_ai(mob/user as mob)
	if(!ai_can_interact(user))
		return
	ui_interact(user)

/obj/machinery/newscaster/attack_hand(mob/user as mob)
	ui_interact(user)
	return

/obj/machinery/newscaster/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Newscaster")
		ui.open()

/obj/machinery/newscaster/ui_data(mob/user)
	var/list/data = list()
	var/list/channels = list()

	//currently ID'd as ???

	if(screen == "main")
		if(SSnews.wanted_issue)
			data["active_issue"] = list(
				"name" = SSnews.wanted_issue.author,
				"description" = SSnews.wanted_issue.body,
				"photo" = SSnews.wanted_issue.img
		)

	else if(screen == "viewchannels")
		for(var/channel in SSnews.network_channels)
			var/datum/fc = SSnews.GetFeedChannel(channel)
			for(var/datum/feed_message/message in fc.messages)
				channels += list(list(
					"name" = fc.channel_name,
					"owner" = fc.author,
					"censored" = fc.censored,
					"public" = fc.c_locked,
					"messages" += message
				))

		data["feed_channels"] = channels
	
	else if(screen == "createchannel")
		data["current_channel"] = list(
			"name" = channel_name,
			"owner" = user,
			"censored" = FALSE,
			"public" = c_locked,
			"messages" = null
		)
	else if(screen == "submitstory")

	else if(screen == "viewstories")
		var/channel = viewing_channel //idk if this'll work

	else if(screen == "censor")

	else if(screen == "dnotice")
		for(var/channel in SSnews.network_channels)
			var/datum/fc = SSnews.GetFeedChannel(channel)
			for(var/datum/feed_message/message in fc.messages)
				channels += list(list(
					"name" = fc.channel_name,
					"owner" = fc.author,
					"censored" = fc.censored,
					"public" = fc.c_locked,
					"messages" += message
				))

		data["feed_channels"] = channels
	
	else if(screen == "viewwantedissue")
		data["active_issue"] = list(
				"name" = SSnews.wanted_issue.author,
				"description" = SSnews.wanted_issue.body,
				"photo" = SSnews.wanted_issue.img
		)
	else if(screen == "createwantedissue")
		data["active_issue"] = list(
				"name" = SSnews.wanted_issue.author,
				"description" = SSnews.wanted_issue.body,
				"photo" = SSnews.wanted_issue.img
		)

	return data

/obj/machinery/newscaster/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	
	switch(action)
		if("createchannel")

		if("viewchannels")

		if("submitstory")

		if("printpaper")

		if("exit")

		if("rescanuser")

	//different switch for the sec options

/obj/machinery/newscaster/attackby(obj/item/I as obj, mob/user as mob)
	if (src.isbroken)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 100, 1)
		for (var/mob/O in hearers(5, src.loc))
			O.show_message("<EM>[user.name]</EM> further abuses the shattered [src.name].")
	else
		if(istype(I, /obj/item) )
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			var/obj/item/W = I
			if(W.force <15)
				for (var/mob/O in hearers(5, src.loc))
					O.show_message("[user.name] hits the [src.name] with the [W.name] with no visible effect." )
					playsound(src.loc, 'sound/effects/glass_hit.ogg', 100, 1)
			else
				src.hitstaken++
				if(src.hitstaken==3)
					for (var/mob/O in hearers(5, src.loc))
						O.show_message("[user.name] smashes the [src.name]!" )
					src.isbroken=1
					playsound(src.loc, /singleton/sound_category/glass_break_sound, 100, 1)
				else
					for (var/mob/O in hearers(5, src.loc))
						O.show_message("[user.name] forcefully slams the [src.name] with the [I.name]!" )
					playsound(src.loc, 'sound/effects/glass_hit.ogg', 100, 1)
		else
			to_chat(user, "<span class='notice'>This does nothing.</span>")
	src.update_icon()

/datum/news_photo
	var/is_synth = 0
	var/obj/item/photo/photo = null

/datum/news_photo/New(var/obj/item/photo/p, var/synth)
	is_synth = synth
	photo = p

/obj/machinery/newscaster/proc/AttachPhoto(mob/user as mob)
	if(photo_data)
		if(!photo_data.is_synth)
			photo_data.photo.forceMove(src.loc)
			if(!issilicon(user))
				user.put_in_inactive_hand(photo_data.photo)
		QDEL_NULL(photo_data)

	if(istype(user.get_active_hand(), /obj/item/photo))
		var/obj/item/photo = user.get_active_hand()
		user.drop_from_inventory(photo,src)
		photo_data = new(photo, 0)
	else if(istype(user,/mob/living/silicon))
		var/mob/living/silicon/tempAI = user
		var/obj/item/photo/selection = tempAI.GetPicture()
		if (!selection)
			return

		photo_data = new(selection, 1)

/obj/machinery/newscaster/proc/AttachPaper(mob/user)
	if(paper_data || paper_name)
		paper_name = ""
		paper_data = ""

	if(istype(user.get_active_hand(), /obj/item/paper))
		var/obj/item/paper/attached = user.get_active_hand()
		paper_name = attached.name
		paper_data = attached.info
		to_chat(user, "You scan \the [attached] and add it to the news story.")
	else
		to_chat(user, "The newscaster refuses to scan [user.get_active_hand()].")

//########################################################################################################################
//###################################### NEWSPAPER! ######################################################################
//########################################################################################################################

/obj/item/newspaper
	name = "newspaper"
	desc = "An issue of The Griffon, the newspaper circulating aboard most stations."
	desc_info = "You can alt-click this to roll it up."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "newspaper"
	item_state = "newspaper"
	w_class = ITEMSIZE_SMALL	//Let's make it fit in trashbags!
	attack_verb = list("bapped", "thwacked", "educated")
	drop_sound = 'sound/items/drop/wrapper.ogg'
	pickup_sound = 'sound/items/pickup/wrapper.ogg'
	var/screen = 0
	var/pages = 0
	var/curr_page = 0
	var/list/datum/feed_channel/news_content = list()
	var/datum/feed_message/important_message = null
	var/scribble=""
	var/scribble_page = null
	var/rolled = FALSE // Whether the newspaper is rolled or not, making it a deadly weapon.

/obj/item/newspaper/attack_self(mob/user as mob)
	if(user.a_intent == I_GRAB)
		if(!rolled)
			user.visible_message(SPAN_NOTICE("\The [user] rolls up \the [src]."),\
								 SPAN_NOTICE("You roll up \the [src]."))
			rolled(user)
		return
	if(rolled)
		user.visible_message(SPAN_NOTICE("\The [user] unrolls \the [src] to read it."),\
						     SPAN_NOTICE("You unroll \the [src] to read it."))
		rolled(user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		var/dat
		src.pages = 0
		switch(screen)
			if(0) //Cover
				dat+="<DIV ALIGN='center'><B><FONT SIZE=6>The Griffon</font></B></div>"
				dat+="<DIV ALIGN='center'><FONT SIZE=2>[current_map.company_name]-standard newspaper, for use on [current_map.company_name] Vessels.</font></div><HR>"
				if(isemptylist(src.news_content))
					if(src.important_message)
						dat+="Contents:<BR><ul><B><span class='warning'>**</span>Important Security Announcement<span class='warning'>**</span></B> <FONT SIZE=2>\[page [src.pages+2]\]</font><BR></ul>"
					else
						dat+="<I>Other than the title, the rest of the newspaper is unprinted...</I>"
				else
					dat+="Contents:<BR><ul>"
					for(var/datum/feed_channel/NP in src.news_content)
						src.pages++
					if(src.important_message)
						dat+="<B><span class='warning'>**</span>Important Security Announcement<span class='warning'>**</span></B> <FONT SIZE=2>\[page [src.pages+2]\]</font><BR>"
					var/temp_page=0
					for(var/datum/feed_channel/NP in src.news_content)
						temp_page++
						dat+="<B>[NP.channel_name]</B> <FONT SIZE=2>\[page [temp_page+1]\]</font><BR>"
					dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:right;'><A href='?src=\ref[src];next_page=1'>Next Page</A></DIV> <div style='float:left;'><A href='?src=\ref[human_user];mach_close=newspaper_main'>Done reading</A></DIV>"
			if(1) // X channel pages inbetween.
				for(var/datum/feed_channel/NP in src.news_content)
					src.pages++ //Let's get it right again.
				var/datum/feed_channel/C = src.news_content[src.curr_page]
				dat+="<FONT SIZE=4><B>[C.channel_name]</B></font><FONT SIZE=1> \[created by: <span class='boldannounce'>[C.author]</span>\]</font><BR><BR>"
				if(C.censored)
					dat+="This channel was deemed dangerous to the general welfare of the station and therefore marked with a <B><span class='warning'>D-Notice</B></span>. Its contents were not transferred to the newspaper at the time of printing."
				else
					if(isemptylist(C.messages))
						dat+="No Feed stories stem from this channel..."
					else
						dat+="<ul>"
						var/i = 0
						for(var/datum/feed_message/MESSAGE in C.messages)
							i++
							dat+="-[MESSAGE.body] <BR>"
							if(MESSAGE.img)
								send_rsc(usr, MESSAGE.img, "tmp_photo[i].png")
								dat+="<img src='tmp_photo[i].png' width = '180'><BR>"
							dat+="<FONT SIZE=1>\[[MESSAGE.message_type] by <span class='boldannounce'>[MESSAGE.author]</span>\]</font><BR><BR>"
						dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<BR><HR><DIV STYLE='float:left;'><A href='?src=\ref[src];prev_page=1'>Previous Page</A></DIV> <DIV STYLE='float:right;'><A href='?src=\ref[src];next_page=1'>Next Page</A></DIV>"
			if(2) //Last page
				for(var/datum/feed_channel/NP in src.news_content)
					src.pages++
				if(src.important_message!=null)
					dat+="<DIV STYLE='float:center;'><FONT SIZE=4><B>Wanted Issue:</B></FONT></DIV><BR><BR>"
					dat+="<B>Criminal name</B>: <span class='boldannounce'>[important_message.author]</span><BR>"
					dat+="<B>Description</B>: [important_message.body]<BR>"
					dat+="<B>Photo:</B>: "
					if(important_message.img)
						send_rsc(user, important_message.img, "tmp_photow.png")
						dat+="<BR><img src='tmp_photow.png' width = '180'>"
					else
						dat+="None"
				else
					dat+="<I>Apart from some uninteresting Classified ads, there's nothing on this page...</I>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:left;'><A href='?src=\ref[src];prev_page=1'>Previous Page</A></DIV>"
			else
				dat+="I'm sorry to break your immersion. This shit's bugged. Report this bug to Agouri, polyxenitopalidou@gmail.com"

		dat+="<BR><HR><div align='center'>[src.curr_page+1]</div>"

		human_user << browse(dat, "window=newspaper_main;size=300x400")
		onclose(human_user, "newspaper_main")
	else
		to_chat(user, "The paper is full of intelligible symbols!")


/obj/item/newspaper/Topic(href, href_list)
	var/mob/living/U = usr
	..()
	if ((src in U.contents) || ( istype(loc, /turf) && in_range(src, U) ))
		U.set_machine(src)
		if(href_list["next_page"])
			if(curr_page==src.pages+1)
				return //Don't need that at all, but anyway.
			if(src.curr_page == src.pages) //We're at the middle, get to the end
				src.screen = 2
			else
				if(curr_page == 0) //We're at the start, get to the middle
					src.screen=1
			src.curr_page++
			playsound(src.loc, /singleton/sound_category/page_sound, 50, 1)

		else if(href_list["prev_page"])
			if(curr_page == 0)
				return
			if(curr_page == 1)
				src.screen = 0

			else
				if(curr_page == src.pages+1) //we're at the end, let's go back to the middle.
					src.screen = 1
			src.curr_page--
			playsound(src.loc, /singleton/sound_category/page_sound, 50, 1)

		if (istype(src.loc, /mob))
			src.attack_self(src.loc)


/obj/item/newspaper/attackby(obj/item/W as obj, mob/user as mob)
	if(W.ispen())
		if(rolled)
			user.visible_message(SPAN_NOTICE("\The [user] unrolls \the [src] to write on it."),\
						     	 SPAN_NOTICE("You unroll \the [src] to write on it."))
			rolled()
		if(src.scribble_page == src.curr_page)
			to_chat(user, "<span class='notice'>There's already a scribble in this page... You wouldn't want to make things too cluttered, would you?</span>")
		else
			var/s = sanitize(input(user, "Write something", "Newspaper", ""))
			s = sanitize(s)
			if (!s)
				return
			if (!in_range(src, usr) && src.loc != usr)
				return
			src.scribble_page = src.curr_page
			src.scribble = s
			src.attack_self(user)
		return TRUE

/obj/item/newspaper/proc/rolled(mob/user)
	if(ishuman(user) && Adjacent(user) && !user.incapacitated())
		if(rolled)
			playsound(src, pickup_sound, PICKUP_SOUND_VOLUME)
		else
			playsound(src, drop_sound, DROP_SOUND_VOLUME)
		rolled = !rolled
		icon_state = "newspaper[rolled ? "_rolled" : ""]"
		item_state = icon_state
		update_icon()

////////////////////////////////////helper procs

// Newscaster scans you
// autorecognition, woo!
/obj/machinery/newscaster/proc/scan_user(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/card/id/ID = H.GetIdCard()
		if(ID)
			scanned_user = GetNameAndAssignmentFromId(ID)
		else
			scanned_user = "Unknown"
	else
		var/mob/living/silicon/ai_user = user
		scanned_user = "[ai_user.name] ([ai_user.job])"


/obj/machinery/newscaster/proc/print_paper()
	feedback_inc("newscaster_newspapers_printed",1)
	var/obj/item/newspaper/NEWSPAPER = new /obj/item/newspaper
	for(var/channel in SSnews.network_channels)
		var/datum/feed_channel/FC = SSnews.GetFeedChannel(channel)
		NEWSPAPER.news_content += FC
	if(SSnews.wanted_issue)
		NEWSPAPER.important_message = SSnews.wanted_issue
	playsound(src.loc, 'sound/bureaucracy/print.ogg', 75, 1)
	usr.put_in_hands(NEWSPAPER)
	src.paper_remaining--
	return

/obj/machinery/newscaster/proc/newsAlert(var/news_call)
	if (isNotStationLevel(z))
		clearAlert()
		return
	var/turf/T = get_turf(src)
	if(news_call)
		for(var/mob/O in hearers(world.view-1, T))
			O.show_message("<span class='newscaster'><EM>[src.name]</EM> beeps, \"[news_call]\"</span>",2)

		if (!alert)
			alert = 1
			update_icon()
			addtimer(CALLBACK(src, PROC_REF(clearAlert)), 300, TIMER_UNIQUE)

		playsound(src.loc, 'sound/machines/twobeep.ogg', 75, 1)
	else
		for(var/mob/O in hearers(world.view-1, T))
			O.show_message("<span class='newscaster'><EM>[src.name]</EM> beeps, \"Attention! Wanted issue distributed!\"</span>",2)
		playsound(loc, 'sound/machines/warning-buzzer.ogg', 75, 1)
	return

/obj/machinery/newscaster/proc/clearAlert()
	alert = 0
	update_icon()

#undef PRESET_NORTH
#undef PRESET_SOUTH
#undef PRESET_WEST
#undef PRESET_EAST
