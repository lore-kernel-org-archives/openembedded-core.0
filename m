Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SBnIP-0007SK-7H
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 15:15:45 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SBn9k-0003Cg-3A for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 09:06:48 -0400
Date: Sun, 25 Mar 2012 09:06:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332680241.28414.83.camel@ted>
Message-ID: <alpine.DEB.2.02.1203250906080.19134@oneiric>
References: <alpine.DEB.2.02.1203250742270.21548@oneiric>
	<1332680241.28414.83.camel@ted>
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
Subject: Re: [PATCH] Various typoes fixed, all comments or output strings.
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
X-List-Received-Date: Sun, 25 Mar 2012 13:15:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 25 Mar 2012, Richard Purdie wrote:

> On Sun, 2012-03-25 at 07:46 -0400, Robert P. J. Day wrote:
> > Typoes fixed: "enviroment", "editted", "spliting", "scheulder".
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
>
> Just for reference we can't patch .patch files like this. In the case of
> a previous submission against taglib, it broke the build as the patch no
> longer applied (the typo was in upstream).
>
> I'm therefore happy to take these changes but we need to be careful
> they're limited to places that won't cause build failures. In this
> series, I'd prefer not to take the bison/flac changes since those are
> upstream issues which should get fixed at source.

  ah, i hadn't noticed that.  feel free to knock out whatever is
inconvenient, and i'll watch more carefully for that in the future.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


