Fabricator(:user) do
  first_name { Forgery(:name).first_name }
  last_name { Forgery(:name).last_name }
  dni { Forgery(:basic).password(:at_least => 9, :at_most => 9) }
  email { Forgery(:internet).email_address }
  password { 'password' }
end
