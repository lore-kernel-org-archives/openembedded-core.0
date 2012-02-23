Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S0bJa-00063t-1j
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:14:42 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 431F64B013A;
	Thu, 23 Feb 2012 17:06:18 +0100 (CET)
Date: Thu, 23 Feb 2012 17:06:17 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120223170617.093598d6@eb-e6520>
In-Reply-To: <2076050.yMvNPjVBiI@helios>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<20120223163032.0822e104@eb-e6520> <2217377.xs2ypPJBB4@helios>
	<2076050.yMvNPjVBiI@helios>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Thu, 23 Feb 2012 16:14:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 23 Feb 2012 15:38:33 +0000,
Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :

> On Thursday 23 February 2012 15:32:47 Paul Eggleton wrote:
> > > Basically I had :
> > > XSERVER +=3D "    <=3D=3D=3D=3D missing \
> > >=20
> > > 	xf86-input-tslib \
> > > 	"
> > >=20
> > > and bitbake exit with :
> > > ERROR: Command execution failed: Exited with 1
> > > et nothing more.
> >=20
> > This got broken last night and fixed last night, so if you update you s=
hould
> > have the fix.
>=20
> Er, actually that's completely false. However I do have a bitbake patch r=
eady=20
> to submit to fix this.
>=20
I confirm this is false I as updated bitbake before sending the mail ;-)

Thanks,
Eric
--=20
http://eukrea.com/en/news/104-2012


