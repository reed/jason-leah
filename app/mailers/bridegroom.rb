class Bridegroom < ActionMailer::Base
  default from: "Wedding RSVPs <no-reply@jason-leah.com>",
          to: Rails.env.development? ? 'reednj77@gmail.com' : ['reednj77@gmail.com', 'weberleah1@gmail.com', 'jrbartend22@gmail.com']

  def rsvp(rsvp_data)
    @rsvp = rsvp_data

    mail subject: "RSVP from #{@rsvp.guests.first}"
  end
end
