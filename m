Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qbt7g-00012G-TC for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:40:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbt48-00015n-2P
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:36:21 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E0A7159.4020003@gmail.com>
References: <1309188248.21613.325.camel@phil-desktop>
	<4E0A7159.4020003@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 12:36:13 +0100
Message-ID: <1309347373.2551.26.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] fontconfig: specify font directory in EXTRA_OECONF
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
X-List-Received-Date: Wed, 29 Jun 2011 11:40:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 17:27 -0700, Khem Raj wrote:
> On 06/27/2011 08:24 AM, Phil Blundell wrote:
> > -PR = "r1"
> > +PR = "r3"
> 
> a nitpick though not wrong but should be r2

Is it official policy that PRs need to be sequential?  There seem to be
various precedents for incrementing it by more than one in a single
checkin, see for example d3fc33760a80b0a067b41ff88e99941f1c40c8f9 and
993a2367f881f1f4eaa10339cde93c7058660d67.  If it's meant to only go up
by one each time then I guess I can cope with that but it would require
a bit of extra mangling at my end.

p.




