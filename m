Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C7070780CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 81ADD209B8;
	Fri, 28 Jul 2017 20:05:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id itYd0P0DL28O; Fri, 28 Jul 2017 20:05:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5652220821;
	Fri, 28 Jul 2017 20:05:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D6320162549; Fri, 28 Jul 2017 16:05:52 -0400 (EDT)
Date: Fri, 28 Jul 2017 16:05:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170728200552.GU26405@denix.org>
References: <1501267767-109163-1-git-send-email-denis@denix.org>
	<CAMKF1srgt4uLiwr3UjHjEG+ytPTBe0URvd-jboFw=N5gLkU_wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srgt4uLiwr3UjHjEG+ytPTBe0URvd-jboFw=N5gLkU_wA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf: fix typo in SUMMARY
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
X-List-Received-Date: Fri, 28 Jul 2017 20:05:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2017 at 11:56:55AM -0700, Khem Raj wrote:
> On Fri, Jul 28, 2017 at 11:49 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-devtools/autoconf/autoconf.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
> > index f1b2dfc..ea62df8 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf.inc
> > +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> > @@ -1,4 +1,4 @@
> > -SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
> > +SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
>                                                              -----^------
> there is a grammatical issue too :)

Sorry, I don't follow...


> >  DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
> >  configure software source code packages. Autoconf creates a configuration script for a package from a template \
> >  file that lists the operating system features that the package can use, in the form of M4 macro calls."
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

