Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6B76D606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 09:00:04 +0000 (UTC)
Received: from [99.240.204.5] (port=50056 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPSOQ-00085E-AM; Sun, 22 Feb 2015 04:00:02 -0500
Date: Sun, 22 Feb 2015 04:00:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1424595258.11836.72.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1502220359310.14717@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424522044.11836.70.camel@linuxfoundation.org>
	<alpine.LFD.2.11.1502220334160.12252@localhost>
	<1424595258.11836.72.camel@linuxfoundation.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: questions about WORKDIR and S usage and files/ stuff
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Feb 2015 09:00:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 22 Feb 2015, Richard Purdie wrote:

> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=4eb3db9a2ca8eaff64b64b8f56dac25d4734571c
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cf72ede74d35746a10d0708942287548f9c72f30
>
> and some of the surrounding patches. I'd assumed base-files was part
> of that series, clearly it wasn't but there were many other recipes
> changed at that time.

  ah, there we go, thank you kindly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

