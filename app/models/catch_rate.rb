class CatchRate < ActiveRecord::Base
	def GetRates
		for ball_index in 1..14
			#get crit rate, crit catch rate, regular catch rate
		end
		#return array or something of values for all 14 balls
	end

	def GetBallValue(index, repeat, turn_count, enemy_level, bug_water_type, dive_surf_fish, cave_night)
		# 1:pokeball
		# 2:great ball
		# 3:ultra ball
		# 4:master ball
		# 5:premier ball
		# 6:repeat ball
		# 7:timer ball
		# 8:nest ball
		# 9:net ball
		# 10:dive ball
		# 11:luxury ball
		# 12:heal ball
		# 13:quick ball
		# 14:dusk ball
		timer_catchrate = (1.0 + (turn_count * (1229.0 / 4096.0)))
		nest_catchrate = ((41.0 - enemy_level) / 10.0)

		case index
			when 2
				return 1.5
			when 3
				return 2.0
			when 4
				return 255.0
			when 6
				if (repeat)
					return 3.0
				else
					return 1.0
				end
			when 7
				if (timer_catchrate < 4.0)
					return timer_catchrate
				else
					return 4.0
				end
			when 8
				if (nest_catchrate > 1.0)
					return nest_catchrate
				else
					return 1.0
				end
			when 9
				if (bug_water_type)
					return 3.0
				else
					return 1.0
				end
			when 10
				if (dive_surf_fish)
					return 3.5
				else
					return 1.0
				end
			when 13
				if (turn_count == 1.0)
					return 5.0
				else
					return 1.0
				end
			when 14
				if (cave_night)
					return 3.5
				else
					return 1.0
				end
			#1, 5, 11, 12
			else
				return 1.0
		end
	end

	def GetModifiedCatchRate
		#catchrate + currenthp + maxhp + status + ball + opower + caught
		modified_catch_rate = ((3.0 * maxhp) - (2.0 * currenthp))
		#nearest
		#times catchrate times ball value
		#nearest
		#divided by 3*maxhp
		#down
		#times status
		#nearest
		#times opower
		#down
		return modified_catch_rate
	end

	def GetShakeProbability(modified_catch_rate)
		shake_probability = 255 / modified_catch_rate
		#nearest
		#sqrt
		#nearest
		#sqrt
		#nearest
		#65536 / shake_probability
		#nearest
		#floor
		return shake_probability
	end

	def GetCritRate(modified_catch_rate)
		#case statement for crit_table_value based on caught
		crit_rate = (modified_catch_rate * crit_table_value) / 6
		#nearest
		#floor
		#crit_rate = crit_rate / 256
		return crit_rate
	end

	def Calculate(shake_count)
		#modified_catch_rate = GetModifiedCatchRate
		#shake_probability = GetShakeProbability(modified_catch_rate)
		#catch_chance = shake_probability * shake_count
		return catch_chance
	end

	def GetCatchChance
		shake_count = 4
		catch_chance = Calculate(shake_count)
		return catch_chance
	end

	def GetCritCatchChance
		crit_shake_count = 1
		crit_catch_chance = Calculate(crit_shake_count)
		return crit_catch_chance
	end
end
