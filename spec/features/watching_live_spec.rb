require 'spec_helper'

feature 'Watching live', js: true do
  scenario do
    visit '/live'
    expect(page.find("iframe")[:src]).to include("rockwoodprovideo")
  end
end
