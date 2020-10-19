Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web09.6100.1603142183218493254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 5ED67A429C
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 10:16:19 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 0/2] buildhistory: record SRC_URI
Date: Tue, 20 Oct 2020 10:16:17 +1300
Message-ID: <2298543.jE0xQCEvom@linc>
In-Reply-To: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 19 October 2020 17:03:55 NZDT Paul Eggleton wrote:
> Please review the following changes for suitability for inclusion. If you
> have any objections or suggestions for improvement, please respond to the
> patches. If you agree with the changes, please provide your Acked-by.

Hmm, this should not have been RFC. Consider this a regular patch series.

Thanks
Paul


