# BackupDriver

BackupDriver is a tool created to backup files from Unix systems. It's was created to address some very specific personal needs:

  * Backup log files to Amazon S3 and remove them from the server
  * Backup local mysql databases to Amazon S3

The generated backup file is encrypted using [gpg][] and sent to Amazon S3. The operations are performed using tools that must be installed on the system:

  * [gpg][]
  * [s3cmd][]
  * [mysqldump][]

[Backup][b] is another tool that you might be interested in checking out. It's scope is much broader. So it can be useful in many situations that are not covered by BackupDriver. 

## Installation

Add this line to your application's Gemfile:

    gem 'backup_driver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backup_driver

## Usage

### Backup nginx log files

```shell
backup_driver backup --source /var/log/nginx --bucket "s3://mybucket" --gpg-options "--recipient 'my@email.com'"
```

**CAUTION**: BackupDriver removes the log files after sending them to Amazon S3. If you don't want that to happen, please consider using a different tool or change the code to suite your needs.

### Backup mysql database

```shell
backup_driver mysql --name db_name --user db_user --password db_password --gpg-options "--recipient 'my@email.com'"  
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[gpg]:       http://www.gnupg.org/
[s3cmd]:     http://s3tools.org/s3cmd
[mysqldump]: http://dev.mysql.com/doc/refman/5.1/en/mysqldump.html
[b]:         https://github.com/meskyanichi/backup
