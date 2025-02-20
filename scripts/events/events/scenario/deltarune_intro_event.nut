this.deltarune_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.deltarune_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_127.png[/img] Another day and another world. During the trip to the castle ruins, you found yourself once again in another world. However, unlike previous adventures, you did not find yourself in the Dark World. After scouting the area, you decided to go on an adventure. The portal by which you arrived still works and you can return at any time. You decided to stay for a while until you get bored.",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let's Go!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "A New Adventure";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

