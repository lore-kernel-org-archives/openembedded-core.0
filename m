Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD2471993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 09:52:20 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161024095220777_0484;
	Mon, 24 Oct 2016 09:52:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=38647 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bybvR-0001ij-NT; Mon, 24 Oct 2016 05:52:13 -0400
Date: Mon, 24 Oct 2016 05:51:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
Message-ID: <alpine.LFD.2.20.1610240549440.28159@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Mon, 24 Oct 2016 09:52:21 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Oct 2016, Khem Raj wrote:

... snip ...

> I would recommend to try using eSDK, which can be generated using
> -cpopulate_sdk_ext see
>
> https://wiki.yoctoproject.org/wiki/Application_Development_with_Extensible_SDK

  just reading up on eSDKs now, am i correct in assuming that if i
have the time and space to build an eSDK, there is no downside
compared to building a standard SDK? as in, i don't lose anything from
the standard SDK, i just get a richer feature set, etc.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


