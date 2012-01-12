require 'spec_helper'

describe 'ErrMerchant' do
  it 'raises a 500 when an exception is raised' do
    visit '/failures'

    page.should have_content("We're sorry, but something went wrong.")
    page.status_code.should == 500
  end
  
  it 'raises a 404 when record not found' do
    visit '/failures/2/edit'
    
    page.should have_content("The page you were looking for doesn't exist.")
    page.status_code.should == 404
  end

  it 'raises a 422 when an unprocessable entity is encountered' do
    visit '/failures/1'

    page.should have_content("The change you wanted was rejected.")
    page.status_code.should == 422
  end

end