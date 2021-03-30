Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.886.1617121104280492206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 09:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDUPRulx;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id x9so12269174qto.8;
        Tue, 30 Mar 2021 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=hYnOGHTVAkTiA5SZ7CJ29lyEmltF8SgGXiO9poOdGP0=;
        b=WDUPRulxbryHg26bloBOdkjZYMtGMcFqr/2XMQSNaYCVy+pj5OmhQmGMWmDV4Zj+Kk
         cOpLvkTB+U4/SOwOlgB1PqfomPM6CA18prH3PlV7QuGSiuaSWASnDqqBJu8R71qPGWNX
         +GbMq0EarpWvAXoy6PQJo2sr56/GE9G+qfpB2t3dMy60832DvzvnmrF7P+TkjENVJoaV
         FxBk15gnOI6t4TdGKmEkGolYSmNwSpQyu0B5/9tepYt+oS02EazoSlY0n7zeQXJvy/lI
         buwaXOFRtazJQlL3z8WPcFJvn9JQyHDlvLlVQZqI1EkJlIn8hqdsQ9noBvm0nvdOaZo6
         B13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=hYnOGHTVAkTiA5SZ7CJ29lyEmltF8SgGXiO9poOdGP0=;
        b=aq8Fbb+ymx1j9oaT5dkgzxn242qGwu+JPbr1BKEOpctOyy/Nd8VQn5OTYGogIVvihl
         4qRW/0Sp9Dxk8TPtYnuyGkdfTvdAkwtsaQ8a3LjYt9JSDBBlxror1iVgoDI0+gJixQov
         YmSqvyKUUTFtg6cnZLw/hxiHqqh+GqqDxAk975s+PSRcornKDTo808aZa3NMAs9DOIVY
         tw+MDrCN1wH+WDTm1JTYEbehJCIFqNXnRD8Ztb/rjeSL8B7UBV1OR4ZvaIWlyPty3KrV
         5rTBf9K/Iq0tXzObYofrxyEnVbxka9fAYerrm7EdQI4EtdqsIbUSXMGFFCOp7FI1fio8
         Incw==
X-Gm-Message-State: AOAM531eX98VZcVduNyq1E843T/w1kTBM/Tsp2uh/EV/M2Z4Y08JumjR
	WyfXP4TOJUlH6I3WmLsW6hg=
X-Google-Smtp-Source: ABdhPJyozjLF9MSAfpKPIsK91P/EznPdZ+8HlmVP5EjclR+7/gFVkOc06220r8bElBWrY2jfkvVcKQ==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr29033952qtq.39.1617121103347;
        Tue, 30 Mar 2021 09:18:23 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id y13sm13175666qto.39.2021.03.30.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 09:18:22 -0700 (PDT)
Date: Tue, 30 Mar 2021 12:18:20 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-architecture@lists.openembedded.org,
	openembedded-core@lists.openembedded.org,
	automated-testing@yoctoproject.org, yocto-advocacy@yoctoproject.org,
	linux-embedded@vger.kernel.org
Subject: Yocto Project Virtual Summit 2021
Message-ID: <20210330161820.GA35681@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The Yocto Project Summit Planning Committee is happy to announce the
upcoming 3rd Yocto Project Summit to take place Tuesday and Wednesday
May 25-26 2021, virtually.

The 2-day event will run in 2 tracks including a virtual developers meeting,
beginner tutorial sessions, hands-on intermediate instruction, lightning
talks, regular talks, and social events.

The cost for all attendees will be $40USD. The event will run both days from
noon until 8pm GMT. Registration is not yet open but will be shortly, please
watch for further announcements.

The call for papers is now open and will close at 11:59 PM PST on Sunday,
April 25, 2021. To submit a proposal please visit:
	https://pretalx.com/yocto-project-summit-2021/cfp

For more information please visit:
	https://www.yoctoproject.org/yocto-project-virtual-summit-2021/

We look forward to seeing you at the conference!
