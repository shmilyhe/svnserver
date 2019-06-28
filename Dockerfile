FROM centos:latest
RUN yum -y install subversion mysql-server httpd mod_dav_svn mod_ssl mod_perl sendmail wget gcc-c++ make unzip perl* ntsysv vim-enhanced java-1.8.0-openjdk &&\
mkdir -p /data/svn/ &&\
mkdir -p /data/svn/repos &&\
svnadmin create --fs-type fsfs /data/svn/repos &&\
chown -R apache.apache /data/svn 
RUN touch /data/svn/authz &&\
touch /data/svn/passwd
VOLUME [ "/data/svn" ]
EXPOSE 3690 80 443
ADD 10-subversion.conf /etc/httpd/conf.modules.d/10-subversion.conf
ADD run.sh /run.sh
ADD init.sh /init.sh
CMD [ "/run.sh" ]
