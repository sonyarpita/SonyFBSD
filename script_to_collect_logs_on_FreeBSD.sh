mkdir /root/$1
sysctl -n dev.t6nex.0.misc.cim_la > cim_la
sysctl -n dev.t6nex.0.misc.cim_qcfg > cim_qcfg
sysctl -n dev.t6nex.0.misc.meminfo > meminfo
cxgbetool t6nex0 memdump 0 4194304 | xxd -r -p > edc0
cxgbetool t6nex0 memdump 0x400000 4194304 | xxd -r -p > edc1
sysctl -n dev.t6nex.0.misc.devlog > devlog
sysctl dev.t6nex.0.misc.cim_ibq_tp0 > ibq_tp0
sysctl dev.t6nex.0.misc.cim_ibq_tp1 > ibq_tp1
sysctl dev.t6nex.0.misc.cim_ibq_ulp > ibq_ulp
sysctl dev.t6nex.0.misc.cim_ibq_sge0 > ibq_sge0
sysctl dev.t6nex.0.misc.cim_obq_sge > obq_sge
sysctl dev.t6nex.0.misc.cim_obq_ulp0 > obq_ulp0
sysctl dev.t6nex.0.misc.cim_obq_ulp1 > obq_ulp1
cxgbetool t6nex0 regdump > regdump
echo "collecting mc please wait...."
cxgbetool t6nex0 memdump 0x800000 4285530112 | xxd -r -p > mc



