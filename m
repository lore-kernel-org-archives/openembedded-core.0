Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SlffE-00086p-7k
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 14:23:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:50652 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SlfUa-0006zZ-UN; Mon, 02 Jul 2012 08:12:37 -0400
Date: Mon, 2 Jul 2012 08:12:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2305047.YA09gvIVbH@helios>
Message-ID: <alpine.DEB.2.02.1207020811570.22762@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<1341219932.23146.187.camel@ted>
	<alpine.DEB.2.02.1207020726170.23135@oneiric>
	<2305047.YA09gvIVbH@helios>
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
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Mon, 02 Jul 2012 12:23:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 2 Jul 2012, Paul Eggleton wrote:

> On Monday 02 July 2012 07:29:08 Robert P. J. Day wrote:
> >   oelint.bbclass currently suggests it can be any of "standard",
> > "required", "optional" or "extra".  and perhaps a dumb question -- how
> > are there *two* default values?  not sure what that means.
>
> It's worth pointing out that oelint.bbclass is somewhat out-of-date
> with current practice, so I would take anything you find in it with
> a pinch of salt.

  i was just about to make that observation.  :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


