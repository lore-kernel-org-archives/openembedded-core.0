Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QCvU7-0003W1-Vj
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 17:08:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Apr 2011 08:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,251,1301900400"; d="scan'208";a="681995338"
Received: from unknown (HELO helios.localnet) ([10.255.13.60])
	by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2011 08:05:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 16:05:28 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
In-Reply-To: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201104211605.28351.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 15:08:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
> and possibly more. I would like to create a meta-gnome layer in the
> meta-openembedded repository where new recipes get added and things from
> meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
> should move there as well.
>=20
> What are your thoughts on this?

=46rom my perspective this sounds like a great idea. The only question woul=
d be=20
how much of the "GNOME" libs would remain in oe-core as some of them are qu=
ite=20
widely used outside of GNOME proper; however that can easily be worked out =
as=20
these things mature.

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre (UK)


