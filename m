Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id AC62B60EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:37:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,864,1378850400"; d="scan'208";a="37864399"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 10 Dec 2013 10:37:15 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.128]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.02.0328.009; Tue, 10 Dec 2013 10:37:14 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] bash-completion
Thread-Index: AQHOPh8QtTjZxXd8QkuZhmM6/jG5PZpOmdpw
Date: Tue, 10 Dec 2013 09:37:14 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B4D568A9C@COSNADEXC13.usr.ingenico.loc>
References: <20130420225659.GM2489@jama> <20130420232835.GN2489@jama>
In-Reply-To: <20130420232835.GN2489@jama>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash-completion
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
X-List-Received-Date: Tue, 10 Dec 2013 09:37:18 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

What's the status of this ? Is bash-completion recipe available somewhere?

Regards,
M

-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Martin Jansa
Envoy=E9=A0: dimanche 21 avril 2013 01:29
=C0=A0: bitbake-devel
Cc=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] bash-completion

On Sun, Apr 21, 2013 at 12:56:59AM +0200, Martin Jansa wrote:
> There is old thread on oe-devel about it=20
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/
> 003764.html
>=20
> Is there any reason why it wasn't added to contrib yet?
>=20
> Would it be applied if I send git patch adding it and update commands=20
> to include cleansstate and packagedata + new options like -S and maybe=20
> more?

Or maybe in oe-core/contrib, as list of possible commands is not defined in=
 bitbake.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

