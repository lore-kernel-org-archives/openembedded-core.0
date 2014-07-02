Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B5505609B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 18:39:48 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id y10so11616115wgg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 11:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UL+YJYCVVgwZ00PXVnPpz8gj4usE3lA3ZJjLvN4qzbU=;
	b=JhUjK641GwCQuxyiqryXZm7Oo0WEvrtlc9/TcBam4OTuyDqYFQrrkbMxorWq0fug0P
	6k+BblYESVwb6+IiBM+wQoLOIrh2m8YBxnO9CMhyqFUfi5pxwlo7y03FLg1bir+0oKs/
	0nKsOs0NmaO+aLrHtUJFDou9Sm717AKdqqndR34juP6WtFMRtNxx/STAu2ZyFfxn0nEn
	RoYnblzF/uQjMWRNPVeoq0M90EYFO9T/pLi6ByEIGH/4TYGT0TBqxs6WeAoDidLsCsuY
	zB8VCYgi7o0tWALSpPHnU1ix7Yy7meRNP1kO7AbfLx/SK6LNOejZsUVup9feErOhLlSg
	g4hQ==
X-Received: by 10.180.93.196 with SMTP id cw4mr44524316wib.69.1404326388860;
	Wed, 02 Jul 2014 11:39:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fn1sm57908632wib.18.2014.07.02.11.39.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jul 2014 11:39:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Jul 2014 20:39:59 +0200
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
Message-ID: <20140702183959.GM2437@jama>
References: <20140702172118.3492.qmail@f4mail-235-235.rediffmail.com>
MIME-Version: 1.0
In-Reply-To: <20140702172118.3492.qmail@f4mail-235-235.rediffmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regarding Squid,uamhttpserver,lighthttpd
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
X-List-Received-Date: Wed, 02 Jul 2014 18:39:58 -0000
X-Groupsio-MsgNum: 54552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CxSUI8jTRJ26tNoZ"
Content-Disposition: inline

--CxSUI8jTRJ26tNoZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2014 at 05:21:18PM -0000, Himanshu  Pandey wrote:
> Hi,
>=20
> Where can I find these packages in git, so that I can download and compil=
e them.

http://layers.openembedded.org/layerindex/branch/master/layers/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CxSUI8jTRJ26tNoZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO0Uf8ACgkQN1Ujt2V2gBxFPQCeIo02uJmEWz6abkF6acibmkII
DIgAoIqHUZnH6aKSHK26lvICnaEg333y
=SM04
-----END PGP SIGNATURE-----

--CxSUI8jTRJ26tNoZ--
