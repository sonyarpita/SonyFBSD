cd /usr/local/sbin/
./ipsec pki --gen > caKeyp1.der
./ipsec pki --self --in caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=blr.asicdesigners.com CAp1" --ca > caCertp1.der
./ipsec pki --gen > cool1Keyp1.der
./ipsec pki --pub --in cool1Keyp1.der | ./ipsec pki --issue --cacert caCertp1.der --cakey caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=cool1p1" > cool1Certp1.der
./ipsec pki --gen > viper1Keyp1.der
./ipsec pki --pub --in viper1Keyp1.der | ./ipsec pki --issue --cacert caCertp1.der --cakey caKeyp1.der --dn "C=CH, O=blr.asicdesigners.com, CN=viper1p1" > viper1Certp1.der

#NOTE - Copy viper1Key.der, viper1Cert.der, caCert.der to Host2

#Copy the keys as follows
#On Host1 -
cp cool1Keyp1.der /usr/local/etc/ipsec.d/private/
cp cool1Keyp1.der /usr/local/etc/swanctl/private/
cp cool1Certp1.der /usr/local/etc/ipsec.d/certs/
cp cool1Certp1.der /usr/local/etc/swanctl/x509/
cp caCertp1.der /usr/local/etc/ipsec.d/cacerts/
#On Host2 -
scp viper1Keyp1.der viper1:/usr/local/etc/ipsec.d/private/
scp viper1Keyp1.der viper1:/usr/local/etc/swanctl/private/
scp viper1Certp1.der viper1:/usr/local/etc/ipsec.d/certs/
scp viper1Certp1.der viper1:/usr/local/etc/swanctl/x509/
scp caCertp1.der viper1:/usr/local/etc/ipsec.d/cacerts/
cd
