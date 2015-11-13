Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B131F772C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 11:59:36 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so77849726wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 03:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z2FJwGs9mhZsFAiqdpq0BTwz4V3RMNpn5ilAH2QpKnU=;
	b=QUvRyDJSyhPAmsXyG2xCr3hHcEZxc6Kq76mR4gVK56fVv5xe7PiATr9Oww5GS3uG00
	q1CNp8tfyn4HwB1djuddJBg2vKImjuUJ1s3irlL12eEu0ZgPVKr299vsV2iT7E/70lkQ
	fBz9In62xvYPpS24GaXcz6J2g4TvbrfLPiGOc7JS/jf5E3vhVEnAp5QECKsSBOrvjJlp
	G3GIwekE9AiWDumng/8jeXo656p6ztDGbeTvdFZTWi/RD9x91biVMYBJjEIz8MbRMxGP
	iy94RY6X5WtNQ4TM+sHViCpGpliPY/HDHBXchITG3mJ0c2Z6Lev7C0zmi+WYWa9+c4Ro
	pltQ==
X-Received: by 10.28.144.143 with SMTP id s137mr3596111wmd.26.1447415976088;
	Fri, 13 Nov 2015 03:59:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e63sm3632860wma.7.2015.11.13.03.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 03:59:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Nov 2015 12:59:58 +0100
To: Trevor Woerner <twoerner@gmail.com>, michael@yoctoproject.org
Message-ID: <20151113115958.GD2567@jama>
References: <56451D46.50707@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56451D46.50707@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Fri, 13 Nov 2015 11:59:37 -0000
X-Groupsio-MsgNum: 73401
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline

--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 06:14:14PM -0500, Trevor Woerner wrote:
> It seems I missed some announcement. At first I thought I had been
> unsubscribed from the openembedded-commits mailing list (since I haven't
> received any emails on that list since about the end of September). So I
> looked up http://lists.openembedded.org/pipermail/openembedded-commits/
> and it seems to have gone quiet about that time too.

I've already asked Paul and Michael few times on IRC in last few weeks.

I haven't received any reply from Michael, adding him to To, now.

> I liked being able to watch the commits to see what was going in, and to
> check if my patches were added (before sending "ping"s, without having
> to "git pull" and search). Is there a new workflow for seeing what's
> going in?

Yes, I find them useful too (e.g. to report issue with commit which was
recently merged) or in general to know that it's worth doing "git pull".

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZF0L0ACgkQN1Ujt2V2gBzCcACdHl8uHUVnRqAG12BtF0LtyBQB
Lz4AoJ9VAXaxY9Ry0FppcBemMoXtCioY
=R1bO
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
