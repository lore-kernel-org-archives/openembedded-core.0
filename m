Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbD9J-0007UH-Ee
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:23:09 +0100
Received: by faaa20 with SMTP id a20so2410967faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 07:16:11 -0800 (PST)
Received: by 10.180.75.204 with SMTP id e12mr5494152wiw.61.1323962171659;
	Thu, 15 Dec 2011 07:16:11 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k5sm8706535wiz.9.2011.12.15.07.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:16:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 15 Dec 2011 16:16:17 +0100
In-Reply-To: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 15 Dec 2011 15:23:09 -0000
X-Groupsio-MsgNum: 14261
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B54787F2-AF40-49EB-9E7D-7DE915110428";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B54787F2-AF40-49EB-9E7D-7DE915110428
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

ping

Op 30 nov. 2011, om 15:58 heeft Koen Kooi het volgende geschreven:

> tested on beagleboard/angstrom with midori and epiphany browsers
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-sato/webkit/files/GNUmakefile.am |   37 ++-
> meta/recipes-sato/webkit/files/autogen.sh     |    1 -
> meta/recipes-sato/webkit/files/configure.ac   |  395 =
++++++++++++-------------
> meta/recipes-sato/webkit/webkit-gtk_svn.bb    |    9 +-
> 4 files changed, 232 insertions(+), 210 deletions(-)
>=20


--Apple-Mail=_B54787F2-AF40-49EB-9E7D-7DE915110428
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7qD0EACgkQMkyGM64RGpFdRwCfb7EINOXwxzdLZEyYBht2lhga
0IoAoI55N5JHFR2hsW7X9ex/wrU5hkxC
=dTUv
-----END PGP SIGNATURE-----

--Apple-Mail=_B54787F2-AF40-49EB-9E7D-7DE915110428--
