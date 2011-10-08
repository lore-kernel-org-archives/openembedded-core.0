Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCUE6-0004hR-Mo
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 12:33:54 +0200
Received: by bke11 with SMTP id 11so6180540bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Oct 2011 03:28:16 -0700 (PDT)
Received: by 10.223.7.83 with SMTP id c19mr17284822fac.16.1318069695934;
	Sat, 08 Oct 2011 03:28:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f10sm17851627fac.14.2011.10.08.03.28.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 08 Oct 2011 03:28:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1318062305.git.edwin.zhai@intel.com>
Date: Sat, 8 Oct 2011 12:28:14 +0200
Message-Id: <DE38EBEF-E7F8-48C4-8BCB-E855102AF1DF@dominion.thruhere.net>
References: <cover.1318062305.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 0/1] gnutls: fix configure failure
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
X-List-Received-Date: Sat, 08 Oct 2011 10:33:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

h=
ttp://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D808b31=
23e359f1aebabb8af44694275e4075e031


Op 8 okt. 2011, om 10:30 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> All,
> This patch fix configure failure of guntls after last upgrade.
> Pls. help to review.
>=20
> Thanks,
> Edwin
>=20
> The following changes since commit =
0d8c8cf462e5df446669355b554b3d5fdc532a11:
>=20
>  mutter: update to 2.29.1 and fix SRC_URI (2011-10-07 11:35:50 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib gzhai/master2
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dgzhai/master2
>=20
> Zhai Edwin (1):
>  gnutls: Fix configure failure
>=20
> meta/recipes-support/gnutls/gnutls.inc |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



