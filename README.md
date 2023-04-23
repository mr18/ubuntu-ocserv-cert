# ubuntu-ocserv-cert
ubuntu-ocserv-cert

1.`wget -N --no-check-certificate https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv.sh`

2.`chmod +x ocserv.sh`

3.`sudo bash ocserv.sh`

4.`sudo apt install gnutls-bin`

5.`sudo mkdir /etc/ocserv/ssl/`

6.`cd /etc/ocserv/ssl/`

7.
```
# X.509 Certificate options

# The organization of the subject.
organization = "vpn.example.com"

# The common name of the certificate owner.
cn = "Example CA"

# The serial number of the certificate.
serial = 001

# In how many days, counting from today, this certificate will expire. Use -1 if there is no expiration date.
expiration_days = -1

# Whether this is a CA certificate or not
ca

# Whether this certificate will be used to sign data
signing_key

# Whether this key will be used to sign other certificates.
cert_signing_key

# Whether this key will be used to sign CRLs.
crl_signing_key
```
8.`sudo certtool --generate-self-signed --load-privkey ca-privkey.pem --template ca-cert.cfg --outfile ca-cert.pem`

# links
[https://github.com/sfc9982/AnyConnect-Server](https://github.com/sfc9982/AnyConnect-Server)
[https://github.com/tinkernels/anyconnect-routes](https://github.com/tinkernels/anyconnect-routes)

