Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R4WQM-0000R0-0t
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 13:17:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Sep 2011 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,392,1312182000"; d="scan'208";a="17785858"
Received: from unknown (HELO helios.localnet) ([10.252.120.40])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Sep 2011 04:12:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 12:12:19 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
In-Reply-To: <CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109161212.19780.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Eric
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Fri, 16 Sep 2011 11:17:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 15 September 2011 21:06:22 Otavio Salvador wrote:
> On Thu, Sep 15, 2011 at 15:41, Eric B=E9nard <eric@eukrea.com> wrote:
> ...
>=20
> > Btw, this patch is only a minor update of qt so this would be interesti=
ng
> > to have it into the 1.1 release imho.
>=20
> I agree with Eric that this is important to have into the release; rc
> is OK to skip it but for final seems good to have it in.

Considering there is at least one reported regression in 4.7.4, I'm not sur=
e=20
it would be a good idea to rush into it right now:

https://bugreports.qt.nokia.com/browse/QTBUG-20925

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


