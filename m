Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8Lp-0005Jp-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:52:09 +0100
Received: by wgbds11 with SMTP id ds11so15206555wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:44:57 -0800 (PST)
Received: by 10.227.203.131 with SMTP id fi3mr18798185wbb.17.1324658697603;
	Fri, 23 Dec 2011 08:44:57 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id di5sm33089991wib.3.2011.12.23.08.44.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:44:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:44:54 +0100
In-Reply-To: <730a89487990ac89b5cf86063d083d23a5501188.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<730a89487990ac89b5cf86063d083d23a5501188.1324657801.git.shane.wang@intel.com>
Message-Id: <BBCD5BBE-CFB6-4C49-A37C-AEC57D4A86B3@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 08/14] dbus: upgrade to 1.5.8
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
X-List-Received-Date: Fri, 23 Dec 2011 16:52:09 -0000
X-Groupsio-MsgNum: 14760
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8C1A2C21-3AEF-4C99-959C-1A567A280267";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8C1A2C21-3AEF-4C99-959C-1A567A280267
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
>=20
> delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
> create mode 100644 meta/recipes-core/dbus/dbus_1.5.8.bb

=46rom the dbus website:

The current stable branch is 1.4.x, and the latest stable release is =
D-Bus 1.4.16 (2011-09-21). See the 1.4.16 release announcement.
[..]
The current development branch is 1.5.x, and the latest development =
release is D-Bus 1.5.8 (2011-09-21). See the 1.5.8 release announcement.

Why is this switching dbus to the unstable branch?=

--Apple-Mail=_8C1A2C21-3AEF-4C99-959C-1A567A280267
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70sAYACgkQMkyGM64RGpHA/wCfS+oSIrk5MVW5Yfgug51lSsrp
/HkAn1TdP6vyhT853I+UBabevdEDAFXa
=tx+c
-----END PGP SIGNATURE-----

--Apple-Mail=_8C1A2C21-3AEF-4C99-959C-1A567A280267--
