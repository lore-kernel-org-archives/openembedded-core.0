Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RB2h2-0001AK-7g
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 12:57:48 +0200
Received: by bke11 with SMTP id 11so477148bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OuWAxC0nG5Vhg4ARwSxDvNWlY2kYLCLqxoWcX6YjM2I=;
	b=fcN36HdokZgqA9qLWrPvSBfRNP696/iJzdr+uFiwl2BI98xQdbBnAo+q2L9Pr3/Fcm
	bcLerTsEayApwSn7JkNiCWXE/v/DnvXgxNqgulah+iAyk0TECn0o9M2rwW72yPgY1C29
	7grNcyTAFvoyq+KAGvkY/dDDvGBi/reH1Imks=
Received: by 10.204.146.155 with SMTP id h27mr585714bkv.353.1317725534653;
	Tue, 04 Oct 2011 03:52:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm5788398bkq.11.2011.10.04.03.52.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 03:52:13 -0700 (PDT)
Date: Tue, 4 Oct 2011 12:52:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20111004105207.GC19366@jama.jama.net>
References: <20111003103855.GN7364@jama.jama.net>
	<cover.1317648040.git.Martin.Jansa@gmail.com>
	<1317723797.14671.22.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317723797.14671.22.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 00/30] Xorg related changes
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
X-List-Received-Date: Tue, 04 Oct 2011 10:57:48 -0000
X-Groupsio-MsgNum: 10465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2011 at 11:23:09AM +0100, Richard Purdie wrote:
> On Mon, 2011-10-03 at 15:28 +0200, Martin Jansa wrote:
> > this patchset brings meta-oe and oe-core xorg stuff together and most of
> > xorg recipes will be removed from meta-oe (sending another pull request=
 now).
>=20
> Did anything in the first seven patches of this series change compared
> to what I have queued?

No

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6K5VcACgkQN1Ujt2V2gBwWTQCgmH8M8CAp30LfTv77nJMLko07
rfIAoI4FPKv76qCy+tZJk/8nojlFsahB
=v9Ws
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
