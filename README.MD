Before starting the container, you need to update the files in ./ssl:

ca.crt - the certificate for your certificate authority

server.crt - the certificate for your server

server.key - the private key for your server


Permissions on the ./ssl directory need to be 700 for the directory and 600 for the contents

Next you need to update server.conf accordingly. Check Port and Proto

Start the server with docker-compose up

Once the container is running, get the tls-crypt key that was created by running the following: 

docker exec docker-openvpn-server_ovpn_1 cat /etc/openvpn/ssl1/tls-crypt.key

You'll need to update the client config file with this

Add the client.crt and client.key to the client config in relevant sections

Make sure that the remote and proto lines of client config are updated to reflect the proto used and client ip (host ip/port that the container is running/exposed on)

For setting up CA, refer to docs here: 
https://openvpn.net/community-resources/how-to/#setting-up-your-own-certificate-authority-ca-and-generating-certificates-and-keys-for-an-openvpn-server-and-multiple-clients

