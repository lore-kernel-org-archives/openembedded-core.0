Return-Path: <pb@pbcl.net>
X-Greylist: delayed 2134 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 May 2014 11:28:07 UTC
Received: from hetzner.pbcl.net (unknown [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3E76601E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 11:28:07 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1WlFkg-0002XE-BL
	for openembedded-core@lists.openembedded.org;
	Fri, 16 May 2014 12:52:34 +0200
Message-ID: <1400237551.5524.18.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 May 2014 11:52:31 +0100
In-Reply-To: <21882547.zdJQee8rlR@peggleto-mobl5.ger.corp.intel.com>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
	<3327056.Df3VZKvVg7@peggleto-mobl5.ger.corp.intel.com>
	<ljlih4$rvg$1@ger.gmane.org>
	<21882547.zdJQee8rlR@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Fri, 2014-05-16 at 11:51 +0100,
	Paul Eggleton wrote: >
	On Monday 28 April 2014 14:45:26 Koen Kooi wrote: > > Paul Eggleton
	schreef
	op 28-04-14 13:08: > > > OK then, how about this instead: > > > > > > 1)
	Ensure the "openembedded-core" repository is kept up-to-date > > > > >
	> 2)
	Add a "meta-openembedded" repository and ensure it is kept up-to-date >
	>
	> > > > 3) Add a warning to the description for the contracted name
	repositories
	> > > that the fully-named repositories should be used instead,
	so we can
	> > > eventually drop them > > > > > > 4) Change documentation /
	scripts
	to match #3 > > > > Sounds like a good plan to me! > > OK,
	so who will do this then (whoever has access)? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: Re: [oe] OE Github repositories
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
X-List-Received-Date: Fri, 16 May 2014 11:28:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-16 at 11:51 +0100, Paul Eggleton wrote:
> On Monday 28 April 2014 14:45:26 Koen Kooi wrote:
> > Paul Eggleton schreef op 28-04-14 13:08:
> > > OK then, how about this instead:
> > > 
> > > 1) Ensure the "openembedded-core" repository is kept up-to-date
> > > 
> > > 2) Add a "meta-openembedded" repository and ensure it is kept up-to-date
> > > 
> > > 3) Add a warning to the description for the contracted name repositories
> > > that the fully-named repositories should be used instead, so we can
> > > eventually drop them
> > > 
> > > 4) Change documentation / scripts to match #3
> > 
> > Sounds like a good plan to me!
> 
> OK, so who will do this then (whoever has access)?

I can do it if you like.

p.



