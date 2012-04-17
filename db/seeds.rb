# encoding: utf-8

owner = owner = Fabricate(:user, email: 'owner@test.com', password: 'owner', owner: true)
school = Fabricate(:school)