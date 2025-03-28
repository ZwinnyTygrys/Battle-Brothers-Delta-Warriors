this.moss_finding_event <- this.inherit("scripts/events/event", {
	m = {
		Kris = null,
		OtherGuy = null
	},
	function create()
	{
		this.m.ID = "moss.finding_food";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 5.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_10.png[/img]While traveling in the forest, you saw Kris collecting moss and eating it.%otherguy% also sees it but ignores the whole process of ingestion. Kris then carries the bag with the rest of the moss for the rest to consume.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I hope they won't get poisoned.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Kris.getImagePath());
				local food = this.new("scripts/items/supplies/moss_item");
				this.World.Assets.getStash().add(food);
				this.List = [
					{
						id = 10,
						icon = "ui/items/" + food.getIcon(),
						text = "You gain Moss"
					}
				];
				_event.m.Kris.improveMood(0.5, "Found moss");

				if (_event.m.Kris.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Kris.getMoodState()],
						text = _event.m.Kris.getName() + this.Const.MoodStateEvent[_event.m.Kris.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (currentTile.Type != this.Const.World.TerrainType.Forest && currentTile.Type != this.Const.World.TerrainType.LeaveForest && currentTile.Type != this.Const.World.TerrainType.AutumnForest)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "kris_background" )
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Kris = candidates[this.Math.rand(0, candidates.len() - 1)];

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Kris.getID())
			{
				this.m.OtherGuy = bro;
				this.m.Score = candidates.len() * 20;
				break;
			}
		}
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"kris",
			this.m.Kris.getName()
		]);
		_vars.push([
			"otherguy",
			this.m.OtherGuy.getName()
		]);
	}

	function onClear()
	{
		this.m.Kris = null;
		this.m.OtherGuy = null;
	}

});

