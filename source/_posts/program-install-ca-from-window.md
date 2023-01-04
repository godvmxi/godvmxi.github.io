---
title: Install ca certificates exported from windows
date: 2023-01-04 17:03:55
tags:
    - CA
    - openssl
---
Sometime we need to sync ca from windows to linux
# Export CA from windows
![](export.png)

# Convert CA format from windows to linux
```bash
openssl x509 -inform PEM -in certificate.cer -out certificate.crt
```

But CER is an X.509 certificate in binary form, DER encoded. CRT is a binary X.509 certificate, encapsulated in text (base-64) encoding.  
Because of that, you maybe should use:
```bash
openssl x509 -inform DER -in certificate.cer -out certificate.crt
```

# Copy your CA to dir
```bash
/usr/local/share/ca-certificates/
```

# Update ubuntu CA store
```bash
sudo update-ca-certificates
```

# Extra
## Get ca from server 

```bash
openssl s_client -connect www.google.com:443 2>/dev/null </dev/null |  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'

```