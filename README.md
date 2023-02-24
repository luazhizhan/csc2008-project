# csc2008-project

## Setup

### MySQL

Download and install [mysql-installer-community-<version>.msi](https://dev.mysql.com/downloads/installer/)

#### Import via SQL Scripts

Install the following VSCode extensions.

- [sqltools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
- [SQLTools MySQL/MariaDB](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-mysql)

Execute `Script/create_table.sql` on MySQL Workbench or sqltools extension.

Execute `Script/import_csv.sql` on sqltools extension.

#### Import via SQL Dump

Unzip and import `SQL dump` folder uploaded in the telegram group chat via MySQL Workbench Import Data function.

### MonogoDB

Install software.

- [MongoDB](https://www.mongodb.com/try/download/community)
- [Compass](https://www.mongodb.com/try/download/compass)

#### Import via Dump

Unzip and import `csc2008-mongodb-dump` folder uploaded in the telegram group using this command.

```bash
mongorestore --authenticationDatabase=admin -u <ADMIN> -p <PASSWORD> -d csc2008 <PATH>
```
