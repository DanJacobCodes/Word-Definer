require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new word', {:type => :feature}) do
  it('allows a user to add a word to the list') do
    visit('/word')
    fill_in('word', :with =>'')
    click_button('Add')
    expect(page).to have_content('')
  end
end
