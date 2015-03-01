Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 607 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 01 Mar 2015 15:33:13 UTC
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
	[87.98.165.232])
	by mail.openembedded.org (Postfix) with ESMTP id F0A5E7372E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 15:33:13 +0000 (UTC)
Received: from mail622.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 3DB40FF9432
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 16:14:10 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Mar 2015 17:14:10 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with SMTP; 1 Mar 2015 17:14:08 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 255DC412AA; Sun,  1 Mar 2015 15:14:54 +0000 (GMT)
Date: Sun, 1 Mar 2015 15:14:54 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: opkg-devel <opkg-devel@googlegroups.com>
Message-ID: <20150301151454.GA11398@bang.betafive.co.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 3224577334390012793
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejledrfeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejledrfeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Stepping back from opkg maintenance
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
X-List-Received-Date: Sun, 01 Mar 2015 15:33:15 -0000
X-Groupsio-MsgNum: 62844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I had a change of circumstances at the beginning of January. Previously I w=
as a
full-time PhD student and maintaining opkg was my side project. Now I'm a
full-time software engineer and finishing up my PhD thesis is my side proje=
ct.
I've been trying to find time to fit opkg in there as well but it's just not
happening. I had at least hoped that I could get opkg to a v0.3.0 release b=
efore
I had to step back from opkg development but as I haven't really made any
commits to opkg in 2 months now I don't think it's reasonable to expect that
I'll get this done any time soon.

I'll try to keep an eye on the opkg mailing list and contribute with answer=
s and
suggestions when I can but I think someone else will have to take over as t=
he
maintainer of opkg. I'll do whatever I can to ensure as smooth transition if
someone else wants to take up the job of moving opkg forward.

I'd like to thank everyone that's contributed to opkg, whether by sending
patches or just by reporting bugs or making suggestions. I've only been
maintainer for around 18 months but I'd like to think we've made some good
progress in that time and I hope that that can continue forwards under some=
one
else's leadership.

Once I've submitted my PhD thesis I'll hopefully find some time to get back
involved with open source projects, whether that's further work on opkg or
getting involved in a different project.

Many thanks again,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU8yzuAAoJEBwoJlo7UPQDJPMH/0aQfcz9xu3Bc7DFui7h0C+c
lU6btTHFqn/nAr9Ro2tgxebfykdHJG5nzzdLn3BH8GdXCJapUIf3OOcriVKbzpOF
pBt9oZ5v8A6FQkfcrHOqVaR6CWx18yk4zUnvN/icEC5crbLKgISmedoaSMR/kxeK
x6mXfQp/uyWh/M7PPg4bLsqIwgXsEFfXthH7Afw3zN0RmQ9AUqxttu5Nb6WCdUs0
EPmKGBQW3gUhK6vDtM84SHzR0ZoR5rap+WxSfiAAhwzSPyMFdoRa9aLq49qs5GY7
YlLvGKml3bl5KWzH3NK+SRHeQ8TILTpj6tsOi6NZYlIecucokkGDrIcfOEjFJ2c=
=botw
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
