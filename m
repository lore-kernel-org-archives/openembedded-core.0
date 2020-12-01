Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.533.1606849157809092629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:58796 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kkArr-00044d-V7; Tue, 01 Dec 2020 13:59:16 -0500
Date: Tue, 1 Dec 2020 13:59:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Steve Sakoman <steve@sakoman.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 04/16] roofs_*.bbclass: fix missing vardeps for do_rootfs
In-Reply-To: <5ebd147ecb59a8b3b9919c5c96ebc1dd66fefa36.1606848593.git.steve@sakoman.com>
Message-ID: <f9fbab0-c335-e2c-fcc7-1aa40259d1@crashcourse.ca>
References: <cover.1606848593.git.steve@sakoman.com> <5ebd147ecb59a8b3b9919c5c96ebc1dd66fefa36.1606848593.git.steve@sakoman.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  "roofs_*.bbclass"

rday
