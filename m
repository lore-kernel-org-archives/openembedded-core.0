Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.236.1587499815919622481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 13:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from auh.yoctoproject.org (unknown [172.29.10.30])
	by mail.yoctoproject.org (Postfix) with ESMTP id C247138C13EC
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 13:10:15 -0700 (PDT)
Received: by auh.yoctoproject.org (Postfix, from userid 112)
	id AC4DE440001; Tue, 21 Apr 2020 13:10:15 -0700 (PDT)
Subject: AUH monthly stats, manual resend
To: <openembedded-core@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Message-Id: <20200421201015.AC4DE440001@auh.yoctoproject.org>
Date: Tue, 21 Apr 2020 13:10:15 -0700 (PDT)
From: auh@auh.yoctoproject.org

Recipe upgrade statistics:

    * Failed (devtool error): 38
        build-compare, 2019.08.14-new-commits-available, Paul Eggleton <paul.eggleton@linux.intel.com>
        python3-gitdb, 4.0.2, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        systemd-boot, 245.4, Chen Qi <Qi.Chen@windriver.com>
        automake, 1.16.2, Robert Yang <liezhi.yang@windriver.com>
        ovmf, edk2-stable202002, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
        coreutils, 8.32, Chen Qi <Qi.Chen@windriver.com>
        bind, 9.16.2, Armin Kuster <akuster808@gmail.com>
        libdnf, 0.47.0, Alexander Kanavin <alex.kanavin@gmail.com>
        libva-utils, 2.7.1, Anuj Mittal <anuj.mittal@intel.com>
        gobject-introspection, 1.64.1, Alexander Kanavin <alex.kanavin@gmail.com>
        perl, 5.30.2, Alexander Kanavin <alex.kanavin@gmail.com>
        libevdev, 1.9.0, Anuj Mittal <anuj.mittal@intel.com>
        libyaml, 0.2.3, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-numpy, 1.18.2, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        ghostscript, 9.52, Hongxu Jia <hongxu.jia@windriver.com>
        gettext, 0.20.2, Robert Yang <liezhi.yang@windriver.com>
        rpm, 4.15.1, Mark Hatle <mark.hatle@windriver.com>
        alsa-topology-conf, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        e2fsprogs, 1.45.6, Robert Yang <liezhi.yang@windriver.com>
        alsa-lib, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        xcb-proto, 1.14, Armin Kuster <akuster808@gmail.com>
        libxcb, 1.14, Armin Kuster <akuster808@gmail.com>
        llvm, 10.0.0, Khem Raj <raj.khem@gmail.com>
        libdrm, 2.4.101, Otavio Salvador <otavio.salvador@ossystems.com.br>
        rt-tests, 1.8, Alexander Kanavin <alex.kanavin@gmail.com>
        sysklogd, 2.1.2, Chen Qi <Qi.Chen@windriver.com>
        apt, 2.0.2, Aníbal Limón <limon.anibal@gmail.com>
        webkitgtk, 2.28.1, Alexander Kanavin <alex.kanavin@gmail.com>
        mc, 4.8.24, Ross Burton <ross.burton@intel.com>
        lttng-tools, 2.12.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        alsa-ucm-conf, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        meson, 0.54.0rc1, Alexander Kanavin <alex.kanavin@gmail.com>
        jquery, 3.5.0, Joshua Watt <JPEWhacker@gmail.com>
        cmake, 3.17.1, Pascal Bach <pascal.bach@siemens.com>
        logrotate, 3.16.0, Yi Zhao <yi.zhao@windriver.com>
        glib-2.0, 2.64.2, Anuj Mittal <anuj.mittal@intel.com>
        ppp, 2.4.8, Hongxu Jia <hongxu.jia@windriver.com>
        kmscube, git-new-commits-available, Carlos Rafael Giani <dv@pseudoterminal.org>
    * Failed(do_compile): 32
        avahi-ui, 0.8, Yi Zhao <yi.zhao@windriver.com>
        xkeyboard-config, 2.29, Armin Kuster <akuster808@gmail.com>
        go, 1.14.2, Khem Raj <raj.khem@gmail.com>
        strace, 5.6, Robert Yang <liezhi.yang@windriver.com>
        gtk+3, 3.24.18, Ross Burton <ross.burton@intel.com>
        git, 2.26.1, Robert Yang <liezhi.yang@windriver.com>
        stress-ng, 0.11.07, Anuj Mittal <anuj.mittal@intel.com>
        rpcsvc-proto, 1.4.1, Khem Raj <raj.khem@gmail.com>
        pulseaudio, 13.99.1, Tanu Kaskinen <tanuk@iki.fi>
        epiphany, 3.36.1, Alexander Kanavin <alex.kanavin@gmail.com>
        libnotify, 0.7.9, Anuj Mittal <anuj.mittal@intel.com>
        alsa-utils, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        libunwind, 1.4.0, Bruce Ashfield <bruce.ashfield@gmail.com>
        avahi, 0.8, Yi Zhao <yi.zhao@windriver.com>
        wpebackend-fdo, 1.6.0, Alexander Kanavin <alex.kanavin@gmail.com>
        vulkan-headers, 1.2.135.0, Anuj Mittal <anuj.mittal@intel.com>
        glib-networking, 2.64.2, Anuj Mittal <anuj.mittal@intel.com>
        elfutils, 0.179, Hongxu Jia <hongxu.jia@windriver.com>
        libcap, 2.33, Yi Zhao <yi.zhao@windriver.com>
        connman, 1.38, Changhyeok Bae <changhyeok.bae@gmail.com>
        libxcrypt, 4.4.16, Khem Raj <raj.khem@gmail.com>
        gcr, 3.36.0, Alexander Kanavin <alex.kanavin@gmail.com>
        clutter-1.0, 1.26.4, Ross Burton <ross.burton@intel.com>
        gptfdisk, 1.0.5, Alexander Kanavin <alex.kanavin@gmail.com>
        go-runtime, 1.14.2, Khem Raj <raj.khem@gmail.com>
        mesa, 20.0.4, Otavio Salvador <otavio.salvador@ossystems.com.br>
        vulkan-loader, 1.2.135.0, Anuj Mittal <anuj.mittal@intel.com>
        vulkan-demos, git-new-commits-available, Ross Burton <ross.burton@intel.com>
        vte, 0.60.1, Anuj Mittal <anuj.mittal@intel.com>
        rng-tools, 6.10, Anuj Mittal <anuj.mittal@intel.com>
        u-boot, 2020.04, Marek Vasut <marek.vasut@gmail.com>
        vulkan-tools, 1.2.135.0, Anuj Mittal <anuj.mittal@intel.com>
    * Succeeded: 65
        ruby, 2.7.1, Ross Burton <ross.burton@intel.com>
        man-pages, 5.06, Hongxu Jia <hongxu.jia@windriver.com>
        piglit, 1.0-new-commits-available, Ross Burton <ross.burton@intel.com>
        asciidoc, 8.6.10, Yi Zhao <yi.zhao@windriver.com>
        python3-testtools, 2.4.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        libusb1, 1.0.23, Anuj Mittal <anuj.mittal@intel.com>
        atk, 2.36.0, Tim Orling <timothy.t.orling@linux.intel.com>
        adwaita-icon-theme, 3.36.0, Ross Burton <ross.burton@intel.com>
        python3-smmap, 3.0.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        vala, 0.48.3, Alexander Kanavin <alex.kanavin@gmail.com>
        librepo, 1.11.3, Alexander Kanavin <alex.kanavin@gmail.com>
        lttng-modules, 2.12.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        hwlatdetect, 1.8, Alexander Kanavin <alex.kanavin@gmail.com>
        msmtp, 1.8.8, Alexander Kanavin <alex.kanavin@gmail.com>
        createrepo-c, 0.15.9, Alexander Kanavin <alex.kanavin@gmail.com>
        xz, 5.2.5, Denys Dmytriyenko <denys@ti.com>
        at-spi2-core, 2.36.0, Tim Orling <timothy.t.orling@linux.intel.com>
        python3-subunit, 1.4.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        libxcrypt-compat, 4.4.16, Khem Raj <raj.khem@gmail.com>
        acpica, 20200326, Ross Burton <ross.burton@intel.com>
        libva, 2.7.0, Anuj Mittal <anuj.mittal@intel.com>
        python3-setuptools, 46.1.3, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        cogl-1.0, 1.22.6, Ross Burton <ross.burton@intel.com>
        ccache, 3.7.9, Robert Yang <liezhi.yang@windriver.com>
        man-db, 2.9.1, Hongxu Jia <hongxu.jia@windriver.com>
        gawk, 5.1.0, Chen Qi <Qi.Chen@windriver.com>
        libdazzle, 3.36.0, Alexander Kanavin <alex.kanavin@gmail.com>
        sudo, 1.8.31p1, Chen Qi <Qi.Chen@windriver.com>
        python3-mako, 1.1.2, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        bison, 3.5.4, Chen Qi <Qi.Chen@windriver.com>
        btrfs-tools, 5.6, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-pygobject, 3.36.0, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pygments, 2.6.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        u-boot-tools, 2020.04, Marek Vasut <marek.vasut@gmail.com>
        x264, r2991-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>
        diffoscope, 141, Joshua Watt <JPEWhacker@gmail.com>
        alsa-plugins, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        dnf, 4.2.21, Alexander Kanavin <alex.kanavin@gmail.com>
        at-spi2-atk, 2.34.2, Tim Orling <timothy.t.orling@linux.intel.com>
        libical, 3.0.8, Ross Burton <ross.burton@intel.com>
        ell, 0.31, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        python3-pbr, 5.4.5, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        kmod, 27, Chen Qi <Qi.Chen@windriver.com>
        libsolv, 0.7.11, Anuj Mittal <anuj.mittal@intel.com>
        python3-git, 3.1.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        gnutls, 3.6.13, Armin Kuster <akuster808@gmail.com>
        libtirpc, 1.2.6, Anuj Mittal <anuj.mittal@intel.com>
        libcomps, 0.1.15, Alexander Kanavin <alex.kanavin@gmail.com>
        mtools, 4.0.24, Anuj Mittal <anuj.mittal@intel.com>
        libwpe, 1.6.0, Alexander Kanavin <alex.kanavin@gmail.com>
        python3-pycairo, 1.19.1, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
        dtc, 1.6.0, Alexander Kanavin <alex.kanavin@gmail.com>
        lttng-ust, 2.12.0, Richard Purdie <richard.purdie@linuxfoundation.org>
        dpkg, 1.20.0, Aníbal Limón <limon.anibal@gmail.com>
        libinput, 1.15.5, Ross Burton <ross.burton@intel.com>
        libsecret, 0.20.3, Alexander Kanavin <alex.kanavin@gmail.com>
        alsa-tools, 1.2.2, Tanu Kaskinen <tanuk@iki.fi>
        libsoup-2.4, 2.70.0, Anuj Mittal <anuj.mittal@intel.com>
        less, 557, Yi Zhao <yi.zhao@windriver.com>
        xorgproto, 2020.1, Armin Kuster <akuster808@gmail.com>
        xserver-xorg, 1.20.8, Armin Kuster <akuster808@gmail.com>
        iproute2, 5.6.0, Changhyeok Bae <changhyeok.bae@gmail.com>
        liburcu, 0.12.0, Alexander Kanavin <alex.kanavin@gmail.com>
        ed, 1.16, Alexander Kanavin <alex.kanavin@gmail.com>

    TOTAL: attempted=135 succeeded=65(48.15%) failed=70(51.85%)

Recipe upgrade statistics per Maintainer:

    Alexander Kanavin <alex.kanavin: attempted=25 succeeded=14(56.00%) failed=11(44.00%)
    Denys Dmytriyenko <denys: attempted=1 succeeded=1(100.00%) failed=0(0.00%)
    Mark Hatle <mark.hatle: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Joshua Watt <JPEWhacker: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Otavio Salvador <otavio.salvador: attempted=2 succeeded=0(0.00%) failed=2(100.00%)
    Changhyeok Bae <changhyeok.bae: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Richard Purdie <richard.purdie: attempted=3 succeeded=2(66.67%) failed=1(33.33%)
    Carlos Rafael Giani <dv: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Paul Eggleton <paul.eggleton: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Armin Kuster <akuster808: attempted=7 succeeded=3(42.86%) failed=4(57.14%)
    Pascal Bach <pascal.bach: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Oleksandr Kravchuk <open.source: attempted=13 succeeded=11(84.62%) failed=2(15.38%)
    Yi Zhao <yi.zhao: attempted=6 succeeded=2(33.33%) failed=4(66.67%)
    Ricardo Neri <ricardo.neri-calderon: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Marek Vasut <marek.vasut: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Anuj Mittal <anuj.mittal: attempted=19 succeeded=8(42.11%) failed=11(57.89%)
    Ross Burton <ross.burton: attempted=11 succeeded=7(63.64%) failed=4(36.36%)
    Bruce Ashfield <bruce.ashfield: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
    Aníbal Limón <limon.anibal: attempted=2 succeeded=1(50.00%) failed=1(50.00%)
    Tim Orling <timothy.t.orling: attempted=3 succeeded=3(100.00%) failed=0(0.00%)
    Tanu Kaskinen <tanuk: attempted=7 succeeded=2(28.57%) failed=5(71.43%)
    Robert Yang <liezhi.yang: attempted=6 succeeded=1(16.67%) failed=5(83.33%)
    Khem Raj <raj.khem: attempted=6 succeeded=1(16.67%) failed=5(83.33%)
    Chen Qi <Qi.Chen: attempted=7 succeeded=4(57.14%) failed=3(42.86%)
    Hongxu Jia <hongxu.jia: attempted=5 succeeded=2(40.00%) failed=3(60.00%)
