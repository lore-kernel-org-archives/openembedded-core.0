Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaNYs-0007IV-Ac
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:18:06 +0100
Received: by eaal1 with SMTP id l1so1480584eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=keBrc7CjN95x1ZBoghGoQabKZ5kaLVNZ4CtxA/ZiLA4=;
	b=Ujkwc01Dt4KC7iHTDtmh1vCfwZp7HfiPyn23fYpaFzw/vAguHwyFO7HAQFakJGXqf5
	geNYN6LH2ylqsvqeNIaLHb17Pth7nAn2sSf9h0QOe/Qo9rArai/Fl1slFRS85IBWJYMC
	TgY82cDn5xXjB2ycGNOwIZJyThaeNhBNCmcjI=
Received: by 10.14.9.201 with SMTP id 49mr3749222eet.199.1323763871032;
	Tue, 13 Dec 2011 00:11:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm86182462eeh.5.2011.12.13.00.11.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 00:11:09 -0800 (PST)
Date: Tue, 13 Dec 2011 09:10:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111213081057.GA3944@jama.jama.net>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Tue, 13 Dec 2011 08:18:06 -0000
X-Groupsio-MsgNum: 14109
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 07:04:44PM +0100, Martin Jansa wrote:
> * motivated by this NAK
>   http://patchwork.openembedded.org/patch/15777/
>   and today's discussion on #yocto I hope it's worth it to send this RFC

ping?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7nCJAACgkQN1Ujt2V2gBxlagCglj5JLPDV1/c8SotXhCg5AqjL
FcYAoJ2+HKD8kK1asz9E0q2emqU+t39Y
=e7xr
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
