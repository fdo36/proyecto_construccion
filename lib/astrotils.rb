module Astrotils
	def self.get_models_name
		m_classes = ActiveRecord::Base.connection.tables.map { |model|
			model.capitalize.singularize.camelize
		}
		m_classes.delete("SchemaMigration")
		return m_classes
	end
end
