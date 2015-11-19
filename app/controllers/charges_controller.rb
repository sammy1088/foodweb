class ChargesController < ApplicationController
def new
end

def create
Stripe::Charge.create({
  :amount => 1000,
  :currency => "usd",
  :destination => {@user.uid}
})

end
end
