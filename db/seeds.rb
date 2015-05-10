# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin1088",
    email: "admin@example.com",
  password: "admin1088",
    admin: true
)
u.skip_confirmation!
u.save!
