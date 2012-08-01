Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwYZ3-0005z0-HJ
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:02:13 +0200
Received: by weyr6 with SMTP id r6so4661491wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0qTy01iywW5VQv7ZwwivFvqz1+e0TpCo6C8GGRxUPSY=;
	b=jCoWXErP7A+xHmk8FX+97rI2I5TCaAJ4M4kmlHIC6iv57bEjiu7DP7iRVAst8qlO1M
	iPur4eTc8/3G9+HHQDBK3/qkvETVIW5ovLhDHeowLranvdOTN/s9eT9c1jMAylTA8lvg
	KjKXb8QY4Aw00TMtKuOqa6/mh8TXPAR1C+hNJAxIVBwAVwPf/QjGuyLQV0Lb2Z9kD1er
	dP/+nhYg4IM4gb0zpz+SO/LoMkaQHKEAB+gTOushWzQngJ4O0KbIgC3v8hXoJpjfolwk
	CCtzwnF8FoVGX3KXg1EiR1Cw9OI3r9N3MJ1Ixhv5/czZ4W2cuA7xN//CCE2e4yq2YFYS
	1vvQ==
Received: by 10.216.255.148 with SMTP id j20mr8226693wes.106.1343825435510;
	Wed, 01 Aug 2012 05:50:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm27784401wib.6.2012.08.01.05.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:50:34 -0700 (PDT)
Date: Wed, 1 Aug 2012 14:50:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801125031.GH16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<b6ea047dbcbc736d0ee59508a36e907c5271755f.1343823907.git.ross.burton@intel.com>
	<20120801123518.GD16306@jama.jama.net>
	<CAJTo0Lbw_=NKyOnFCOJBdrJ9qBhMbdAWprOedjuU_FPAMBwVAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbw_=NKyOnFCOJBdrJ9qBhMbdAWprOedjuU_FPAMBwVAA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 05/12] mesa: Update to 8.0.4 (latest stable version)
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
X-List-Received-Date: Wed, 01 Aug 2012 13:02:13 -0000
X-Groupsio-MsgNum: 26638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Content-Disposition: inline

--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 01:37:31PM +0100, Burton, Ross wrote:
> On 1 August 2012 13:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> > This ^ isn't for oe-core.
>=20
> Indeed you're right, I forgot to split it out as I'm lazy and work
> from the poky repo.

The same for "poky: add EGL and OpenGLESv2 features" patch which is at
least separate patch I can completely ignore :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZJhcACgkQN1Ujt2V2gBxCZQCffHJ/DwAmI0XhH9dwjVOQHmK6
XAgAn2t/mBc5QMU12hjikbZF/CIKslnK
=DPxA
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--
