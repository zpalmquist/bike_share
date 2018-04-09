require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] =
    OmniAuth::AuthHash.new({
      provider: "google",
      uid: "12345",
      info: {
        email: "test@google.com",
        first_name: "kyle",
        last_name: "sallette",
        image: "something.jpg"
      },
      credentials: {
        token: "123e45",
        refresh_token: "34534232",
        expires_at: DateTime.now
      }

      })
    end


  describe 'user can sign in'  do
    context 'from the home page'  do
      it 'with oauth'  do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")

      click_link "Sign in with Google"

      expect(page).to have_content("Kyle Sallette")

      expect(page).to have_link("Logout")

      end
    end
  end