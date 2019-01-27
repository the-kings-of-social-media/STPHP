# Saint Tammany Parish Hospital Pediatrics Craft Website (STPHP)
This repo contains all of the templates, front-end resources, and a MySQL database backup for "Saint Tammany Parish Hospital Pediatrics Craft Website"


## Features

STPHP takes advantage of several Craft features:

#### Sections

The content in STPHP is managed from the following [sections](https://docs.craftcms.com/v3/sections-and-entries.html#sections):

* Four “Single” sections:
  - Homepage
  - About
  - Services Index
  - Work Index
* Two “Channel” sections:
  - News
  - Work
* Two “Structure” sections:
  - Locations
  - Services

#### Entry Types

The News section has two [entry types](https://docs.craftcms.com/v3/sections-and-entries.html#entry-types):

* **Article** – used to store news articles
* **Link** – used to store links to articles on other websites

#### Matrix Fields

This site has the following [Matrix fields](https://docs.craftcms.com/v3/matrix-fields.html):

* **Article Body** – used to store the varying content of the About page and News, Services, and Work entries.
* **Contact Methods** – used to store Locations’ various contact methods.
* **Services Body** – used to store information about the Services.
* **Testimonials** – used to store the Homepage testimonials.

#### Relations

This site has the following [relational fields](https://docs.craftcms.com/v3/relations.html#terminology):

* **Services Performed** _(Entries)_ – used to relate Work entries to the relevant Services entries.
* **Client Logos** _(Assets)_ – used to related the Homepage to the logos that should be displayed in the “Our Best Drinking Buddies” section.
* **Featured Image** _(Assets)_ – used to relate a featured image to News, Work, Services, and Locations entries.
* **Featured Thumb** _(Assets)_ – used to relate a featured thumbnail to Work entries.
* **Hero Image** _(Assets)_ – used to relate a hero image to the Homepage.
* **Service Icon** _(Assets)_ – used to relate an icon to Services entries.
* There are additional Assets fields within the “Article Body” and “Service Body” Matrix fields.

#### Assets

This site has the following [asset volumes](https://docs.craftcms.com/v3/assets.html):

* **Site Assets** – used to store all miscellaneous site imagery.
* **Company Logos** – used to store the company logos that are displayed on the Homepage.
* **Service Icons** – used to store Services’ icons.


## Installation

If you want to install the site locally, follow these instructions:

1. Download/clone the repo on your computer:

   ```bash
   git clone https://github.com/craftcms/demo.git stphp.test
   ```

2. Run `composer install` within the clone:

   ```bash
   cd stphp.test
   composer install
   ```
   
3. Create a `.env` file at the root of the project with the following contents, and then update the `DB_USER` and `DB_PASSWORD` values to your database user’s credentials.

   ```dotenv
# The environment Craft is currently running in ('dev', 'staging', 'production', etc.)
ENVIRONMENT="dev"

# The secure key Craft will use for hashing and encrypting data
SECURITY_KEY="4kwV7F93eNqUoKEDkOZtTUNiO9x37R4O"

# The database driver that will be used ('mysql' or 'pgsql')
DB_DRIVER="mysql"

# The database server name or IP address (usually this is 'localhost' or '127.0.0.1')
DB_SERVER="localhost"

# The database username to connect with
DB_USER="root"

# The database password to connect with
DB_PASSWORD="root"

# The name of the database to select
DB_DATABASE="stphp"

# The database schema that will be used (PostgreSQL only)
DB_SCHEMA="public"

# The prefix that should be added to generated table names (only necessary if multiple things are sharing the same database)
DB_TABLE_PREFIX=""

# The port to connect to the database with. Will default to 5432 for PostgreSQL and 3306 for MySQL.
DB_PORT="3306"

DEFAULT_SITE_URL="stphp.test"
   ```

4. Ensure that the following files and directories have permissions that will allow PHP to read and write to them:

   - `.env`
   - `composer.json`
   - `composer.lock`
   - `config/license.key`
   - `storage/*`
   - `vendor/*`
   - `web/cpresources/*`

5. Create a new MySQL database called `stphp`, and import `stphp.sql` into it.

6. Create a new virtual host with the hostname `stphp.test` that points to the `stphp.test/web/` folder.

7. Edit your hosts file to resolve `stphp.test` to `127.0.0.1`, if necessary.

Now point your browser at `http://stphp.test`. You should see the STPHP homepage.

## Logging in

The Craft Control Panel is located at `http://stphp.test/admin`. You can log in with the following credentials:

* Username: `admin`
* Password: `admin01`

