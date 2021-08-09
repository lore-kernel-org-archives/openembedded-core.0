Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.29698.1628544208155635395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 14:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=42960 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mDCk2-0003mZ-4A
	for openembedded-core@lists.openembedded.org; Mon, 09 Aug 2021 17:23:26 -0400
Received: from [174.114.57.56] ([174.114.57.56]) by crashcourse.ca (Horde
 Framework) with HTTPS; Mon, 09 Aug 2021 17:23:25 -0400
Date: Mon, 09 Aug 2021 17:23:25 -0400
Message-ID: <20210809172325.Horde.owcQVJtv5qIGBd0Lr7-Hlyb@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: ntpsec on OE/YP?
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


colleague asks about the state of ntpsec (https://www.ntpsec.org/)
on OE/YP, a quick search does not show official support of any kind,
any pointers?

rday

