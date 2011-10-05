Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBUxp-0003sq-G3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:09:01 +0200
Received: by gyg8 with SMTP id 8so1806531gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 10:03:26 -0700 (PDT)
Received: by 10.150.115.13 with SMTP id n13mr2432568ybc.437.1317834205896;
	Wed, 05 Oct 2011 10:03:25 -0700 (PDT)
Received: from [10.224.151.200] (m520f36d0.tmodns.net. [208.54.15.82])
	by mx.google.com with ESMTPS id j26sm6453614ann.7.2011.10.05.10.03.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 10:03:25 -0700 (PDT)
References: <1317833828.6398.15.camel@ted>
In-Reply-To: <1317833828.6398.15.camel@ted>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <0571EE6B-4F42-44D1-BE6F-85EDDCD12423@dominion.thruhere.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 5 Oct 2011 12:03:17 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: Deprecated components removal in 5 days
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
X-List-Received-Date: Wed, 05 Oct 2011 17:09:01 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 okt. 2011 om 11:56 heeft Richard Purdie <Richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> This is a heads up notification that in 5 days time I'm planning to
> remove the following things from OE-Core:
>=20
> * gcc version 4.5
> * eglibc 2.12
> * gnomevfs
> * qt 4.7.3
>=20
> There is already a version of gcc 4.5 in meta-oe which should suffice
> for anyone who still needs it.=20
>=20
> Anyone wanting the other components will need to make arrangements for
> those recipes to transition there.

I'll move eglibc to meta-oe when I get back in europe later this week



>=20
> I do plan to remove hal too as soon as the last dependency is removed
> (my build without hal isn't booting X correctly atm).
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


