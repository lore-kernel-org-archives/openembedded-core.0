Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SrBxb-00046f-Fr
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:53:23 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56200 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SrBme-0002Kh-Uz for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 13:42:05 -0400
Date: Tue, 17 Jul 2012 13:41:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <50059D18.2050100@windriver.com>
Message-ID: <alpine.DEB.2.02.1207171340560.7173@oneiric>
References: <alpine.DEB.2.02.1207171053310.6162@oneiric>
	<50059D18.2050100@windriver.com>
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
Subject: Re: is there really a "fakeroot" task flag?
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
X-List-Received-Date: Tue, 17 Jul 2012 17:53:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 17 Jul 2012, Mark Hatle wrote:

> On 7/17/12 9:55 AM, Robert P. J. Day wrote:
> >
> >    perusing bitbake user manual and in section 2.1.18, "Task Flags",
> > there's mention of "fakeroot".  that's not really a task flag, is it?
> > i thought that that's (now?) a keyword that's used to define a task
> > with that property.
> >
> >    is that line in the user manual incorrect?
>
> My understanding is this is a key word that gets turned into a task
> flag.

  ok, that makes sense.  that's just not clear from that section in
the bitbake manual.  are there any other special cases like that?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


