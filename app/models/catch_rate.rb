class CatchRate < ActiveRecord::Base
	def GetRates
		for ball_index in 1..14
			#get crit rate, crit catch rate, regular catch rate
		end
		#return array or something of values for all 14 balls
	end

	#round input to nearest 1/4096
	def Nearest(input)
		output = (((input*4096.0) + 0.5).to_i)/4096.0
		return output
	end

	#round input DOWN to nearest 1/4096
	def Down(input)
		output = ((input*4096.0).to_i)/4096.0
		return output
	end

	def GetBallName(index)
		case index
			when 1
				return "Pokeball"
			when 2
				return "Great Ball"
			when 3
				return "Ultra Ball"
			when 4
				return "Master Ball"
			when 5
				return "Premier Ball"
			when 6
				return "Repeat Ball"
			when 7
				return "Timer Ball"
			when 8
				return "Nest Ball"
			when 9
				return "Net Ball"
			when 10
				return "Dive Ball"
			when 11
				return "Luxury Ball"
			when 12
				return "Heal Ball"
			when 13
				return "Quick Ball"
			when 14
				return "Dusk Ball"
			else
				return "Unknown Ball"
		end
	end

	def GetStatusName(index)
		case index
			when 2.5
				return "Sleep/Freeze"
			when 1.5
				return "Paralyze/Poison/Burn"
			when 1
				return "None"
			else
				return "Unknown Status"
		end
	end

	def GetOPowerName(index)
		case index
			when 1.3
				return "Level 3"
			when 1.2
				return "Level 2"
			when 1.1
				return "Level 1"
			when 1.0
				return "None"
			else
				return "Unknown Level"
		end
	end

	#crit modifier based on number of pokemon caught in pokedex
	def CritTableLookup
		if (caught > 600)
			crit_table_value = 2.5
		elsif (caught > 450)
			crit_table_value = 2.0
		elsif (caught > 300)
			crit_table_value = 1.5
		elsif (caught > 150)
			crit_table_value = 1
		elsif (caught > 30)
			crit_table_value = 0.5
		else
			crit_table_value = 0.0
		end

		return crit_table_value
	end

	def GetBallValue(index)
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
		timer_catchrate = (1.0 + (turn_number * (1229.0 / 4096.0)))
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
				if (turn_number == 1.0)
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
		modified_catch_rate = Nearest(modified_catch_rate)
		#times catchrate times ball value
		ball_value = GetBallValue(ball)
		modified_catch_rate = modified_catch_rate * catchrate * ball_value
		#nearest
		modified_catch_rate = Nearest(modified_catch_rate)
		#divided by 3*maxhp
		modified_catch_rate = modified_catch_rate / (3.0 * maxhp)
		#down
		modified_catch_rate = Down(modified_catch_rate)
		#times status
		modified_catch_rate = modified_catch_rate * status
		#nearest
		modified_catch_rate = Nearest(modified_catch_rate)
		#times opower
		modified_catch_rate = modified_catch_rate * opower
		#down
		modified_catch_rate = Down(modified_catch_rate)

		return modified_catch_rate
	end

	def GetShakeProbability(modified_catch_rate)
		shake_probability = 255.0 / modified_catch_rate
		#nearest
		shake_probability = Nearest(shake_probability)
		#sqrt
		shake_probability = Math.sqrt(shake_probability)
		#nearest
		shake_probability = Nearest(shake_probability)
		#sqrt
		shake_probability = Math.sqrt(shake_probability)
		#nearest
		shake_probability = Nearest(shake_probability)
		#65536 / shake_probability
		shake_probability = 65536.0 / shake_probability
		#nearest
		shake_probability = Nearest(shake_probability)
		#floor
		shake_probability = shake_probability.floor
		#success rate
		shake_probability = shake_probability / 65536.0

		return shake_probability
	end

	def GetCritRate(modified_catch_rate)
		#
		crit_rate = (modified_catch_rate * CritTableLookup()) / 6.0
		#nearest
		crit_rate = Nearest(crit_rate)
		#floor
		crit_rate = crit_rate.floor
		#crit_rate = crit_rate / 256 (it is compared to a randomly generated 0-255), multiplied by 100 for %
		crit_rate = (crit_rate / 256.0) * 100.0
		return crit_rate
	end

	def Calculate(shake_count)
		modified_catch_rate = GetModifiedCatchRate()
		shake_probability = GetShakeProbability(modified_catch_rate)
		catch_chance = (shake_probability ** shake_count) * 100.0
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

	def GetOverallCatchChance(modified_catch_rate)
		crit_chance = GetCritRate(modified_catch_rate) / 100.0
		crit_catch_chance = GetCritCatchChance() / 100.0
		catch_chance = GetCatchChance() / 100.0

		overall_catch_chance = (crit_chance * crit_catch_chance) + ((1 - crit_chance) * catch_chance)
		overall_catch_chance = overall_catch_chance * 100

		return overall_catch_chance
	end
end
