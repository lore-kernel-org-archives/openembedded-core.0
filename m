Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90FC560664;
	Thu, 19 Sep 2013 12:00:24 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so4084632eek.19
	for <multiple recipients>; Thu, 19 Sep 2013 05:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+1MwQ3BrlNfUNQTvMttKNuX+5WN4HfZBJDTHpUjSNTM=;
	b=fGvg24WlMgpFVEFrRwOem7uOGhgSQizg14Gx0xvImaAn7xs8y+oujuWbSdq+e9L+lH
	n9vD8r+TvO9PgZH2oAGUIBRiVySFv/07APM+5II5ciY2pMP8qKKTJpE8eMKjcG3ogISx
	CNOnUKE4OBnluAOGVGpXtlHITsOMA1PHqu7dTJmOgAJWYVr4NoiTaC5j0+9UnWjTIZEm
	rmCkUmUtxl4Zd5Mb/IQgfc4tzADKdaZHv++/miwsLmWhJR2pJRybJFYTw3TEy9VcILUn
	M8hVO+bR9WZkRSZgP7c5pZqz9Lk5K78e8of/gm8XrISxpU/pK9Q1hV16NzlZHZJnPCjV
	hweQ==
X-Received: by 10.15.25.5 with SMTP id k5mr1830841eeu.64.1379592025616;
	Thu, 19 Sep 2013 05:00:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm10719958eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:00:24 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:02:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130919120202.GK7313@jama>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Thu, 19 Sep 2013 12:00:25 -0000
X-Groupsio-MsgNum: 45234
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Content-Disposition: inline

--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
> Hi All,
>=20
> The patchwork has been updated to latest. Please keep an eye if you
> see something non working let me know immediately.

Hi,

something is wrong,

http://patchwork.openembedded.org/user/bundles/

returns 502 Bad Gateway for me and I cannot access individual bundles,
which is very bad, because all oe-devel patches are separated into
bundles based on layer.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI657oACgkQN1Ujt2V2gBzTvwCcC44NKJBxbEPI0BpjVx9Hjr2C
Ld4AnjKnA/qno0IsdbsOjPrGF4PuD45R
=ecVE
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
