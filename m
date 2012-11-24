Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1TcDDi-0001Lv-06
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Nov 2012 11:44:22 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so5350598eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 02:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=Vnf1F2Lcx29fy7r+HWUOBx93lr6aWz1OAk5aoesZMDY=;
	b=EDqfnHuz5MP58rSkIJO0mcHO+QgRzx3B48GW9E0N07zm9qFmtnSrXLgE39zRNbiPip
	j2mk0BRLKUmKwDk9qGxYemwsMNrRgxalmeQU/NssPpM77+PFzZbAfD9OxtncYbKumVsQ
	QVsHOjiuQa/5V45yvZXDQ/7lewHqtdRpbtErE991eoKWiFwjjsWZHbDRVvudp6Q3/KGo
	kGzl/Ab58+jFC8cMYX9SvDF5jMOXuD7pyViDKzRte5GU6OFZxCplCA8zwZcbwAJkKpxn
	Att8DgZYa1VsSXDxi6Bd9U/eyOsdOZwK9Z6c1XGNtawq2WROpyVf6Lc6llV3a29tF3ka
	RP7A==
Received: by 10.14.214.132 with SMTP id c4mr2488520eep.18.1353753013182;
	Sat, 24 Nov 2012 02:30:13 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id u45sm13409555eep.0.2012.11.24.02.30.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Nov 2012 02:30:11 -0800 (PST)
Date: Sat, 24 Nov 2012 12:29:59 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <20121124102959.GA63007@gmail.com>
References: <1353749685-12585-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1353749685-12585-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQlaImWLOYXsK6PA8emv9DXUgDX7RWuITfUibHddssG4luu+8ao1EjDGr0T+fT5cHrkX9O5B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] automake: update to upstream version 1.12.5
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
X-List-Received-Date: Sat, 24 Nov 2012 10:44:23 -0000
X-Groupsio-MsgNum: 31725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 11:34:45AM +0200, Marko Lindqvist wrote:
> -PR =3D "r2"
> +PR =3D "r1"

Shouldn't it be "r0" for packages that change version?

Regards,
Eren

--=20
    . 73! DE TA1AET
      http://erenturkay.com/

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQsKGmAAoJEOM7bMm6HhcTTDAQAJAn7wFKsP6pP2TatovKObOD
DXL4qq8xt/DXVRO1mj769vx1CmMqO213JumnomBajASD317pJmfDY1QMe6m6T3Ui
hM4Qt3S4vs7pbovMp/LgsYTGql87d/5/iX0GMiEE37hRjnogIrQUKdV7W03slnNB
SzQfNNRXg4FjIXYm2pIQd833yZ5dhIYzFmB9l1zpVJkiFdVfxKoAXVyan3tcrOzd
Dg9LKjumY1MUldiPuBetlT/n+k0eH1b50hmrObX9yUCnUsq7joJ9Bez4lhgXl32N
GssAFoYumulFESIgnqPrlx4DkNtXMqGnCVdcvO++179Jd/yaD8I71V/DxCyBPfKD
Nn0vE9sXzVCFcNfBSU5RqPN03uDwQklKQK2CRFwzNYudwV3M0ihHXlCPHahSffkC
IeKeOsY1XacHjZXeJJNt9q7dtvLHClqb4IioHFQsKwurUVv5LYKwdWTvei652KPe
aE0djBo5LDB4hcIrM+9dRLRTaioNLX1P0su4t46a3gmeGiod4ClfijqdjKYsHdC3
Qkz/KzJvFzxX5n4jpxCECo5X4YOeYghOTppF5Ofcwm8wr5g+itImYKpvYCa/krRd
jwe14U+vbH3e7eb2HbAuTuLthDZo5kmbhKnp5uS0ZfQv6iB3RjOlP2MbPz+qk2OS
QiZudHKujgcIZn3hhm1g
=O856
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
