Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbSMZ-0002xe-28
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 08:37:51 +0100
Received: by werm13 with SMTP id m13so341068wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 23:30:52 -0800 (PST)
Received: by 10.216.139.195 with SMTP id c45mr188724wej.18.1324020652272;
	Thu, 15 Dec 2011 23:30:52 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k5sm11910570wiz.9.2011.12.15.23.30.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 23:30:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 16 Dec 2011 08:30:51 +0100
In-Reply-To: <35d3dfdcbc7291c8556e90d67a0f349c8f7caa03.1323991540.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323991540.git.josh@linux.intel.com>
	<35d3dfdcbc7291c8556e90d67a0f349c8f7caa03.1323991540.git.josh@linux.intel.com>
Message-Id: <51B87129-E8A1-4358-BA5A-7090EA679925@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 08/10] pango: clarify LICENSE is LGPL-2.0+
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
X-List-Received-Date: Fri, 16 Dec 2011 07:37:51 -0000
X-Groupsio-MsgNum: 14303
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5C2580B8-3856-4F34-A27F-9ABD7C2FCA21";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5C2580B8-3856-4F34-A27F-9ABD7C2FCA21
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 16 dec. 2011, om 00:30 heeft Joshua Lock het volgende geschreven:

> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
> meta/recipes-graphics/pango/pango.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/pango/pango.inc =
b/meta/recipes-graphics/pango/pango.inc
> index ff5a73a..922425c 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -7,7 +7,7 @@ core of text and font handling for GTK+-2.x."
> HOMEPAGE =3D "http://www.pango.org/"
> BUGTRACKER =3D "http://bugzilla.gnome.org"
> SECTION =3D "libs"
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPL-2.0+"

In the past we agreed to use LGLPv2+ for that, has that changed?=

--Apple-Mail=_5C2580B8-3856-4F34-A27F-9ABD7C2FCA21
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7q86wACgkQMkyGM64RGpHo7wCgjRjYb5n3hkeqTYQgyybTJZ8E
KHQAniFe1SY14IEUBOT/PXMJ4ffSdRw7
=WRe0
-----END PGP SIGNATURE-----

--Apple-Mail=_5C2580B8-3856-4F34-A27F-9ABD7C2FCA21--
