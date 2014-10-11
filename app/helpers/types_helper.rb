module TypesHelper
	def types_for_select
		Type.all.collect {|t| [ t.name, t.id ] }
	end
end
