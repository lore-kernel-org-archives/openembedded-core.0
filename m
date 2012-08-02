Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwwkZ-0002qu-EF
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:51:43 +0200
Received: by wibhm11 with SMTP id hm11so4518266wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wQdC+iHLxiZIFgxfwv3wHjfxQOPrle1WO5tw9mDvuZE=;
	b=J58uLuDeJUBhR9V+lrUz2UsoTS5S1hnB+bs/SezyB24eZLoT0XyXJ2F+PIUlQE1zYJ
	k8yT5c0rVljT8FstG5l2OCmePG2Nz5lNJDUKlWUqkKPDTci2Zmw/1Aw181BaFkRusOyb
	iqpQB+MUIdKKE26nXXgypdCcL0DDimjRto11vdvRuKNVp4uvX56szX0qF4aNPzeUokle
	MaKz1pwBS3JC+4ko5DFjkghJhQZ6xoJEX3PE6hb5piTYYNyPmBQCQC8B/A8/wHlThKeK
	mC0i1u7qEsyVbRLVJd9csAZMW7gQ9e4F5FOgkN1nrNoIj+fo9OL69kAPkrPRGverG14A
	z/zQ==
Received: by 10.180.97.33 with SMTP id dx1mr5247466wib.18.1343918404002;
	Thu, 02 Aug 2012 07:40:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm17683593wix.6.2012.08.02.07.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:40:03 -0700 (PDT)
Date: Thu, 2 Aug 2012 16:40:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802144001.GV16306@jama.jama.net>
References: <1343898530-11885-1-git-send-email-radu.moisan@intel.com>
	<20120802091010.GN16306@jama.jama.net> <501A6AA4.7030804@intel.com>
MIME-Version: 1.0
In-Reply-To: <501A6AA4.7030804@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] usbutils: Upgrade usbutils to upstream v002
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
X-List-Received-Date: Thu, 02 Aug 2012 14:51:43 -0000
X-Groupsio-MsgNum: 26796
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JcGvecxLhm+LytDG"
Content-Disposition: inline

--JcGvecxLhm+LytDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 02:55:16PM +0300, Radu Moisan wrote:
>=20
> On 08/02/2012 12:10 PM, Martin Jansa wrote:
> > On Thu, Aug 02, 2012 at 12:08:50PM +0300, Radu Moisan wrote:
> >> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> > Why not current 006? And lsusb link is not needed anymore?
> I really don't know why I chose 002, I'll follow with a new patch for 006

Can you answer *both* questions?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JcGvecxLhm+LytDG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAakUEACgkQN1Ujt2V2gBzoZACeMrn/bQVGadI/TfZ0t1/rHD1u
HwEAn3Nxrsgwm0HRf3qNFZva22pbfpew
=60hg
-----END PGP SIGNATURE-----

--JcGvecxLhm+LytDG--
