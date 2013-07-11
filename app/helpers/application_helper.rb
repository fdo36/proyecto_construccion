# Author: Felipe A.
# 2013

require 'astrotils'

module ApplicationHelper
	def get_categories()
		categories = {}
		models_name = Astrotils::get_models_name
		models = models_name.map { |model_name|
			begin
				Object.const_get(model_name)
			rescue
				nil
			end
		}
		
		models.reject! { |model_class|
			model_class.nil? or !can? :read, model_class
		}
		if !current_user.company.nil?
			system_type = current_user.company.system_type
			models.reject! { |model_class|
				begin
					membership = model_class.get_component_info()[0]
					(membership == :acopio and system_type == false) or (membership == :packing and system_type == true)
				rescue
					true
				end
			}
		end
		models.each { |model_class|
			info = model_class.get_component_info
			categories[info[1]] ||= []
			categories[info[1]].push(model_class)
		}
		categories.each { |category_name, components|
			components.sort! { |x,y| x.get_component_info[2] <=> y.get_component_info[2] }
		}
	end

	def link_for_component(component)
		url_for :controller => component.table_name.downcase, :action => "index"
	end
end
