#sles12sp3, 12sp5, 15sp2, suma4.1, 11sp4, 12sp3_sap, 12sps5_sap
#SLES/12.3/x86_64
#SLES_SAP/12.3/x86_64
#SUSE_SLES/11.4/x86_64
#SUSE-Manager-Proxy/4.1/x86_64
#SUSE-Manager-Server/4.1/x86_64
# sle-clienttools/11.4/x86_64
# sle-manager-tools/12/x86_64
# sle-manager-tools/15/x86_64

for i in 12.3 12.5 15.2; do rmt-cli products enable SLES/$i/x86_64; done
for i in 12.3 12.5; do rmt-cli products enable SLES_SAP/$i/x86_64; done
for i in SUSE_SLES/11.4/x86_64 SUSE-Manager-Proxy/4.1/x86_64 SUSE-Manager-Server/4.1/x86_64; do rmt-cli products enable $i; done
for i in sle-clienttools/11.4/x86_64 sle-manager-tools/12/x86_64 sle-manager-tools/15/x86_64; do rmt-cli products enable $i; done
