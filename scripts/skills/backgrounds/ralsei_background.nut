this.ralsei_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "ralsei_background";
		this.m.Name = "Ralsei";
		this.m.Icon = "ui/backgrounds/Ralsei_background.png";
		this.m.BackgroundDescription = "Ralsei, Prince from prophecy";
		this.m.GoodEnding = " %name% returned to his kingdom Thanks to the knowledge acquired during his travels, he expanded the dark world, making it even more beautiful and majestic";
		this.m.BadEnding = "%name% returned to his kingdom. Despite the company's disintegration, he did not lose heart. He decided to train recruits so that they would be ready for anything.";
		this.m.HiringCost = 5;
		this.m.DailyCost = 10;
		this.m.Excluded = [
			"trait.weasel",
			"trait.tough",
			"trait.tiny",
			"trait.teamplayer",
			"trait.swift",
			"trait.survivor",
			"trait.sure_footing",
			"trait.superstitious",
			"trait.strong",
			"trait.spartan",
			"trait.short_sighted",
			"trait.quick",
			"trait.pessimist",
			"trait.paranoid",
			"trait.night_owl",
			"trait.night_blind"
			"trait.lucky",
			"trait.loyal",
			"trait.irrational",
			"trait.iron_lungs",
			"trait.iron_jaw",
			"trait.insecure",
			"trait.impatient",
			"trait.huge",
			"trait.hesitant",
			"trait.hate_undead",
			"trait.hate_greenskins",
			"trait.hate_beasts",
			"trait.greedy",
			"trait.gluttonous"
			"trait.fragile",
			"trait.fearless",
			"trait.fear_undead",
			"trait.fear_greenskins",
			"trait.fear_beasts",
			"trait.fat",
			"trait.fainthearted",
			"trait.eagle_eyes",
			"trait.dumb",
			"trait.drunkard",
			"trait.disloyal",
			"trait.dexterous"
			"trait.determined",
			"trait.deathwish",
			"trait.dastard",
			"trait.craven",
			"trait.cocky",
			"trait.clumsy",
			"trait.clubfooted",
			"trait.brute",
			"trait.brave",
			"trait.bloodthirsty",
			"trait.bleeder",
			"trait.athletic",
			"trait.asthmatic",
			"trait.ailing"
		];
		
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.Bravery,
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense,
			this.Const.Attributes.Fatigue
		];

		this.m.Titles = [
			"Fluffy Prince",
			"Dark Prince",
			"Hug Prince",
			"Pose Prince"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onBuildDescription()
	{
		return "{Some men are born to be feared. Well over six feet tall, %name%\'s stature alone is a threatening one. | %name%\'s shadow casts over smaller men - and they seem to only further shrink when he walks by. | Standing amongst men like a bear in a suit of armor, %name% earns plenty of double-takes. | Years of brutal combat with his equally huge brothers left %name% a scarred and scary figure.} {The hedge knight has spent many seasons taking his prized horse to jousting tournaments. Unfortunately, a polearm crowned his mount, leaving him without a ride. | A mercenary in the company of himself, the hedge knight wandered for years, doing battle for those who offered the most crowns. | When he cleaved five men with one swing, three of which were on his side, the hedge knight was banned from service in every army in the land. | Ordered to kill a lord\'s enemies, the hedge knight kicked in the door of a family and slaughtered them all with his bare hands. When the lord refused to pay, %name% killed him, too. | The hedge knight has spent many nights sleeping peacefully beneath a pale moon - and just as many days killing ruthlessly beneath a shining sun.} {Always on the hunt for more crowns, the company of sellswords seemed like a good fit. | Too terrifying to be employed for long, %name% seeks the company of men who will not piss themselves when he grabs a weapon. | Tired of killing jousters and lords, as well as women and children, %name% sees mercenary work as something of a vacation. | War has apparently gotten in the way of %name%\'s jousting career. He seeks to amend that problem.}";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				12,
				13
			],
			Bravery = [
				14,
				6
			],
			Stamina = [
				10,
				10
			],
			MeleeSkill = [
				11,
				10
			],
			RangedSkill = [
				4,
				4
			],
			MeleeDefense = [
				6,
				5
			],
			RangedDefense = [
				5,
				3
			],
			Initiative = [
				0,
				10
			]
		};
		return c;
	}
});