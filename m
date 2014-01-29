Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id F35356E7DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 18:47:04 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 6A04E81E; Wed, 29 Jan 2014 19:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id B490B825;
	Wed, 29 Jan 2014 19:46:33 +0100 (CET)
Date: Wed, 29 Jan 2014 19:46:32 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140129184631.GC12108@piout.net>
References: <1389879279-28203-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140129130632.GG24156@piout.net> <1391017302.24655.75.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1391017302.24655.75.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant-2.0: don't exit in pkg_postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jan 2014 18:47:07 -0000
X-Groupsio-MsgNum: 49679
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oh right, I didn't get any notifications so I assumed nobody had a look
at it.

Thanks !

On 29/01/2014 at 17:41:42 +0000, Richard Purdie wrote :
> On Wed, 2014-01-29 at 14:06 +0100, Alexandre Belloni wrote:
> > Ping ?
>=20
> Merged 10 days ago:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dcac6f8148a88d07263=
6bc1f9d54fed6de80dcb6d
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBCAAGBQJS6UyHAAoJEKbNnwlvZCyz/UgP/3NYKPOnVUrDw8Pw0de+JpiV
5i+gqcgXcwyyjGb8BaXyDgoxMEYaJmIRkc1i8QWAUC8I4Z8HKUaRbwG2OAD01HSS
qSh4Nzurjmu2YgMQVf2bhREYZYWZorHPKwxB+OLfy+GkADTUs2AXE7cuEIp/rGJr
Xy/4TCsrdP1ROJPYYsdCwpVY9qlF/aTa8tXyK5GHHK4jS01iKBhypaCGRCE3o0/1
nLhXGd0PK3oU5JX1LtlKkv9PUiM1oypLUUhDgBexgUNSRgOqzf53OlSfmT5nKf7J
grAcppBsJ46x9LPnrKpJoDtOhhHyfnz/Q1kYSiWw8YHJ8MizmVFv/q5uxQjPOCFC
Rzqov1PB6AUGIR5/zJsq3hnD5wUVdyPvpKmNtahGCDV12zh7QQuION6Jd4drO0xK
vOR8oe2WW7n54BaBuBDhjkt4rXw0MUdBXysVRmbW5ZSh0GDqaD0sSrS53Zhco0Jl
IcoxWT0mUq+KhOXReXCgHXc9XCqEcvfWS2KVeUBPQdYfN4xAVgwPY3CvvSdhooF3
/ShQK3skG4yzoghPHRvhmOwo7SqKjrpwvou7eWaLXRkdMcn9+Hk7n3OvmSk4WT3h
B6QkqDkddg7dUErPALGve9c8m48Tpt0TfXDTr4+IwEFf0THzDCsfb7QYEmMM30ar
cZJlpsUy1+gUJP5hIGC3
=3I3C
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
