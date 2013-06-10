Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 765886A2F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:08:03 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E1CD54B0200;
	Mon, 10 Jun 2013 15:07:57 +0200 (CEST)
Date: Mon, 10 Jun 2013 15:07:55 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Steve Sakoman <sakoman@gmail.com>
Message-ID: <20130610150755.33deefce@e6520eb>
In-Reply-To: <CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
	<20130610094536.36e83ecd@e6520eb>
	<CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 13:08:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Mon, 10 Jun 2013 05:58:42 -0700,
Steve Sakoman <sakoman@gmail.com> a =C3=A9crit :

> On Mon, Jun 10, 2013 at 12:45 AM, Eric B=C3=A9nard <eric@eukrea.com> wrot=
e:
>=20
> > the strange thing is why do you get a X qtdemo when building
> > qt4e-demo-image ?
>=20
> I haven't begun debugging yet, but I had 2 initial thoughts as to why
> the X error message:
>=20
> 1. The qtdemo init seems to be written to support both x and x-free
> setups, so perhaps the init is getting confused
> 2. I had built the x11-free version of qt prior to the qte version, so
> perhaps that causes the issue
>=20
> I started a clean build just in case #2 is the cause.
>=20
OK #2 is clearly a situation I avoid here as this created me some
troubles in the past.

Eric

