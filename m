Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RvmqC-0003qK-LF for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 10:32:28 +0100
Received: from f053034143.adsl.alicedsl.de ([78.53.34.143]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RvmiY-0006o8-SQ for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:24:35 +0000
Message-ID: <1328865863.4215.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 10:24:23 +0100
In-Reply-To: <4F34D48B.3040007@ts.fujitsu.com>
References: <4F34D48B.3040007@ts.fujitsu.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: Problems with recipe for openmotif-2.3.0
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
X-List-Received-Date: Fri, 10 Feb 2012 09:32:28 -0000
X-Groupsio-MsgNum: 17399
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ZAaPGK1Rhj0A2WLQAeG0"

--=-ZAaPGK1Rhj0A2WLQAeG0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Rainer,


Am Freitag, den 10.02.2012, 09:25 +0100 schrieb Rainer Koenig:

> I'm trying to build a recipe for openmotif-2.3.0,

are you using OE-Classic or OE-Core?

> but so far i get errors from "do_conigure" like:
>=20
> -----------------8<-snip--------------------------------
> ac:6: warning: cannot check for file existence when cross compiling
> ../../lib/autoconf/general.m4:2772: AC_CHECK_FILE is expanded from...
> configure.ac:6: the top level
> configure:14954: error: possibly undefined macro: LT_HAVE_FREETYPE
> -----------------8<-snip--------------------------------
>=20
> I'm not very familiar with the autotools, but the first line makes me
> think that the setup of openmotif is not suitable for cross-compiling.
> How can I solve those issues?

Sorry, I do not know.


Thanks,

Paul

--=-ZAaPGK1Rhj0A2WLQAeG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk804kcACgkQPX1aK2wOHVgoFQCgimyCNTL3dW2Xo/fkbNajsDAU
8C0An34ZogZQM0x0Ryipdwl/6QdmdGGX
=djDH
-----END PGP SIGNATURE-----

--=-ZAaPGK1Rhj0A2WLQAeG0--
