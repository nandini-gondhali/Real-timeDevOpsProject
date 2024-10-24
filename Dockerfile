FROM centos:latest

# Install necessary packages
RUN yum install -y httpd zip unzip

# Add the zip file to the specified location
ADD https://www.tooplate.com/zip-templates/2133_moso_interior.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the contents of the zip file
RUN unzip 2133_moso_interior.zip

# Corrected the folder name "photogeneic" to "photogenic"
RUN cp -rvf 2133_moso_interior/* . 

# Clean up the unnecessary files
RUN rm -rf 2133_moso_interior 2133_moso_interior.zip

# Command to run the HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80