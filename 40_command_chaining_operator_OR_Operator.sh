# Check if nginx package installed, if not then install it.
command -v nginx 1>/dev/null 2>/dev/null || yum install nginx -y
which nginx 1>/dev/null 2>/dev/null || yum install nginx -y
which nginx 1>/dev/null 2>/dev/null  --> We are nullifying success output with 1>/dev/null
#                                          We are nullyfying error output with 2>/dev/null
# If first command succeeded then && AND operater will be executed thus "Nginx is installed on this Host" will be printed
# If first command failed then OR || operator will be executed thus "Nginx is not installed on this host" will be printed.
which nginx 1>/dev/null 2>/dev/null && echo "Nginx is installed on this Host" || echo "Nginx is not installed on this host"
command -v nginx 1>/dev/null 2>/dev/null && echo "Nginx is installed on this Host" || echo "Nginx is not installed on this host"
