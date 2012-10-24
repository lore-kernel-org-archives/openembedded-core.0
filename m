Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1TR2C3-0007RW-HA; Wed, 24 Oct 2012 16:44:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Oct 2012 07:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="231653095"
Received: from unknown (HELO helios.localnet) ([10.252.122.99])
	by orsmga002.jf.intel.com with ESMTP; 24 Oct 2012 07:30:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 24 Oct 2012 15:30:25 +0100
Message-ID: <1700131.q7Jk2zQzF1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Latest head causes challanges
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
X-List-Received-Date: Wed, 24 Oct 2012 14:44:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 24 October 2012 16:24:08 Andreas M=FCller wrote:
> On Wed, Oct 24, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:=

> > On Wed, 2012-10-24 at 16:19 +0200, Andreas M=FCller wrote:
> >> I updated my layers this morning. Since that I have huge fallout:
> >> Poking around I found /usr/libexec is missing on my machine. Any i=
dea
> >> what might caused this?
> >=20
> > 406bd38b4232f9f399ef5ffe0b4fac72ed605a23?
> >=20
> > p.
>=20
> Wow - I thought we are close to release...

The master branch has already moved past release - danny is the release=
 branch=20
and does not have this patch.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


