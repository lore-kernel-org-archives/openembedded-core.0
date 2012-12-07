Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Th1eb-0004bM-Iu
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 18:24:01 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:46847 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Th1Qd-0006Mg-8n; Fri, 07 Dec 2012 12:09:35 -0500
Date: Fri, 7 Dec 2012 12:09:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1354896691.12928.34.camel@ted>
Message-ID: <alpine.DEB.2.02.1212071204470.11696@oneiric>
References: <alpine.DEB.2.02.1212061522350.31684@oneiric>
	<1354835735.12928.15.camel@ted>
	<alpine.DEB.2.02.1212061818500.3731@oneiric>
	<1354896691.12928.34.camel@ted>
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
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what exactly is the proper way to use FILESEXTRAPATHS?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 17:24:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 7 Dec 2012, Richard Purdie wrote:

> Scott: Looks like we need to tweak the manual in this location. Could
> you open a bug or otherwise track this please?

  have i written anything abysmally stupid here so far?

http://www.crashcourse.ca/wiki/index.php/FILESEXTRAPATHS_and_bbappend_files

i really like to use live examples from the source to explain my
points.

  a bit more coming for that page ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


