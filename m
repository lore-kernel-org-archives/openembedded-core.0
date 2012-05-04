Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQDt1-0006nx-Lf
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:29:12 +0200
Received: by bkcjm2 with SMTP id jm2so2174122bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fdv36PeMMJclH9IlHXjJDxuD6a9P4mSTxNb5BB6L2Hc=;
	b=vTadSWPbzjpLhNxtXbdN97ASNHagKQG/OgeIDJF1L/iaLvZz1BdasaKagakng69GBK
	d80ExpraIBH5MyCKi04MSgf1qPfJ+HO6S051TX7h+3F4FOiTosF3NnQ75KtuwOAjvPMw
	8ba3J6D1A6kJcUztagiHS9ehFLrG9pmFAiWBy0LM7no+9ZuaFT9Su6Cmvn1KpkS03iIC
	Qx4NZWCJb8Epr9EFMVL+BK0TXTDx8Gdzqf9S+xbSajaIOc51sCdYgY8Mn3KdUEpP9+Gf
	WGiu52/YZonnDeyj/K5dnXtWuZbuT1tx7PMskdlXk0LGaSeHWvohRl5p6qdoQTUKoA4O
	q/WA==
Received: by 10.204.150.84 with SMTP id x20mr530051bkv.26.1336119565364;
	Fri, 04 May 2012 01:19:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z17sm15190815bkw.12.2012.05.04.01.19.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 01:19:24 -0700 (PDT)
Date: Fri, 4 May 2012 10:19:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120504081927.GF3163@jama.jama.net>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
	<D972CB64-8B60-4301-805E-5B9B869954FE@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D972CB64-8B60-4301-805E-5B9B869954FE@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 08:29:12 -0000
X-Groupsio-MsgNum: 21649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline

--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 10:16:50AM +0200, Elvis Dowson wrote:
> Hi Martin,
>=20
> On May 4, 2012, at 10:02 AM, Martin Jansa wrote:
> >=20
> > Check this thread
> > http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/m=
sg24963.html
>=20
> The above thread only discusses the warning, but no-one has fixed it yet.=
 If you can tell me what needs to be done, I'll create a patch and post it =
back to the list.

My reply in that thread says what needs to be done.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+jkQ8ACgkQN1Ujt2V2gBziTgCfecZJaekpsi2N21q3atmLpWDN
tBIAoKXEJigehS+81k13gT26FtUn23uA
=Luyu
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
