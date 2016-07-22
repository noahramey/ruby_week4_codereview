require('spec_helper')

describe(Brand) do
  it('has many stores') do
    test_brand = Brand.create({name: "Nike"})
    test_store1 = test_brand.stores.new({name: "Target"})
    test_store2 = test_brand.stores.new({name: "H&M"})
    expect(test_brand.stores()).to(eq([test_store1, test_store2]))
  end
end
