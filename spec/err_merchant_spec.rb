require 'spec_helper'

describe 'ErrMerchant' do
  it 'shows a 500 when an exception is raised' do
    visit '/failures/wild_error'

    page.should have_content("We're sorry, but something went wrong.")
    page.status_code.should == 500
  end

  it 'shows a 404 when record not found' do
    visit '/failures/where_is_it'

    page.should have_content("The page you were looking for doesn't exist.")
    page.status_code.should == 404
  end

  it 'shows a 422 when an unprocessable entity is encountered' do
    visit '/failures/dont_process_this'

    page.should have_content("The change you wanted was rejected.")
    page.status_code.should == 422
  end

  it 'shows the error in the application layout' do
    visit '/failures/wild_error'

    page.should have_content("ErrMerchant Test Application")
  end

  it 'does respect the ErrMerchant.skip_filters' do
    visit '/failures/where_is_it?raise_error=true'

    page.should have_content("The page you were looking for doesn't exist.")
    page.status_code.should == 404
  end

  it 'does not kick in if there are no errors' do
    visit '/failures/usual_action'

    page.should have_content("This is a usual action.")
    page.status_code.should == 200
  end

  it 'shows translated error messages if available' do
    I18n.locale = :de

    visit '/failures/where_is_it'
    page.should have_content("Seite nicht gefunden")

    I18n.locale = :en
  end

  it 'falls back to standard error pages if everything goes wrong' do
    ErrMerchant.layout = "erroneous"

    visit '/failures/wild_error'
    page.should have_content("We're sorry, but something went wrong.")
    page.status_code.should == 500
    page.should_not have_css('div.err_merchant')
    page.should have_css('div.dialog h1')

    ErrMerchant.layout = "application"
  end

  it 'shows an error on failed forgery protection' do
    visit '/failures/usual_action'
    click_button "csrf_error"

    page.status_code.should == 422
    page.should have_content("The change you wanted was rejected.")
  end

  it "does not try to verify authenticity tokens" do
    visit '/failures/usual_action'
    click_button "post_error"

    page.status_code.should == 500
    page.should have_content("We're sorry, but something went wrong.")
  end
end
