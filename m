Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDLLA-0007jc-DE
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:49:00 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id EC3B3A622B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 21:39:54 +0200 (CEST)
Date: Thu, 29 Mar 2012 21:39:53 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120329213953.0d88db51@eb-e6520>
In-Reply-To: <alpine.DEB.2.02.1203291533390.5968@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<20120329212924.5d01d792@eb-e6520>
	<alpine.DEB.2.02.1203291533390.5968@oneiric>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Thu, 29 Mar 2012 19:49:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 29 Mar 2012 15:35:10 -0400 (EDT),
"Robert P. J. Day" <rpjday@crashcourse.ca> a =E9crit :

> On Thu, 29 Mar 2012, Eric B=E9nard wrote:
>=20
> > Le Thu, 29 Mar 2012 15:23:20 -0400 (EDT),
> > "Robert P. J. Day" <rpjday@crashcourse.ca> a =E9crit :
> > >   so what is best practise here?
> > >
> > for this one you have an answer on OE's wiki :
> > http://www.openembedded.org/wiki/I_want_an_image_with_package_XYZ_insta=
lled
>=20
>   despite the fact that the current reference manual *explicitly*
> says this?
>=20
> "Using IMAGE_INSTALL with the +=3D operator from the /conf/local.conf
> file or from within an image recipe is not recommended as it can cause
> ordering issues."
>=20
>   i actually did my research before i asked that question, you know.
>=20
fine, sorry for trying to give an answer to your question.

Eric


