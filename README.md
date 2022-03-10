# Node.js Weight Tracker

![Demo](docs/build-weight-tracker-app-demo.gif)

This sample application demonstrates the following technologies.

* [hapi](https://hapi.dev) - a wonderful Node.js application framework
* [PostgreSQL](https://www.postgresql.org/) - a popular relational database
* [Postgres](https://github.com/porsager/postgres) - a new PostgreSQL client for Node.js
* [Vue.js](https://vuejs.org/) - a popular front-end library
* [Bulma](https://bulma.io/) - a great CSS framework based on Flexbox
* [EJS](https://ejs.co/) - a great template library for server-side HTML templates

**Requirements:**

* [Node.js](https://nodejs.org/) 12.x or higher
* [PostgreSQL](https://www.postgresql.org/) (can be installed locally using Docker)
* [Free Okta developer account](https://developer.okta.com/) for account registration, login

## Installation and Configuration on 2 ubunto machines
**Postgres machine:**
1. Install postgress (for example, [here](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart))
    ```sh 
    * sudo apt update
    * sudo apt install postgresql postgresql-contrib
    ```
1. Configure your postgress user's password:
    ```sh
    * sudo -i -u postgres
    * psql
    * alter user postgress set password 'passwordToBeUsedWhenConfiguringNode';
    * \q (to exit postgres interface)
    ```
1. Postgres configuration files:
    * Add listen_addresses = '*' to /etc/postgresql/12/main/postgresql.conf
    * Edit the following lines:
        \# IPv4 local connections:
        host    all             all             0.0.0.0/0             md5
        \# IPv6 local connections:
        host    all             all             ::/0                 md5
    *Add this line:
        host     all     all    {IP of your node machine}/32    md5
1. Restart the postgres process
    * sudo systemctl restart postgresql
    * Verify you see postgres when running ```sh sudo lsof -i -P -n | grep LISTEN```

**Node machine:**
1. Clone or download source files
1. Run `npm install` to install dependencies
    * npm install @hapi/hapi@19 @hapi/bell@12 @hapi/boom@9 @hapi/cookie@11 @hapi/inert@6 @hapi/joi@17 @hapi/vision@6 dotenv@8 ejs@3 postgres@1
    * npm install --save-dev nodemon@2
1. Create a [free Okta developer account](https://developer.okta.com/) and add a web application for this app
1. Copy `.env.sample` to `.env` and change the `OKTA_*` values to your application (see Okta config below)
    * Set HOST={internal IP of your machine}
    * Set HOST_URL={external IP of your machine}:{the port the node will answer}
    * Set PGHOST={IP of your Postgres machine}
    * Set PGUSERNAME={Your postgres username}
    * Set PGPASSWORD={password you have set pn the DB during the Postgres machin installation}
    * Leave the rest with the defaults

1. Initialize the PostgreSQL database by running `npm run initdb`
1. Run `npm run dev` to start Node.js
1. Open your local browser and go to {external IP of your machine}:{the port you have selcted}

**Okta settings:**
1. \# Okta configuration in the .env file
    * OKTA_ORG_URL= in your Okta account, click on your profile and it will appear below
    * OKTA_CLIENT_ID= from Applications=> General tab
    * OKTA_CLIENT_SECRET= from Applications=> General tab
2. Set in your Node machine's IP in Applications=> General tab (at the login box at the bottom)


The associated blog post goes into more detail on how to set up PostgreSQL with Docker and how to configure your Okta account.

