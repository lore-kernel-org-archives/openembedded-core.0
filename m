Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1QF0BF-0007Mq-7h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 10:33:05 +0200
Received: from jcn (82.57.80.159) by smtp205.alice.it (8.5.124.08)
	(authenticated as fospite@alice.it)
	id 4DB13A49005A9544; Wed, 27 Apr 2011 10:24:41 +0200
Date: Wed, 27 Apr 2011 10:24:40 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Saul Wold <sgw@linux.intel.com>
Message-Id: <20110427102440.8b5f8ec7.ospite@studenti.unina.it>
In-Reply-To: <bd0798120559a8aca726db8e962bbbafb80c2a54.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<bd0798120559a8aca726db8e962bbbafb80c2a54.1303889119.git.sgw@linux.intel.com>
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.4; x86_64-unknown-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Chris Larson <clarson@kergoth.com>, Scott, Dongxiao
Subject: Re: [PATCH 01/52] sat-solver: fix arch=all packages
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
X-List-Received-Date: Wed, 27 Apr 2011 08:33:05 -0000
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__27_Apr_2011_10_24_40_+0200_eqsQlimgcvNoB4te"

--Signature=_Wed__27_Apr_2011_10_24_40_+0200_eqsQlimgcvNoB4te
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Apr 2011  0:29:19 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> From: Qing He <qing.he@intel.com>
>=20
> add a new options to set noarch archs as all so platform independent
> packages can be recognized and installed.
>=20
> fixes [YOCTO #993]
>

This is a question rather than a comment: would it make sense to use an
actual URL for issues? I mean can [YOCTO #993] be found in some
publicly accessible bug tracking system for people to see what it is
about?

> Signed-off-by: Qing He <qing.he@intel.com>
> ---


--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Wed__27_Apr_2011_10_24_40_+0200_eqsQlimgcvNoB4te--
