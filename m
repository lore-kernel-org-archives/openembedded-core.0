Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8rCQ-0008FJ-It
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 12:17:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2011 03:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,454,1312182000"; d="scan'208";a="68221868"
Received: from unknown (HELO helios.localnet) ([10.252.120.175])
	by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2011 03:11:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?iso-8859-1?q?B=E9nard?= <eric@eukrea.com>
Date: Wed, 28 Sep 2011 11:11:33 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <20110911172241.GA3674@chargestorm.se>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
	<4E79E3A9.8080804@eukrea.com>
In-Reply-To: <4E79E3A9.8080804@eukrea.com>
MIME-Version: 1.0
Message-Id: <201109281111.33193.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 28 Sep 2011 10:17:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wednesday 21 September 2011 14:16:25 Eric B=E9nard wrote:
> Le 21/09/2011 15:05, Koen Kooi a =E9crit :
> > WARNING: For recipe qt4-x11-free, the following files were installed but
> > not shipped in any package:
> > WARNING:   /usr/share/qt4/phrasebooks/swedish.qph
> > WARNING:   /usr/share/qt4/phrasebooks/dutch.qph
> > WARNING:   /usr/share/qt4/phrasebooks/german.qph
> > WARNING:   /usr/share/qt4/phrasebooks/polish.qph
> > WARNING:   /usr/share/qt4/phrasebooks/danish.qph
> > WARNING:   /usr/share/qt4/phrasebooks/japanese.qph
> > WARNING:   /usr/share/qt4/phrasebooks/finnish.qph
> > WARNING:   /usr/share/qt4/phrasebooks/norwegian.qph
> > WARNING:   /usr/share/qt4/phrasebooks/french.qph
> > WARNING:   /usr/share/qt4/phrasebooks/russian.qph
> > WARNING:   /usr/share/qt4/phrasebooks/spanish.qph
> > WARNING:   /usr/share/qt4/phrasebooks/hungarian.qph
> > WARNING:   /usr/share/qt4/phrasebooks/italian.qph
>=20
> OK I forget to integrate Otavio's patch which fix the translations. I'll=
=20
> update tonight.

Did you have a chance to do this? I don't see an additional commit in the=20
qt4_upgrade branch in your repo.

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


