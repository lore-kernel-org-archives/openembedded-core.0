Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1QF04A-0007FL-7J
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 10:25:46 +0200
Received: from jcn (82.57.80.159) by smtp208.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4C1A2716181AF7D8; Wed, 27 Apr 2011 10:17:13 +0200
Date: Wed, 27 Apr 2011 10:17:12 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Saul Wold <sgw@linux.intel.com>
Message-Id: <20110427101712.bd2c2d0f.ospite@studenti.unina.it>
In-Reply-To: <451b67c736a7b67baf6b0bda5fee38b44b4a24cd.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<451b67c736a7b67baf6b0bda5fee38b44b4a24cd.1303889119.git.sgw@linux.intel.com>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.4; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Apr 2011 10:26:38 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Chris Larson <clarson@kergoth.com>, Scott, Dongxiao
Subject: Re: [PATCH 03/52] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Wed, 27 Apr 2011 08:25:46 -0000
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__27_Apr_2011_10_17_12_+0200_dVX26hQIiI/QFYiu"

--Signature=_Wed__27_Apr_2011_10_17_12_+0200_dVX26hQIiI/QFYiu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Apr 2011  0:29:21 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> From: Khem Raj <raj.khem@gmail.com>
>=20
> Hi
>=20
> This is initial set of patches for testing them out
> The patches need documentation is pending
> Some patches especially uclibc related are not
> needed they must be dropped.
>=20
> This is not the final version yet. But I would like
> folks to help trying them out and report issues
>

If these changes turned to be the final ones then the commit message
should be updated, shouldn't it?

> I have tried to boot uclibc/arm on it but qemu
> died on me. so please boot the images you build
> and I would be interested to know the results.
>=20
> -Khem
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---

[...]

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Wed__27_Apr_2011_10_17_12_+0200_dVX26hQIiI/QFYiu--
