Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9977E65D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 12:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3C9uuO009813; Mon, 3 Nov 2014 12:09:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sx-88Uc7Y_yN; Mon,  3 Nov 2014 12:09:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3C9qhC009810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 3 Nov 2014 12:09:54 GMT
Message-ID: <1415016627.5111.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 03 Nov 2014 12:10:27 +0000
In-Reply-To: <07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 12:10:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-11-03 at 13:06 +0100, Koen Kooi wrote:
> > Op 3 nov. 2014, om 12:30 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
> > 
> > 
> > On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > Last night I was looking at my "post-1.7" tag and the number of aarch64 patches there.   Kai, did you continue work on that staging branch for all of the aarch64 patches that were being posted?
> > 
> > What does that have to do with this patch?
> > 
> > Kai was collecting patches that were sent to oe-core, and this may have been one of them.
> 
> Is this some new requirement for OE-core patches?

Its someone being helpful and trying to consolidate a topic branch and
test things before it gets merged.

So its not a new requirement but it is helpful and appreciated.

Cheers,

Richard


