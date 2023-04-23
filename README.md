# ubuntu-ocserv-cert
ubuntu-ocserv-cert

1. `wget -N --no-check-certificate https://raw.githubusercontent.com/sfc9982/AnyConnect-Server/main/ocserv.sh`

2. `chmod +x ocserv.sh`

3. `sudo bash ocserv.sh`

4. `sudo apt install gnutls-bin`

5. `sudo mkdir /etc/ocserv/ssl/`

6. `cd /etc/ocserv/ssl/`

> 生成服务端cert

7. `sudo vi ca-cert.cfg`

8. 
```
organization = "vpn.example.com"

cn = "VPN"

serial = 001

expiration_days = -1

ca

signing_key

cert_signing_key

crl_signing_key
```


9. `sudo certtool --generate-self-signed --load-privkey ca-privkey.pem --template ca-cert.cfg --outfile ca-cert.pem`

> 生成客户端cert

10. `sudo vi client-cert.cfg`

11. 
```
organization = "vpn.example.com"

cn = "VPN"

uid = "John"

expiration_days = 3650

tls_www_client

signing_key

encryption_key
```


12.`sudo certtool --generate-certificate --load-privkey client-privkey.pem --load-ca-certificate ca-cert.pem \
    --load-ca-privkey ca-privkey.pem --template client-cert.cfg --outfile client-cert.pem`

> 客户端证书 
> 单用户情况

13. `sudo certtool --to-p12 --load-privkey client-privkey.pem --load-certificate client-cert.pem --pkcs-cipher aes-256 --outfile client.p12 --outder`

> ps: IOS 客户端证书

14. `sudo certtool --to-p12 --load-privkey client-privkey.pem --load-certificate client-cert.pem --pkcs-cipher 3des-pkcs12 --outfile ios-client.p12 --outder`


> 多用户情况生成证书

1. `sudo vi client-cert.cfg`

2. 
```
organization = "vpn.example.com"

cn = "VPN"

uid = "John"

expiration_days = 3650

tls_www_client

signing_key

encryption_key
```
3. `sudo certtool --generate-request --load-privkey client-privkey.pem --template client-cert.cfg --outfile request.pem`

4. `sudo certtool --generate-certificate --load-ca-certificate ca-cert.pem --load-ca-privkey ca-privkey.pem \
    --load-request request.pem --template client-cert.cfg --outfile client-cert.pem`
    

> 接上14

15. `sudo vim /etc/ocserv/ocserv.conf`

```

#auth = "plain[passwd=/etc/ocserv/ocpasswd]"

auth = "certificate

ca-cert = /etc/ocserv/ssl/ca-cert.pem
```

    
# links
[https://github.com/sfc9982/AnyConnect-Server](https://github.com/sfc9982/AnyConnect-Serve
[https://cloud-atlas.readthedocs.io/zh_CN/latest/linux/security/vpn/ocserv/client_certificate_ocserv.html](https://cloud-atlas.readthedocs.io/zh_CN/latest/linux/security/vpn/ocserv/client_certificate_ocserv.html)
[https://github.com/tinkernels/anyconnect-routes](https://github.com/tinkernels/anyconnect-routes)

