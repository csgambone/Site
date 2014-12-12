class CatchRate < ActiveRecord::Base
	def Calculate
		result = catchrate + currenthp + maxhp + status + ball + opower + caught
		
		return result
	end
end
