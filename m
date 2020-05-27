Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.7448.1590590338809807558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 07:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:48626 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jdxCr-00Fk4O-IK
	for openembedded-core@lists.openembedded.org; Wed, 27 May 2020 10:38:58 -0400
Date: Wed, 27 May 2020 10:38:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
In-Reply-To: <1612E913BFE72856.28111@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2005271038300.2347288@localhost.localdomain>
References: <1612E913BFE72856.28111@lists.openembedded.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 May 2020, Robert P. J. Day wrote:

>
> Variable DEPLOY_DIR_TOOLS was introduced in 2007:
>
>   commit f751a20152c651a33f08ceda0502fa1d4f11c005
>   Author: Richard Purdie <richard@openedhand.com>
>   Date:   Wed Aug 8 21:02:39 2007 +0000
>
>       bitbake.conf: Sync with OE.dev
>

  never mind, failed to look in meta-openembedded layer, my bad.

rday
