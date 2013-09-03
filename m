Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7F26BC26;
	Tue,  3 Sep 2013 10:48:31 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so2906648eek.37
	for <multiple recipients>; Tue, 03 Sep 2013 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zbIQd9GXonw/q7c+NRd5pzG8WjqKB3TmxKtiWjLJG1o=;
	b=X0Lz7oNjegvo63la0qDZYaN6Dd1Z9ITzPOOJmPDsDOA1a2sEMH0TShLzd7xqyeg78U
	tbVOAPLyiPFeKT+Yeb1eIwW0Rki0c+vn7tQSzV3NrET3sB/pg1rj5cIRWXNGzYynI7+G
	r33EmcUdMyI7D6M2UMSbH7wXN+f3Km4NedgHoOOWdGnMNY4O7M6s/kAALuE/dBLERUv/
	EKKGvSJ+pk9vwLSofSqWIVcVj7Rej8tUpIk4Qf6NDuocwWIsM+lOdgEjk5QhdFV9CbAH
	YTGQf0uWVGsw9n2XNnGaJ3VnBFHXnBUusmzqZDl1reO+VG7xwm6G87Ba40dEKADf/HSz
	73zw==
X-Received: by 10.14.89.72 with SMTP id b48mr20607229eef.43.1378205311454;
	Tue, 03 Sep 2013 03:48:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm30381206eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 03:48:31 -0700 (PDT)
Date: Tue, 3 Sep 2013 12:49:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130903104948.GC3544@jama>
References: <20130820142105.423E0503D1@opal> <20130823215953.GF3544@jama>
	<CAJTo0LaTDeTnifQXoSq63tUxruJ1XvAgwvnGT-xOh8_YcPh4Gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaTDeTnifQXoSq63tUxruJ1XvAgwvnGT-xOh8_YcPh4Gg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Marko Lindqvist : gtk+: update to upstream version 2.24.20
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
X-List-Received-Date: Tue, 03 Sep 2013 10:48:32 -0000
X-Groupsio-MsgNum: 44412
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pCBpnpYZ3zWUlzNh"
Content-Disposition: inline

--pCBpnpYZ3zWUlzNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2013 at 11:26:56AM +0100, Burton, Ross wrote:
> On 23 August 2013 22:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> > | failed to load "./apple-red.png": Couldn't recognize the image file f=
ormat for file './apple-red.png'
>=20
> That's odd.  Can you replicate this on demand or was it a transient failu=
re?

I haven't seen it on jenkins since then.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pCBpnpYZ3zWUlzNh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIlvswACgkQN1Ujt2V2gBx2UwCgsHsMnoz8HNbia8o9XP59HMCe
5YwAn2mHUfAlxZnAdZiw0CyIg4XSZB+V
=eSZk
-----END PGP SIGNATURE-----

--pCBpnpYZ3zWUlzNh--
