Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.13420.1620406694892612913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 09:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:33926 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lf3np-0008Oe-Ip; Fri, 07 May 2021 12:58:13 -0400
Date: Fri, 7 May 2021 12:58:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] SDK question: does "-c populate_sdk" build SDK based on entire image?
In-Reply-To: <CAJ86T=VuYu-OaB_SghE6+9KYPOjnKwtVmRjT1j8jBQO+H+6D7w@mail.gmail.com>
Message-ID: <1b7e418a-9ab4-4a3e-d68b-fb75b46bf974@crashcourse.ca>
References: <36cf577f-e2e2-4c58-5cb5-37eafa42b266@crashcourse.ca> <20210507132101.f37cq2j6yjbe7otb@qschulz> <9874edc2-b8ff-6b82-4f8d-9f0cfb0ef4c@crashcourse.ca> <CAJ86T=VuYu-OaB_SghE6+9KYPOjnKwtVmRjT1j8jBQO+H+6D7w@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Fri, 7 May 2021, Andre McCurdy wrote:

> Didn't we discuss exactly this (ie the difference between a pure SDK
> recipe such as meta-toolchain and the populate_sdk task of an image
> recipe) a couple of weeks ago?

  yes, i just got confused as i was digging into eSDK and mixed the
two. it's been a long week.

rday
