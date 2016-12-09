# Sock'It

<a href="https://codeclimate.com/github/SolalDR/Sock-It"><img src="https://codeclimate.com/github/SolalDR/Sock-It/badges/gpa.svg" /></a>

E-commerce application run with ruby on rails.

##Configuration

* Ruby version : ruby 2.3.1p112

* System dependencies : /


##Initialize application


####In the parent directory
```
git clone https://github.com/SolalDR/Sock-It.git
```

####In the directory Sock-It run
```
bundle install
```

####Install stripe
To install the stripe gem
```
gem install netrc -v '0.11.0'
gem install domain_name -v '0.5.20161129'
```
To create stripe account, <a href="https://stripe.com/fr ">click here</a>
In config/secrets.yml, add API keys get after your stripe's registration.
To get the API key follow <a href="https://launchschool.com/blog/stripe-checkout">this tutorial</a> after logged in
``` yml
development:
    stripe_publishable_key: pk_test_xxxxxxxxxxxxxxxxxxxxx
    stripe_secret_key:  sk_test_xxxxxxxxxxxxxxxxxxxxx
```

####Run the server
```
rails s
```

#####Create and migrate

If database doesn't exist :
```
rails db:create
```

####In the directory Sock-It run
```
bundle install
```

####Run the server
```
rails s
```

#####Create and migrate

If database doesn't exist :
```
rails db:create
```

If migration are pending :
```
rails db:migrate
```

To load the seeds :
```
rails db:seed
```

Now you can login :
Email =>      admin@admin.com
Password =>   adminpass

##How To Commit

After work :
```
git stash
git pull
git stash apply
git add .
git commit -m "Your message goes here"
git push
```
