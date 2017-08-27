# How to host a Ghost Blog v1.x for Free on Github Pages

![ghost-blog](/images/ghost-blog.png)

[Ghost](https://ghost.org/) is a free, open-source blogging platform known for its simplicity, letting you focus on writing.

There is a small hiccup though. If you want to use Ghost Pro(which is similar to Wordpress.com) for hosting your blog, the basic plan starts at around $20 per month.


Originally, my Ghost blog was hosted on Heroku for free but Ghost decided to drop support for PostgreSQL(which is the database Heroku provides for free) for versions 1.x and later. You now need to pay around $10 per month for MySQL database if you want to host on Heroku.


Solution : Github Pages.


Github Pages is a free static site hosting service that allows you to your personal, organisational and other open-source pages.


We will also be using a modified working version of a tool called Buster to generate static pages from our Ghost blog since the author of the original tool doesn't support it any more and it's Github repository is filled with issues.


So here is my guide on how to setup a Ghost blog, host it on Github Pages with a custom domain. [Click Here to Checkout my blog using this setup.]()


So, let's get started...


### 1. Install Node.js

Node.js is the platform which powers Ghost.
Download and install the latest LTS version for your OS.
https://nodejs.org/en/download/

![nodejs](/images/nodejs.png)


### 2. Download Ghost

1. Download the latest version of Ghost from [Ghost Developers](https://ghost.org/developers/).
2. Extract it somewhere you will remember.
   (I have extracted it to my Desktop)
   
   
### 3. Setup Ghost Environment

Open your terminal and navigate to the extracted folder.
```
npm install --production
npm install -g knex-migrator --save
knex-migrator reset && knex-migrator init
```
![ghost_environment](/images/ghost_environment.png)


### 4. Start Ghost on localhost

1. Now you have ghost successfully set up. Let's start it on the localhost by running `npm start`.
![start_ghost](/content/images/2017/08/start_ghost.png)
2. Ghost will now be live at [http://localhost:2368/](http://localhost:2368/).

![ghost](/images/ghost.png)


### 5. Configure Ghost

1. Go to [http://localhost:2368/ghost](http://localhost:2368/ghost) and follow the instructions to set up your blog.
![ghost_setup-1](/content/images/2017/08/ghost_setup-1.png)
2. Create your desired content on the Ghost Admin Panel.

![ghost_admin](/images/ghost_admin.png)


### 6. Create a Github Pages Repository

Head over to Github and create a repository called `username.github.io`. (In my case, [samanyougarg.github.io](https://samanyougarg.github.io))

![github_pages](/images/github_pages.png)


### 7. Install Buster

Buster is a python package to generate static pages from Ghost blogs. 
Note - If you are on a mac, you first need to install wget using `brew install wget`.

`pip install buster`


### 8. Clone Github Repository

Clone your Github Pages repository inside a sub-folder called static. All your static files will be stored here.
`git clone git@github.com:username/username.github.io.git static`

![ghost_folder](/images/ghost_folder.png)


### 9. Download fixed buster and update script

Download this hacked [buster.py](https://github.com/samanyougarg/ghost-on-github/blob/master/buster.py) and [this script](https://github.com/samanyougarg/ghost-on-github/blob/master/update.sh) and put these inside your ghost folder. Open buster.py using a text editor/code editor and change yourdomain.com (at lines 136-137) to your github subdomain yourusername.github.io or example.tld if you are using a custom domain (In my case merutan.com). Also, open update script in a text/code editor and change your domain on line 4. Run `chmod u+x update.sh` to give required permissions to your script.

![copy_script_buster](/images/copy_script_buster.png)


### 10. Generate Static Pages from your Ghost blog

Making sure Ghost is running on a terminal window, open another terminal window, navigate to your ghost folder and run `./update.sh` to generate static files in the static sub-folder, automatically change your urls in all files and commit and push to your Github repository.

![run_script](/images/run_script.png)


### 11. What does the update script do?

1. It generates static pages into your static folder from your blog using modeified buster program.
2. Replaces all localhost urls inside static folder with your urls.
3. Adds, commits and pushes all files in the static folder to your Github repository.

![meru](/images/meru.png)


Your blog will now be published at yourusername.github.io.
> Note - It may take upto 10 minutes for your blog to be published at your github pages url.


### 12. Updating your blog

Whenever you want to modify your blog, change the theme or write a new post, you need to run `npm start` in a terminal window inside the Ghost folder to start the server. Then you can go to http://localhost:2368/ghost/ and do whatever you want to.

Next open a new terminal window and run `./update.sh` to generate new static files and push the changes to your repository. It may take upto 10 minutes to update the website.


### How to set up a custom domain with Github Pages

Go to the DNS Management Page of your Domain Provider and follow these steps -
1. Add an 'A' record with Name as '@' and IP address as '192.30.252.153'.
2. Add another 'A' record with Name as '@' and IP address as '192.30.252.154'.
3. Add a 'CNAME' record with Name as 'www' and Domain Name as 'yourusername.github.io'.

Now go to your Github Pages repository -> Settings -> Github Pages -> Custom Domain, input your custom domain and hit 'Save'.

Your blog will be live at your custom domain in a few minutes.

And that's it. Hope this tutorial helped you.
Don't forget to star and fork my repository and visit my blog to read interesting articles like this one.


**References**

1. https://stefanscherer.github.io/setup-ghost-for-github-pages/
2. https://gist.github.com/alexweber/fdc86aa225e7294c17dfb375e846b599
