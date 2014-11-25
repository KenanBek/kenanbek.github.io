# Important files

+ /etc/httpd/conf/httpd.conf - apache configuration
+ /etc/my.conf - mysql configuration
+ /etc/group - list of group and its members

# Commands

## lid

Display user's groups or group's users

    lid kenan
    lid -g root

## chown

chown command changes the user and/or group ownership of for given file.

    chown owner-user file
    chown owner-user:owner-group file
    chown owner-user:owner-group directory
    chown options owner-user:owner-group file
    chown -R owner-user:owner-group file (change recursive)

