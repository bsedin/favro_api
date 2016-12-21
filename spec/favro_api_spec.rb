require "spec_helper"

describe FavroApi do
  it "has a version number" do
    expect(FavroApi::VERSION).not_to be nil
  end

  it "should receive and remember auth params" do
    params = { email: 'ololo@lolo.lo', token: 'ololololo' }

    subject.auth(params)
    expect(subject.auth_email).to eq(params[:email])
    expect(subject.auth_token).to eq(params[:token])
  end
end
