class Deploy < Thor::Group
  desc "Deploy to heroku and push to github"

  def one
    say '# Pushing to github'
    `git push`
    say '# Deploying to Heroku'
    `git push heroku`
    say '# reseeding'
    `heroku run rake db:reseed`
  end

end