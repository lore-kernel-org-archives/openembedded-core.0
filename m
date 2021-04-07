Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web09.13156.1617826064247428901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 13:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bvs5DoDp;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id e8so20769612iok.5;
        Wed, 07 Apr 2021 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XGaENESI2XfSMzRuu5h2NLMo1s/wV090jzAHbm9+pCA=;
        b=Bvs5DoDp6A0Qr9deAmndyQ7srmRCUtP5+QKDdQ851tV1eXtda9wRmVk4Nus3yLGWaH
         2zru3mG5Kjay9NU5kQ6ujXOFwAmlwvL77GiU8ZRfEOYdjLKiUlvBDyjXUooCQ4dxlCN/
         BgM2rpfwMYqCk+/cVdMePUbVswh77pmRF4h8gilrMa/vvMpozJ6nhSdcUDHLhYIUPj3q
         oX58YKkW+L+jNXsZ6dbC11vr71YHJsbTK1BnkVDrMKBYMdUjJC2s5v/4V8nKh2Z5QMOM
         Iwf2I2LHB+fg9fu59vnWv9XuFEUagS2NwO/6Aqo7iWRw02ksLPlTakUXrtQtQNoigwA6
         +50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XGaENESI2XfSMzRuu5h2NLMo1s/wV090jzAHbm9+pCA=;
        b=un2JjM4F2YwkckzmqIACIiMxhABwu2dpU3e0uFsFiXMswILR9DT4JGtTMxMUclD3p+
         otY085e2Pi4L9xUfpGcSRiD5UmUsPi3aSA+BCTuYlCrh2fDO1mxqReHneByJZmZNx1QK
         Uhzv+8iePFQsjGirgS43uN6EAkJFaqkcpYDqYYpdOwPmviweUIZa4FIczexBt55NBiHE
         OJVDfJCo4EJyu+t//xkk87y1O9cnMmzyNZz6eVRECKRbP1Va7F3pBinXHwCaPt50dOoM
         znQcuWcvylHCmX15zX8EwWgyZDyMAcZ1+gLC5w5mC8nEC0YIaW6/aXqDHRWdnmZcrqdX
         2jIA==
X-Gm-Message-State: AOAM530LhOoPPrrrmfd3Nx+tAF+xsaojmtoGRbrAWj6HlHVLlPVZU6cD
	JmmkPYdNBk8HjWGA1tn5PGtXeUpPJlxcp/5ZLb8UjCA1/8Q=
X-Google-Smtp-Source: ABdhPJwI9X9zuhSioe+zRionr9pfVDE12KYBc470b26vJbLb4514izniwr/Cjnxh1kHm2rMwlrzA2A7v/OWFzyMGSLI=
X-Received: by 2002:a5e:8d09:: with SMTP id m9mr3741279ioj.29.1617826063418;
 Wed, 07 Apr 2021 13:07:43 -0700 (PDT)
MIME-Version: 1.0
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Wed, 7 Apr 2021 16:07:31 -0400
Message-ID: <CAHUNapQ4DGnGBQUOOrVL6ygVqOzoMVkxNEC19FDRk_C8GgteLg@mail.gmail.com>
Subject: Yocto Project Summit - registration open
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	automated-testing@yoctoproject.org, yocto@lists.yoctoproject.org, 
	yocto-advocacy@yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Registration is now open for the upcoming Yocto Project Summit!!

details: https://www.yoctoproject.org/yocto-project-virtual-summit-2021/
CfP: https://pretalx.com/yocto-project-summit-2021/cfp
registration: https://www.cvent.com/d/yjq4dr/4W?ct=868bfddd-ca91-46bb-aaa5-62d2b61b2501

PS: Don't forget to get in your talk proposals! The CfP closes April 25th
