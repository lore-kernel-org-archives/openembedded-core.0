Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDZzM-0002Jf-5y
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 13:27:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDZqb-0001m3-5J; Fri, 30 Mar 2012 07:18:25 -0400
Date: Fri, 30 Mar 2012 07:18:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <4168578.1W8W6pNbK1@helios>
Message-ID: <alpine.DEB.2.02.1203300715120.4848@oneiric>
References: <alpine.DEB.2.02.1203300627340.32185@oneiric>
	<4168578.1W8W6pNbK1@helios>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why i'm being so annoyingly pedantic about nitpicky details
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 11:27:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 30 Mar 2012, Paul Eggleton wrote:

> On Friday 30 March 2012 06:31:39 Robert P. J. Day wrote:
> >   i realize many of my questions are and will be spectacularly
> > nitpicky but the motivation here is that i and a buddy of mine
> > from wind river are going to be submitting a proposal to this
> > year's ottawa linux symposium for a 1/2-day tutorial on
> > OE/bitbake/yocto, so i want to make absolutely sure i'm clear on
> > the fundamentals and can explain the contents and mechanics of any
> > part of OE.  which means i have a lot of work to do in the next
> > little while.
> >
> >   in other words, there will be more pedantry, but the end result
> > will be released as cc-by-sa, so consider it an investment. :-)
>
> I would say please don't stop doing what you're doing. We may sound
> impatient in our replies sometimes but I think what you are doing is
> really valuable - there are some inconsistencies in our
> documentation and our metadata and we ought to get them all ironed
> out.

  i *think* what i'm trying to do is figure out best practices.  it's
obvious that OE-core has evolved and while newer and better constructs
were introduced, the "old" way of doing things stuck around simply
because it still worked fine, which is entirely understandable.

  but if i want to do a good job in this tutorial, i really want to
emphasize the *current* way of doing things, even if one still runs
across lots of historical code in the source.

  couple actual examples and more questions coming shortly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


