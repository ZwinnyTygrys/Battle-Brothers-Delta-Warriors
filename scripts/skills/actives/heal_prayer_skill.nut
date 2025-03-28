this.heal_prayer_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.heal_prayer";
		this.m.Name = "Heal Prayer";
		this.m.Description = "Heavenly light restores 25 HP.";
		this.m.Icon = "skills/prayer_heal.png";
		this.m.IconDisabled = "skills/prayer_heal_sw.png";
		this.m.Overlay = "prayer_heal";
		this.m.SoundOnUse = [
			"sounds/enemies/unhold_regenerate_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsUsingHitchance = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
		];
		return ret;
	}


	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}


		return true;
	}
	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();

		if (actor != null && !actor.isNull() && actor.isAlive())
		{
			actor.setHitpoints(actor.getHitpointsMax());
			actor.setDirty(true);
		}
	}

	function onUse( _user, _targetTile )
	{
		local t = _targetTile.getEntity();
		local healthMissing = t.getHitpointsMax() - t.getHitpoints();
		local healthAdded = this.Math.min(healthMissing, 25);

		if (healthAdded <= 0)
		{
			return;
		}

		t.setHitpoints(t.getHitpoints() + healthAdded);
		t.setDirty(true);

		if (!t.isHiddenToPlayer())
		{
			this.Tactical.spawnIconEffect("prayer_heal", t.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, t.getPos());
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(t) + " heals for " + healthAdded + " points");
		}
	}

});

