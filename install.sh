#! /bin/bash
# @edt ASIX M06 2018-2019
# instal·lacio slapd edt.org
# -------------------------------------------
useradd pere
useradd marta
echo "pere" | passwd --stdin pere
echo "marta" | passwd --stdin marta
cp ipop3 /etc/xinetd.d
cp ipop3s /etc/xinetd.d

