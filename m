Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web12.431.1592453522260284870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 21:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [165.84.12.158])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 47DF1A2590
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 16:11:58 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 165.84.12.158) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBNaXNjIGZpeGVz?=
Date: Thu, 18 Jun 2020 16:11:57 +1200
Message-ID: <1750233.tdWV9SEqCh@linc>
In-Reply-To: <20200618040225.20804.60319@do>
References: <cover.1592452323.git.paul.eggleton@linux.microsoft.com> <20200618040225.20804.60319@do>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 18 June 2020 16:02:25 NZST Patchwork wrote:
> * Issue             Added patch file is missing Upstream-Status in the
> header [test_upstream_status_presence_format]

Oops, typo - I have fixed the patch header and pushed the branch again.

Paul



