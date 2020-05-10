Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.12054.1589103114130376707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 02:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: g0hl1n.net, ip: 81.19.156.191, mailfrom: dev+oe@g0hl1n.net)
Received: from brokenbit (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id 777436C20001;
	Sun, 10 May 2020 11:31:50 +0200 (CEST)
Date: Sun, 10 May 2020 11:31:48 +0200
From: "Richard Leitner" <ml+oe@g0hl1n.net>
To: openembedded-core@lists.openembedded.org
Cc: richard.leitner@skidata.com, richard.purdie@linuxfoundation.org,
	bunk@stusta.de
Subject: Pending GCC 10 -fno-common fixes
Message-ID: <20200510093148.GA3697@brokenbit>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
just a friendly reminder for my pending GCC 10 support patches:

https://patchwork.openembedded.org/patch/172350/
https://patchwork.openembedded.org/patch/172351/
https://patchwork.openembedded.org/patch/172357/
https://patchwork.openembedded.org/patch/172358/

With these patches applied building on my Fedora 32 hosts works again.

If there are any open issues or things which needs to be discussed on the
proposed patches please come back to me!

Thanks & regards;rl
