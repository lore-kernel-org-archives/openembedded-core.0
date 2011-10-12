Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDz7X-0001Hr-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:45:19 +0200
Received: by ywf7 with SMTP id 7so26790ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 06:39:36 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr46706896far.12.1318426775924;
	Wed, 12 Oct 2011 06:39:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x4sm16529765fad.1.2011.10.12.06.39.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 06:39:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318426649.23801.161.camel@ted>
Date: Wed, 12 Oct 2011 15:39:25 +0200
Message-Id: <7E880D6E-9CE0-4E41-BDA5-1EF1F33D8B84@dominion.thruhere.net>
References: <1318426649.23801.161.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] atk: Upgrade 1.32.0 -> 2.2.0
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
X-List-Received-Date: Wed, 12 Oct 2011 13:45:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 okt. 2011, om 15:37 heeft Richard Purdie het volgende geschreven:

>=20
> diff --git a/meta/recipes-support/atk/atk_1.32.0.bb =
b/meta/recipes-support/atk/atk_2.2.0.bb
> index db8ca1f..1358f3e 100644
> --- a/meta/recipes-support/atk/atk_1.32.0.bb
> +++ b/meta/recipes-support/atk/atk_2.2.0.bb
> @@ -5,12 +5,10 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
>                     =
file://atk/atk.h;endline=3D20;md5=3Dc58238d688c24387376d6c69d06248a7"
>=20
> PR =3D "r1"

Please reset that r0 or better, completely remove it.=


