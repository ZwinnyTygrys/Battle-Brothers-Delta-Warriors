this.deltarune_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.deltarune_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_127.png[/img] Another day and another world. During trip to theduring a trip to the castle ruins, you found yourself in another world again. However, unlike previous adventures, you did not find yourself in the Dark World. After getting to know the area for a while, you discovered that you could go home at any time. You decided to stay for a while until you get bored.",
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

