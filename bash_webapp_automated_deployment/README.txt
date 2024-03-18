Setup has to be done in the following order:

1. MySQL (Database SVC)
2. Memcache (DB Caching SVC)
3. RabbitMQ (Broker/Queue SVC)
4. Tomcat (Application SVC)

   a. If we're using Centos, we have to create tomcat service manually, this means we have to create
   tomcat user and its homedir, download it manually with wget, tar the archive and move the files 
   to the user's how dir /usr/local/tomcat. 
   b. tomcat and its group have to own /usr/local/tomcat.
   c. delete and recreate tomcat.service, daemon reload, start&enable service.
   d. allow port 8080/tcp or disable firewalld.
   e. clone the github project, install mvn in the downloaded folder and replace artifact ROOT.war 
      in /usr/local/tomcat/webapps/; restart tomcat.service.

5. Nginx (Web SVC)

    a. If we're using Centos, nginx does not have the same folder structure as on Ubuntu, therefore
    we need write the config file in /etc/nginx/conf.d/
    b. If we're using Ubuntu, the structure looks like this /etc/nginx/sites-available and 
    /etc/nginx/sites-enabled. Remove /etc/nginx/sites-enabled/default and create a symbolic link with
    /etc/nginx/sites-available/vproapp.