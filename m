Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcY1C-0007Oi-OT
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:20:02 +0200
Received: by wyg30 with SMTP id 30so2278516wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 00:16:18 -0700 (PDT)
Received: by 10.216.61.145 with SMTP id w17mr826625wec.59.1309504578488;
	Fri, 01 Jul 2011 00:16:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h43sm1467660wes.35.2011.07.01.00.16.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 00:16:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1b743a32b4fc3ccdea5ebbb94691d6441bdd706a.1309503004.git.sgw@linux.intel.com>
Date: Fri, 1 Jul 2011 09:16:16 +0200
Message-Id: <A9686B58-013C-4390-B43C-3F06E9EDB02B@dominion.thruhere.net>
References: <cover.1309503004.git.sgw@linux.intel.com>
	<1b743a32b4fc3ccdea5ebbb94691d6441bdd706a.1309503004.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/4] uboot: Update to 2011.06
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
X-List-Received-Date: Fri, 01 Jul 2011 07:20:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 08:54 heeft Saul Wold het volgende geschreven:

> [YOCTO #1198]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> ...Drop-config.h-include-in-tools-imximage.h.patch |    0
> ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
> ...kimage_2011.03.bb =3D> u-boot-mkimage_2011.06.bb} |   12 =
+++++-------
> .../uboot/{u-boot_2011.03.bb =3D> u-boot_2011.06.bb} |   10 +++++-----

You do realize that people .bbappending 2011.03 are now left out in the =
cold, right?=


