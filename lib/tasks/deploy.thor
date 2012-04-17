class Deploy < Thor::Group
  desc "Deploy to heroku and push to github"

  def one
    say '# Pushing to github'
    `git push`
    say '# Deploying to Heroku'
    `git push heroku`
    say '# Populating the database with fake data'
    `heroku run thor populate`
  end

end