# Author: Felipe A.
# 2013

# Categoria del componente y orden (en que orden aparece)
def announce_component(membership, category_name, order)
	@@membership = membership
	@@category = category_name
	@@order = order
	define_singleton_method :get_component_info do
		[@@membership, @@category, @@order]
	end
end
