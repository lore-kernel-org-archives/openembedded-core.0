Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBSf6-000153-7a
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 17:18:22 +0100
Received: by mail-pa0-f41.google.com with SMTP id fb11so1906419pad.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 08:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Wr3M5wTDQE8Ok3vpeBsH3mC7KfRBDNVobclnwhnneoQ=;
	b=jjFWgBT+mLU5BLeW+0DAEEL1FzsNLs4FttuHgssTuj095vv69eMhmqgOiparbS/y9O
	PUcGR+bmhEdIBp0/Hm/N+a+k3AXzMJ6JDLw/LPdHVx4Rk8jffHN70HengDYHOj1jZnIX
	T43UUilnlzWF7+1NVra0ZWXJpBw5uFIQtJoxi6G0nBUV6XZAiXfbU124tiJ3NSOL1rnx
	z3HKgEcN29Z5gxNRscjX8qrBfIBlR5smjvskm+72EAjf1tiPTCM4X0/QGB2qXCJShK/t
	S54BJpJ+uE4nJAfO2yaq89ynEdRipbJuzFZUX3uJegvvAFMiRPG46AyAfCl+fSVvMAbZ
	zZsw==
X-Received: by 10.68.137.131 with SMTP id qi3mr15149512pbb.47.1362153716000;
	Fri, 01 Mar 2013 08:01:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jp9sm12467000pbb.7.2013.03.01.08.01.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 08:01:54 -0800 (PST)
Date: Fri, 1 Mar 2013 17:01:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20130301160149.GN3279@jama>
References: <cover.1362003285.git.sgw@linux.intel.com>
	<1362093308.1055.4.camel@ted> <20130228234226.GC3279@jama>
	<1362097609.1055.35.camel@ted> <20130301091804.GF3279@jama>
	<CAHUNapT1kVsUjTSMkbcVXLjBK7kGMu3dQKNuSTk4t51wEnYgZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapT1kVsUjTSMkbcVXLjBK7kGMu3dQKNuSTk4t51wEnYgZw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 16:18:23 -0000
X-Groupsio-MsgNum: 36097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zfao1/4IORAeFOVj"
Content-Disposition: inline

--Zfao1/4IORAeFOVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 10:57:50AM -0500, Trevor Woerner wrote:
> On Fri, Mar 1, 2013 at 4:18 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > I'm sure about Ubuntu where it's easy:
> >             Ubuntu-10.04 \n \
> >             Ubuntu-11.10 \n \
> >             Ubuntu-12.04 \n \
> >             Ubuntu-12.10 \n \
> > but with others I'll need some help.
>=20
> I can help with openSUSE, what do you need me to do?

send lsb_release -a output

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zfao1/4IORAeFOVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEw0O0ACgkQN1Ujt2V2gByQOwCeOA8m7GuyEGr3mdvxJO3v87km
dPkAnR35jTAicswxhOWA+8OFHQq3cbVE
=UDJP
-----END PGP SIGNATURE-----

--Zfao1/4IORAeFOVj--
