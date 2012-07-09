Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SoKr6-0002nx-CU; Mon, 09 Jul 2012 22:46:52 +0200
Received: by wibhq4 with SMTP id hq4so2947468wib.6
	for <multiple recipients>; Mon, 09 Jul 2012 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Df8eEz2Gtm2+CaAIxGRMQ6GJ3a2/x8ZwAPbH39fPbX4=;
	b=FWTcSfjrKJCRbNJGbRcYtdoZ8FNWnBU3uj+tKSFBXcbQqT4ZbZ7/StxQ3Kh+X/ry+R
	TqNeIwRiddpfgmGxSXM3raGkqQ5ZfpzQjOPN//A1PGugFGD/ugdTXfXtm62fGQ3Kpsq/
	iCSOD+jiZENBo4dYzRIEm5lx4St7ULnvdRjzjM8semqkTHtQsIcGxnR5joPqbGbsGRVF
	kq9nPYo64JpONYGffFM0p3Q95ENw4j4UCaUJxKJmlxFCdWZVQOaZOAFuqg08+uoGmuzx
	B/SlTDd/9yafXaOMrKD8YT5Yo/Lit+thTXOFEF4Yop0gX3J0v9lEdkiPH5vr7kLcQu6A
	6I+g==
Received: by 10.180.79.229 with SMTP id m5mr32351790wix.13.1341866142768;
	Mon, 09 Jul 2012 13:35:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm25192995wib.10.2012.07.09.13.35.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 13:35:41 -0700 (PDT)
Date: Mon, 9 Jul 2012 22:35:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709203539.GH6308@jama.jama.net>
References: <20120709160054.C9FA610219@opal>
	<20120709200357.GG6308@jama.jama.net>
	<CAJTo0LZBrgFmeJVV1RfA+N4z6t=vBip7PzA0bVjk=gBrzAQqGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZBrgFmeJVV1RfA+N4z6t=vBip7PzA0bVjk=gBrzAQqGA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Mon, 09 Jul 2012 20:46:52 -0000
X-Groupsio-MsgNum: 25012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Content-Disposition: inline

--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 09:16:13PM +0100, Burton, Ross wrote:
> On 9 July 2012 21:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Ross: please make sure you add them in future patches
> > sgw: maybe you're using different flow then RP for merging patches, but
> > your SOB should be there too IMHO.
>=20
> I *always* forget, sorry.  Is there a way to make git do it automatically=
?...

Not sure if there is smarter way. I'm using aliases for commit and
cherry-pick to always add '-s'.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/7QJsACgkQN1Ujt2V2gByUxgCeNX2zdY/y2wjeeLe+WA5Gfjbn
6kgAnR72kQ4vsnvYW3cZFRVUVbmDMxBK
=uldY
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--
