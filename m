Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7588.1625391858473752716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id E8C8E38C128F
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] Upgrade status: 2021-07-04
Message-ID: <MADEUP.168E8D48BE72B8C5.2482@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============8085258261498519573=="

--===============8085258261498519573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Recipe upgrade statistics:

    * Succeeded: 13
        iproute2, 5.13.0, Changhyeok Bae <changhyeok.bae@gmail.com>
        update-rc.d, 0.8-new-commits-available, Ross Burton <ross.burton@arm.com>
        python3-hypothesis, 6.14.1, Tim Orling <timothy.t.orling@intel.com>
        python3-packaging, 21.0, Tim Orling <timothy.t.orling@intel.com>
        python3-zipp, 3.5.0, Tim Orling <timothy.t.orling@intel.com>
        iputils, s20200821, Changhyeok Bae <changhyeok.bae@gmail.com>
        libdrm, 2.4.107, Otavio Salvador <otavio.salvador@ossystems.com.br>
        mesa, 21.1.4, Otavio Salvador <otavio.salvador@ossystems.com.br>
        pango, 1.48.7, Ross Burton <ross.burton@arm.com>
        xwayland, 21.1.1.901, Armin Kuster <akuster808@gmail.com>
        hwlatdetect, 2.1, Alexander Kanavin <alex.kanavin@gmail.com>
        gnome-desktop-testing, 2021.1, Ross Burton <ross.burton@arm.com>
        libgit2, 1.1.1, Unassigned <unassigned@yoctoproject.org>
    * Failed (devtool error): 6
        gnu-config, 20210620-new-commits-available, Robert Yang <liezhi.yang@windriver.com>
        python3-iniparse, 0.5, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmail.com>
        texinfo, 6.8, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-samples, git-new-commits-available, Ross Burton <ross.burton@arm.com>
        rt-tests, 2.1, Alexander Kanavin <alex.kanavin@gmail.com>
    * Failed(do_compile): 2
        man-pages, 5.12, Hongxu Jia <hongxu.jia@windriver.com>
        gdbm, 1.20, Alexander Kanavin <alex.kanavin@gmail.com>
    * Failed(other errors): 1
        adwaita-icon-theme, 40.1.1, Ross Burton <ross.burton@arm.com>

    TOTAL: attempted=22 succeeded=13(59.09%) failed=9(40.91%)

Recipe upgrade statistics per Maintainer:

    Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Alexander Kanavin <alex.kanavin: attempted=3 succeeded=1(33.33%) failed=2(66.67%)
    Khem Raj <raj.khem: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Robert Yang <liezhi.yang: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=2(100.00%) failed=0(0.00%)
    Armin Kuster <akuster808: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Anuj Mittal <anuj.mittal: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Ross Burton <ross.burton: attempted=5 succeeded=3(60.00%) failed=2(40.00%)
    Unassigned <unassigned: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Tim Orling <timothy.t.orling: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Hongxu Jia <hongxu.jia: attempted=1 succeeded=0(0.00%) failed=1(100.00%)

--===============8085258261498519573==--
