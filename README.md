# Dokku-alt-strider-cd

[Strider](https://github.com/Strider-CD/strider) it's a Continuous Integration and Deployment Server, that can be installer easy over [dokku](http://dokku.viewdocs.io/) or [dokku-alt](https://dokku-alt.github.io/) with this repo :)

## Steps

First, create the application on dokku with this command:

    dokku apps:create strider

Install, create and link a mongodb database with:

    ssh root@YOUR_DOKKU_HOST dokku plugin:install https://github.com/dokku/dokku-mongo.git mongo
    dokku mongo:create
    dokku mongo:link strider strider
    #check the MONGO_URL variable for the next steps
    dokku config:set MONGODB_URL=mongodb://strider:dabde692a0d2fb18577186a02eb9a4e9@dokku-mongo-strider:27017/strider
    dokku config:set DB_URI=mongodb://strider:dabde692a0d2fb18577186a02eb9a4e9@dokku-mongo-strider:27017/strider

Then, clone the repo and link with dokku:

    git clone https://github.com/ayufan/dokku-alt-strider-cd.git
    cd dokku-alt-strider-cd
    git remote add dokku dokku@YOUR_DOKKU_HOST:strider

And push on dokku to deploy:

    git push dokku master

Finally, create an user:

    dokku run bin/strider addUser

great, it's works!

![](images/preview.png)
