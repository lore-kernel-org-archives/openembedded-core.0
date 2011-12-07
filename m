Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYDXF-0005Fr-CE
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 10:11:29 +0100
Received: by eaao14 with SMTP id o14so210486eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 01:04:41 -0800 (PST)
Received: by 10.213.101.17 with SMTP id a17mr292024ebo.78.1323248680968;
	Wed, 07 Dec 2011 01:04:40 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 65sm3421142eeg.8.2011.12.07.01.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 01:04:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 7 Dec 2011 10:04:41 +0100
In-Reply-To: <7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323246565.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323246565.git.xiaofeng.yan@windriver.com>
Message-Id: <BA8945E1-B3F9-4232-A633-7852415851E2@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Wed, 07 Dec 2011 09:11:29 -0000
X-Groupsio-MsgNum: 13721
Content-Type: multipart/signed;
	boundary="Apple-Mail=_779DCCAC-C506-4231-9BFE-D6A6B91B4AA5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_779DCCAC-C506-4231-9BFE-D6A6B91B4AA5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 7 dec. 2011, om 09:58 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> gtk run over x11 at current OE-core. If gtk want to run over directfb, =
then \
> the configuration related to x11 should be disabled and directfb =
should be enabled.

So what happens when I put both directfb and x11 in DISTRO_FEATURES?



--Apple-Mail=_779DCCAC-C506-4231-9BFE-D6A6B91B4AA5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7fLCsACgkQMkyGM64RGpHI1wCgoNrLslY1sAxjv/tskUj9v5Ev
dGIAnjP0OytETjZUd2ra5/+pw6RHacsN
=LnPB
-----END PGP SIGNATURE-----

--Apple-Mail=_779DCCAC-C506-4231-9BFE-D6A6B91B4AA5--
