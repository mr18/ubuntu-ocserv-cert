# ubuntu-ocserv-cert
ubuntu-ocserv-cert

`wget -N --no-check-certificate https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv.sh`

`chmod +x ocserv.sh`

`sudo bash ocserv.sh`

`sudo apt install gnutls-bin`

`sudo mkdir /etc/ocserv/ssl/`

`cd /etc/ocserv/ssl/`

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


# links
[https://github.com/sfc9982/AnyConnect-Server](https://github.com/sfc9982/AnyConnect-Server)
[https://github.com/tinkernels/anyconnect-routes](https://github.com/tinkernels/anyconnect-routes)

