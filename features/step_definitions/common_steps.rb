Before do
  $queries_executed = []
  
  @model      = nil
  @method     = :search
  @query      = ""
  @conditions = {}
  @with       = {}
  @without    = {}
  @with_all   = {}
  @options    = {}
  @results    = nil
end

Given "Sphinx is running" do
  ThinkingSphinx::Configuration.instance.controller.should be_running
end

Given /^I am searching on (.+)$/ do |model|
  Dir["#{Dir.pwd}/features/thinking_sphinx/db/fixtures/*.rb"].sort!.each do |file|
    load file
  end
  ThinkingSphinx::Configuration.instance.controller.index
  sleep(0.25)
  @model = model.gsub(/\s/, '_').singularize.camelize.constantize
end

When "I wait for Sphinx to catch up" do
  sleep(0.25)
end

When /^I search for "([^"]*)"$/ do |query|
  @results = nil
  @query = query
end

When /^I filter by (\w+) on (\w+)$/ do |filter, attribute|
  @results = nil
  @with[attribute.to_sym] = filter.to_crc32
end

Then /^I should get (\d+) results?$/ do |count|
  results.length.should == count.to_i
end

def results
  @results ||= (@model || ThinkingSphinx).send(
    @method,
    @query,
    @options.merge(
      :conditions => @conditions,
      :with       => @with,
      :without    => @without,
      :with_all   => @with_all
    )
  )
end
