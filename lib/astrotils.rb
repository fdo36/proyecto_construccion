module Astrotils
	def self.get_models_name
		m_classes = ActiveRecord::Base.connection.tables.map { |model|
			model.capitalize.singularize.camelize
		}
		m_classes.delete("SchemaMigration")
		return m_classes
	end

	def self.get_models
		models_name = get_models_name
                models = models_name.map { |model_name|
                        begin
                                Object.const_get(model_name)
                        rescue
                                nil
                        end
                }
                models.reject! { |model_class|
                        model_class.nil? or !model_class.respond_to?(:get_component_info)
                }
	end
end
