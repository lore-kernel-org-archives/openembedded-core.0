Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>)
	id 1TR29N-0007IL-1F; Wed, 24 Oct 2012 16:41:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TR1wN-00037b-F6; Wed, 24 Oct 2012 16:28:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 24 Oct 2012 15:28:14 +0100
In-Reply-To: <CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351088895.3259.422.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Latest head causes challanges
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
X-List-Received-Date: Wed, 24 Oct 2012 14:41:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 16:24 +0200, Andreas M=C3=BCller wrote:
> On Wed, Oct 24, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2012-10-24 at 16:19 +0200, Andreas M=C3=BCller wrote:
> >> I updated my layers this morning. Since that I have huge fallout:
> >> Poking around I found /usr/libexec is missing on my machine. Any idea
> >> what might caused this?
> >
> > 406bd38b4232f9f399ef5ffe0b4fac72ed605a23?
> >
> > p.
> >
> Wow - I thought we are close to release...

Not that I'm any expert, but I think the release is coming from its own
branch (which doesn't happen to contain that commit) and not from
master.

p.




