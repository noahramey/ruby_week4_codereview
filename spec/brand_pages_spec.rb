require('spec_helper')

describe('the brand path', { type: :feature }) do
  it('should show all of the available brands') do
    test_brand = Brand.create({name: "Nike"})
    visit('/brands')
    expect(page).to have_content('Nike')
  end

  it('should create a brand') do
    visit('/brands/new')
    fill_in('name', :with => 'Nike')
    click_on('Create')
    expect(page).to have_content('Nike')
  end
end
