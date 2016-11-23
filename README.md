# README

This README would normally document whatever steps are necessary to get the
application up and running.

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
