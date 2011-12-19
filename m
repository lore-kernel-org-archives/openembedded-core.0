Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcZ8w-0000Fq-Ji
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 10:04:22 +0100
Received: by wgbds11 with SMTP id ds11so8614093wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 00:57:20 -0800 (PST)
Received: by 10.180.107.231 with SMTP id hf7mr24544240wib.68.1324285040069;
	Mon, 19 Dec 2011 00:57:20 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k5sm24847181wiz.9.2011.12.19.00.57.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 00:57:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 19 Dec 2011 09:57:17 +0100
In-Reply-To: <5f5f0083a3fa9afa2081b1cca3dfda03b0fb7f76.1324272052.git.dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324272052.git.dexuan.cui@intel.com>
	<5f5f0083a3fa9afa2081b1cca3dfda03b0fb7f76.1324272052.git.dexuan.cui@intel.com>
Message-Id: <9D240952-C22F-4CC9-8BF8-CFBA5D21F372@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] socat: add the latest stable version 1.7.2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 09:04:22 -0000
X-Groupsio-MsgNum: 14438
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FE5D6D58-E334-4B62-87E1-84A92C41A752";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FE5D6D58-E334-4B62-87E1-84A92C41A752
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 06:22 heeft Dexuan Cui het volgende geschreven:

> +DEPENDS =3D "openssl"
> +
> +LICENSE =3D "GPLv2+"

Linking GPL and openssl is not allowed due to the advertising clause in =
BSD. The socat people realized that and say:

license
-------

socat is distributed under the terms of the GNU GPL;
except for install-sh, which is copyright MIT, with its own license;

In addition, as a special exception, the copyright holder
gives permission to link the code of this program with
any version of the OpenSSL library which is distributed
under a license identical to that listed in the included
COPYING.OpenSSL file, and distribute linked combinations
including the two. You must obey the GNU General Public
License in all respects for all of the code used other
than OpenSSL. If you modify this file, you may extend this
exception to your version of the file, but you are not
obligated to do so. If you do not wish to do so, delete
this exception statement from your version.

regards,

Koen=

--Apple-Mail=_FE5D6D58-E334-4B62-87E1-84A92C41A752
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7u/G4ACgkQMkyGM64RGpGf1ACdFEDOmApCOn5LZLbGrIgpRiVO
N6cAoLvaHLhnwLKLgrInqTXKtIV4+xM+
=saLP
-----END PGP SIGNATURE-----

--Apple-Mail=_FE5D6D58-E334-4B62-87E1-84A92C41A752--
