Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROGWM-0004Cm-1m
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 23:21:26 +0100
Received: (qmail invoked by alias); 09 Nov 2011 22:15:09 -0000
Received: from p5B0A37AB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.171]
	by mail.gmx.net (mp055) with SMTP; 09 Nov 2011 23:15:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18UGmsY8PcU5vaD231OKtFF0uBOd8Zp9ktNNoCx4f
	qZXG/msxkhNBEe
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2011 23:20:06 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201111092315.30348.schnitzeltony@gmx.de>
In-Reply-To: <201111092315.30348.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201111092320.06281.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Wed, 09 Nov 2011 22:21:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 09, 2011 11:15:30 PM Andreas M=FCller wrote:
> Hi,
>=20
> Imagine a recipe is included into an image by a task and later gets
> systemd- native support.
> How about forcing the packages in SYSTEMD_PACKAGES packed into images in
> case
>=20
> IMAGE_INIT_MANAGER  =3D "systemd"
>=20
> is found in the image definition?
>=20
> Andreas
>=20
Sorry wrong list :(


