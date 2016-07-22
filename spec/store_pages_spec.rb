require('spec_helper')

describe('the store path', { :type => :feature }) do
  it('should display a list of all stores') do
    test_store1 = Store.create({name: "Target"})
    test_store2 = Store.create({name: "H&M"})
    visit('/stores')
    expect(page).to have_content('Target')
  end

  it('should create a store') do
    visit('/stores/new')
    fill_in('name', :with => 'Target')
    click_on('Create')
    expect(page).to have_content('Target')
  end

  it('should show errors if the user does not enter a name') do
    visit('/stores/new')
    click_on('Create')
    expect(page).to have_content('Oops!')
  end

  it('should show the store page') do
    test_store = Store.create({name: "Target"})
    visit('/stores')
    click_link('Target')
    expect(page).to have_content('Target')
  end

  it('should allow the user to add brands to the store and edit the store') do
    test_store = Store.create({name: "Target"})
    test_brand1 = Brand.create({name: "Nike"})
    test_brand2 = Brand.create({name: "Adidas"})
    visit("/stores/#{test_store.id()}/edit")
    fill_in('name', :with => "K-mart")
    check("#{test_brand1.id()}")
    check("#{test_brand2.id()}")
    click_on('Update')
    expect(test_store.brands()).to eq([test_brand1, test_brand2])
    expect(page).to have_content('K-mart')
    expect(page).to have_content('Nike Adidas')
  end

  it('should allow the user to delete stores') do
    test_store = Store.create({name: "Target"})
    visit('/stores')
    click_on('Target')
    click_on('Delete')
    expect(Store.all()).to eq([])
  end
end
