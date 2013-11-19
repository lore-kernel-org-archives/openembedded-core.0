Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D86A66D001;
	Tue, 19 Nov 2013 18:20:10 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so1114483eaj.26
	for <multiple recipients>; Tue, 19 Nov 2013 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kOQKavI/20JUVHSLHOBpcMtbBinc6JDuAU03wV4F98Q=;
	b=ovf4hI6mDGNNGdJXRgnKHnqNCdBFKPrjtnjbjBTatF3T9l79yqV0+j89g5Qq6s3UKv
	h1Q98+djfjB0TCoTI/U+YgljZymoy1jKAA6aCtyUIWUl9912lEQDS+M2lJ7HMaZ08qqR
	KOVqYiYSn4YsARJeZXKbAotCXpKnRfxbZslutrRRc1iKxRAEaoEZ7y49d7MiD9fNcvVy
	SQmsWaAWqzToEaHuch4WeJ/UsjGJ80LPNy2Eh1n/PVmEB969lcmxdoQcDJNqy8oHeU0Z
	XWNrnxvWT7li0I9p3eCOp9ngzws3tyahf0b7hDr8yXsDmjanCfnatpD0f70Oc0n6O5ki
	tSsg==
X-Received: by 10.14.177.4 with SMTP id c4mr32761eem.152.1384885212056;
	Tue, 19 Nov 2013 10:20:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x4sm51323918eef.1.2013.11.19.10.20.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 10:20:11 -0800 (PST)
Date: Tue, 19 Nov 2013 19:20:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20131119182012.GE3708@jama>
References: <20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama> <20131030230825.GB32015@jama>
	<20131119155040.GD3708@jama>
	<CALbNGRR=RixaPbdqW4P2YQ-EH=vu3Ni-2zvOhKSDBo=RCTA52A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR=RixaPbdqW4P2YQ-EH=vu3Ni-2zvOhKSDBo=RCTA52A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 18:20:12 -0000
X-Groupsio-MsgNum: 47292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Content-Disposition: inline

--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 04:59:19PM +0100, Andreas M=FCller wrote:
> On Tue, Nov 19, 2013 at 4:50 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> >> Starting now I'll use
> >> http://openembedded.org/wiki/Bitbake_World_Status
> >> to post results from my bitbake world buils.
> >
> > It was updated few times since this e-mail and I've received no
> > feedback.
> >
> > Should I continue to post them or nobody except me is really interested?
> I am interested but would prefer some short information as mail like
> in the past because prefer events more than polling.

OK, I'll continue to send summary to list as well.

Thanks for feedback.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLq9wACgkQN1Ujt2V2gBx8wwCfZ5+p2Wr49V5ACCZRCwYKW1C4
ekMAn29lTxOBNQlbE6GhXRfLJchZxpK7
=18o6
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
