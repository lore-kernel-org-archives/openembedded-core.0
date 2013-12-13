Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C9AF36C6EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 09:08:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,477,1384297200"; d="scan'208";a="38059573"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 13 Dec 2013 10:08:31 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 13 Dec 2013 09:49:45 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.128]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Fri, 13 Dec 2013 09:49:45 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] bash-completion
Thread-Index: AQHOPh8QtTjZxXd8QkuZhmM6/jG5PZpOmdpwgABDSgCABGShQA==
Date: Fri, 13 Dec 2013 08:49:44 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B4D56943E@COSNADEXC13.usr.ingenico.loc>
References: <20130420225659.GM2489@jama> <20130420232835.GN2489@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050B4D568A9C@COSNADEXC13.usr.ingenico.loc>
	<20131210143530.GF3721@jama>
In-Reply-To: <20131210143530.GF3721@jama>
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
X-List-Received-Date: Fri, 13 Dec 2013 09:08:36 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

I am talking about this:=20
 http://bash-completion.alioth.debian.org/

I can create the recipe if it does not exist (somewhere).

Regards,
M


-----Message d'origine-----
De=A0: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Envoy=E9=A0: mardi 10 d=E9cembre 2013 15:36
=C0=A0: Matthieu CRAPET
Cc=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] bash-completion

On Tue, Dec 10, 2013 at 09:37:14AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> What's the status of this ? Is bash-completion recipe available somewhere=
?

I don't know about any change since my question.

Are you talking about bash-completion definition for bitbake, right?

I wasn't asking about recipe for "generic" bash-completion.

> -----Message d'origine-----
> De=A0: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] De la part=20
> de Martin Jansa Envoy=E9=A0: dimanche 21 avril 2013 01:29 =C0=A0:=20
> bitbake-devel Cc=A0: openembedded-core@lists.openembedded.org
> Objet=A0: Re: [OE-core] bash-completion
>=20
> On Sun, Apr 21, 2013 at 12:56:59AM +0200, Martin Jansa wrote:
> > There is old thread on oe-devel about it=20
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-Decembe
> > r/
> > 003764.html
> >=20
> > Is there any reason why it wasn't added to contrib yet?
> >=20
> > Would it be applied if I send git patch adding it and update=20
> > commands to include cleansstate and packagedata + new options like=20
> > -S and maybe more?
>=20
> Or maybe in oe-core/contrib, as list of possible commands is not defined =
in bitbake.
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

