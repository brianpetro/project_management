class ProjectPdf < Prawn::Document
  def initialize(project)
  	super()
  	@project = project
  	title
  	table_of_contents
  end
  def title
  	text "Project #{@project.name}", size: 30, style: :bold
  end
  def table_of_contents
			@project.blueprints.each do |item|
			  text "Blueprint #{item.title}"
			  text "Author #{item.author}"
			  text "ID: #{item.id}"
			  text " "
			end
  end
end
