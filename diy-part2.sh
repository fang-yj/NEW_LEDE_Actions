#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 恢复首页显示
sed -i 's/^#\(.*mwan.htm\)/\1/' package/lean/default-settings/files/zzz-default-settings
sed -i 's/^#\(.*upnp.htm\)/\1/' package/lean/default-settings/files/zzz-default-settings
sed -i 's/^#\(.*ddns.htm\)/\1/' package/lean/default-settings/files/zzz-default-settings

# 日期
sed -i 's/os.date(/&"%Y-%m-%d %H:%M:%S"/' package/lean/autocore/files/x86/index.htm

# 把密码改成空
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


#添加额外软件包
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/applications/luci-app-smartdns

# 恢复主机型号
sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore


#升级smartdns版本
#sed -i 's/2018-2020/2018-2022/g' feeds/packages/net/smartdns/Makefile
#sed -i 's/1.2021.35/1.2022.38/g' feeds/packages/net/smartdns/Makefile
#sed -i 's/5a2559f0648198c290bb8839b9f6a0adab8ebcdc/1991a0b102e891f149647b162897bf4403f8f66c/g' feeds/packages/net/smartdns/Makefile
#sed -i 's/29f0aa9eea2f98765be5377266c4b0c51a089ec132d51cd07a6adaec157f3b4b/8017fd769d8128af5b54ce7935f4801cc798c6608dd54fa3e3a7d230ec8f1b64/' feeds/packages/net/smartdns/Makefile
#sed -i 's/^PKG_MIRROR_HASH/#&/' feeds/packages/net/smartdns/Makefile
