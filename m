Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4A17391A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 10:31:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160805103110756_0486;
	Fri, 05 Aug 2016 10:31:10 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=40546 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVcR3-0005H6-O9; Fri, 05 Aug 2016 06:33:01 -0400
Date: Fri, 5 Aug 2016 06:31:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <57b0c57a-a81c-42fa-0f31-3ea9d2acff56@mlbassoc.com>
Message-ID: <alpine.LFD.2.20.1608050630250.13682@localhost.localdomain>
References: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
	<57b0c57a-a81c-42fa-0f31-3ea9d2acff56@mlbassoc.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: "parted" vs "sfdisk"
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
X-List-Received-Date: Fri, 05 Aug 2016 10:31:23 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2016, Gary Thomas wrote:

> On 2016-08-05 12:19, Robert P. J. Day wrote:
> >
> >   your personal opinions, if you would -- i'm working on some scripts
> > to do automated installs on a target board, currently based on
> > parted, but parted seems a bit dense at times, and awkward, and i'm
> > thinking of switching to sfdisk.
> >
> >   for people who have done this sort of thing, do you have any strong
> > opinions either way of parted versus sfdisk? i realize that's not much
> > to go on, just curious about personal preferences, and why.
>
> As you know, I went the other way - I started with sfdisk and
> I find parted more intuitive and easier to use.  I also think
> it has a better long-term support horizon.

  i figured you'd weigh in on this. :-) i'm going to experiment both
ways for a bit.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


