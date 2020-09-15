#
# spec file for package ChaosSquirrel
#
# Copyright (c) 2020 ChaosSquirrel Authors
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#
# Please submit bugfixes or comments via GitHub

Name:           ChaosSquirrel
BuildArch:      noarch
Version:        1.0.1
Release:        1%{?dist}
Summary:        Like Netflix's Chaos Monkey, packaged to run standalone.
License:        MIT
URL:            https://github.com/guilt/%{name}
Source0:        https://github.com/guilt/%{name}/archive/v%{version}.tar.gz
%if 0%{?suse_version}
Requires:       bash, coreutils, iproute2, iptables, openssl, procps
%else
Requires:       bash, coreutils, iproute, iproute-tc, iptables, openssl, procps
%endif

%description
Like Netflix's Chaos Monkey, packaged to run standalone.

%prep
%setup -q

%build

%install
   mkdir -p %{buildroot}/usr/local/share/%{name}
   cp -a * %{buildroot}/usr/local/share/%{name}/

%files
   /usr/local/share/ChaosSquirrel
   /usr/local/share/ChaosSquirrel/LICENSE
   /usr/local/share/ChaosSquirrel/README.md
   /usr/local/share/ChaosSquirrel/chaos
   /usr/local/share/ChaosSquirrel/app
   /usr/local/share/ChaosSquirrel/app/killprocesses_app.sh
   /usr/local/share/ChaosSquirrel/app/killprocesses_db.sh
   /usr/local/share/ChaosSquirrel/app/killprocesses_mw.sh
   /usr/local/share/ChaosSquirrel/basic
   /usr/local/share/ChaosSquirrel/basic/burncpu.sh
   /usr/local/share/ChaosSquirrel/basic/burnio.sh
   /usr/local/share/ChaosSquirrel/basic/filldisk.sh
   /usr/local/share/ChaosSquirrel/network
   /usr/local/share/ChaosSquirrel/network/networkcorruption.sh
   /usr/local/share/ChaosSquirrel/network/networkfaildns.sh
   /usr/local/share/ChaosSquirrel/network/networkfailservice.sh
   /usr/local/share/ChaosSquirrel/network/networklatency.sh
   /usr/local/share/ChaosSquirrel/network/networkloss.sh
   /usr/local/share/ChaosSquirrel/network/networknullroute.sh

%post
   ln -sf /usr/local/share/ChaosSquirrel/chaos /usr/local/bin/chaos

%preun
   rm -f /usr/local/bin/chaos

%changelog
