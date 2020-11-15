cd /usr/local/sbin/
./ipsec pki --gen > caKey.der
./ipsec pki --self --in caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CA" --ca > caCert.der
./ipsec pki --gen > cool1Key.der
./ipsec pki --pub --in cool1Key.der | ./ipsec pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=cool1" > cool1Cert.der
./ipsec pki --gen > viper1Key.der
./ipsec pki --pub --in viper1Key.der | ./ipsec pki --issue --cacert caCert.der --cakey caKey.der --dn "C=CH, O=blr.asicdesigners.com, CN=viper1" > viper1Cert.der

#NOTE - Copy viper1Key.der, viper1Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
rm -rf /usr/local/etc/ipsec.d/private/*
rm -rf /usr/local/etc/swanctl/private/*
rm -rf /usr/local/etc/ipsec.d/certs/*
rm -rf /usr/local/etc/ipsec.d/cacerts/*
cp cool1Key.der /usr/local/etc/ipsec.d/private/
cp cool1Key.der /usr/local/etc/swanctl/private/
cp cool1Cert.der /usr/local/etc/ipsec.d/certs/
cp cool1Cert.der /usr/local/etc/swanctl/x509/
cp caCert.der /usr/local/etc/ipsec.d/cacerts/
#On Host2 -
ssh viper1 "rm -rf /usr/local/etc/ipsec.d/private/*"
ssh viper1 "rm -rf /usr/local/etc/swanctl/private/*"
ssh viper1 "rm -rf /usr/local/etc/ipsec.d/certs/*"
ssh viper1 "rm -rf /usr/local/etc/ipsec.d/cacerts/*"
scp viper1Key.der viper1:/usr/local/etc/ipsec.d/private/
scp viper1Key.der viper1:/usr/local/etc/swanctl/private/
scp viper1Cert.der viper1:/usr/local/etc/ipsec.d/certs/
scp viper1Cert.der viper1:/usr/local/etc/swanctl/x509/
scp caCert.der viper1:/usr/local/etc/ipsec.d/cacerts/
cd
