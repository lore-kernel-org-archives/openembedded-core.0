Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlEVW-0000Re-U0
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 08:19:15 +0200
Received: by wyg30 with SMTP id 30so2825197wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2011 23:15:03 -0700 (PDT)
Received: by 10.216.46.75 with SMTP id q53mr3276771web.65.1311574502756;
	Sun, 24 Jul 2011 23:15:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f8sm3156657wed.34.2011.07.24.23.15.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jul 2011 23:15:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201107242234.51777.schnitzeltony@gmx.de>
Date: Mon, 25 Jul 2011 08:14:55 +0200
Message-Id: <EBE64358-255D-41CD-BA27-A9A733515E3D@dominion.thruhere.net>
References: <201107242234.51777.schnitzeltony@gmx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [meta-ti]Pandaboard issues
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
X-List-Received-Date: Mon, 25 Jul 2011 06:19:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 jul. 2011, om 22:34 heeft Andreas Mueller het volgende geschreven:

> Hi,
>=20
> while working on xfce48 recipes for meta-oe I wanted to do some run =
tests. My=20
> only hardware currently supported in oe-core environment is =
pandaboard. Herewith=20
> I face the following issues:
>=20
> - Starting X stops / log attached
> - Inputting at serial console causes bit errors (115200 8N1). Data =
coming from=20
> board seems OK.
> - No network (eth0 eth1 tested) available.

Tried usb0 or usb1?=


