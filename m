Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SG3md-0006Zq-E2 for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 09:40:35 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SG3di-0001OD-VE for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 09:31:24 +0200
Received: from ABTS-KK-dynamic-011.47.172.122.airtelbroadband.in
	([ABTS-KK-dynamic-011.47.172.122.airtelbroadband.in])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 09:31:22 +0200
Received: from surendra.dhobalelinux by
	ABTS-KK-dynamic-011.47.172.122.airtelbroadband.in with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 09:31:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: surendra dhobale <surendra.dhobalelinux@gmail.com>
Date: Fri, 6 Apr 2012 07:31:13 +0000 (UTC)
Message-ID: <loom.20120406T092958-125@post.gmane.org>
References: <loom.20120404T082801-1@post.gmane.org>
	<20120404091834.367f9617@eb-e6520>
	<CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
	<20120404094728.01c3ba51@eb-e6520> <1333539066.11559.36.camel@ted>
	<20120404133732.16bf66fb@eb-e6520>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 122.172.47.11 (Mozilla/5.0 (X11; Ubuntu; Linux i686;
	rv:11.0) Gecko/20100101 Firefox/11.0)
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Fri, 06 Apr 2012 07:40:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Eric Bénard <eric@...> writes:

> 
> Hi Richard,
> 
> Le Wed, 04 Apr 2012 12:31:06 +0100,
> Richard Purdie <richard.purdie@...> a écrit :
> > Eric: You should probably look at the externalsrc.bbclass since it gives
> > you a way to do things like this yet also build and package it with the
> > usual build system:
> > 
> >
http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.html#ref-classes-externalsrc
> > 
> yes, this can be very usefull when you need packaging, but for
> bootloader and kernel development, using the build system during
> development doesn't bring any added value IMHO.
> 
> Eric
> 

Hi Richard,Eric and all
  For your kindly quick support.


Surendra..





