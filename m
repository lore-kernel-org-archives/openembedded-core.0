Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QdiRW-00074I-Ii
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 14:40:02 +0200
Received: by wyg30 with SMTP id 30so3808099wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2011 05:36:14 -0700 (PDT)
Received: by 10.216.8.80 with SMTP id 58mr5105436weq.0.1309782974021;
	Mon, 04 Jul 2011 05:36:14 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.255])
	by mx.google.com with ESMTPS id w58sm3047537weq.1.2011.07.04.05.36.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jul 2011 05:36:12 -0700 (PDT)
References: <1309544267-24186-1-git-send-email-koen@dominion.thruhere.net>
	<4E119DDD.5090902@dresearch-fe.de>
In-Reply-To: <4E119DDD.5090902@dresearch-fe.de>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <F413FDCF-226E-43DB-A161-18F043D4F5D0@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 4 Jul 2011 13:36:06 +0100
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ppp: sync packaging with OE .dev
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
X-List-Received-Date: Mon, 04 Jul 2011 12:40:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

those don't get created on my system :(

Op 4 jul. 2011 om 12:02 heeft Steffen Sledz <sledz@dresearch-fe.de> het volg=
ende geschreven:

> Can you please resync again.
>=20
> Commit e05db51b7aea7a0359babd918d7efbb9cc213d83 introduces an own package f=
or PPPoL2TP plugin.
>=20
> Adding that package fixes the following error message.
>=20
>      NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started
>      WARNING: the following files were installed but not shipped in any pa=
ckage:
>      WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so
>      WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so
>=20
> Regards,
> Steffen
>=20
> --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058


