Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RchT5-0001xi-3J
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:57:43 +0100
Received: by wgbds11 with SMTP id ds11so9404388wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 09:50:40 -0800 (PST)
Received: by 10.227.199.16 with SMTP id eq16mr12998216wbb.26.1324317040356;
	Mon, 19 Dec 2011 09:50:40 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm26774653wix.5.2011.12.19.09.50.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 09:50:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 19 Dec 2011 18:50:35 +0100
In-Reply-To: <cover.1324316137.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
Message-Id: <D88949C2-F8C7-4CAF-B74C-32AE43119D20@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Mon, 19 Dec 2011 17:57:43 -0000
X-Groupsio-MsgNum: 14479
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C97063D2-546C-4EB5-BF53-DDABA252D12E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C97063D2-546C-4EB5-BF53-DDABA252D12E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende geschreven:

> Set the default psplash image to the OpenEmbedded logo, and provide a
> script to allow people to use their own custom image.

What I did in OE-classic and meta-angstrom is to use update-alternatives =
to provide different psplash images. This way you can choose a different =
splash for each image instead of having a distro wide one. Is something =
like that suitable for oe-core as well?

regards,

Koen=

--Apple-Mail=_C97063D2-546C-4EB5-BF53-DDABA252D12E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAk7veW0ACgkQMkyGM64RGpEoUgCeLv5c8DgTKw/oV7V4G1t9yENL
dsIAl0eW6eU3TkcZTUgFTUNtGuzDl9Q=
=DVrz
-----END PGP SIGNATURE-----

--Apple-Mail=_C97063D2-546C-4EB5-BF53-DDABA252D12E--
