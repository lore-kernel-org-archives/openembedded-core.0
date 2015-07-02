Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA42965C89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 01:29:41 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so35050199pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 18:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=h7P+68iTHClSBCJ6OEyJXPUNTbtrIPSU4cHY+6iSfQc=;
	b=WTgXFKjXs5hhpInnzlA6QMgi0F8rT/e5CD29Mj53u4KvMyVxkT3MYRIdplaGYAxu08
	OocpF4bCM56Kohb2hfn5vVzzhOw4QukwEqMXnpi0qdJDhvznshQ/AL/wrLQwfLvCH6mh
	cQQ5Kp+ZSmtqo6Hjy9FZmlVVq8cVOp0ziFvoqxkh99KTqaVTEfvCSk8qtx6zLLFMKkzl
	W9tKbe2Gjngln4BVilXvsK1sddJaHcrgy98CRQDoj/Vr9hiNeL5avzLAEcxZXBoU0i86
	ZZ2gsyjpRyQ+FuLdj3fXwkdncHpNhMF5stligcysJ016VSocrpJWSBWOenxBpKAAAAWb
	76zQ==
X-Received: by 10.70.40.164 with SMTP id y4mr60715718pdk.25.1435800581643;
	Wed, 01 Jul 2015 18:29:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4166:d3:8246:e1a0?
	([2601:646:8601:4580:4166:d3:8246:e1a0])
	by mx.google.com with ESMTPSA id kp2sm3615331pab.12.2015.07.01.18.29.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 Jul 2015 18:29:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZQ+uuo93aNFE9HegvvyQAK-qUR8+HUg0u9OAsXSOmf4Q@mail.gmail.com>
Date: Wed, 1 Jul 2015 18:29:34 -0700
Message-Id: <20A7D6DE-3D49-4723-BA57-3AF7A5F8065C@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<2112607f62fe5c4abf6ff958c88c03d066a719c7.1435774899.git.raj.khem@gmail.com>
	<20150701184816.GK2409@jama>
	<CAMKF1sq_n8fFTunuJ2jg_6hv0OjdAsUr4Z-UNPyRoGfNHO+3HA@mail.gmail.com>
	<CAJTo0LZQ+uuo93aNFE9HegvvyQAK-qUR8+HUg0u9OAsXSOmf4Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] wayland: Upgrade 1.6.0 -> 1.8.1
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
X-List-Received-Date: Thu, 02 Jul 2015 01:29:42 -0000
X-Groupsio-MsgNum: 67442
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D6BF9371-27C1-496C-AD42-3DCAE6C47853";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D6BF9371-27C1-496C-AD42-3DCAE6C47853
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4A6FB9D6-D45E-44AB-8F54-E48185B42BC0"

--Apple-Mail=_4A6FB9D6-D45E-44AB-8F54-E48185B42BC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 1, 2015, at 1:37 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 1 July 2015 at 21:25, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> amended both weston and wayland commit messages on pull branch.
>=20
> This is kraj/for-master, right?

yes

>=20
> Ross


--Apple-Mail=_4A6FB9D6-D45E-44AB-8F54-E48185B42BC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 1, 2015, at 1:37 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 1 July 2015 at 21:25, Khem Raj <span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"overflow:hidden" class=3D"">amended both weston and wayland =
commit messages on pull branch.<br class=3D""></div></blockquote></div><br=
 class=3D"">This is kraj/for-master, =
right?</div></div></div></blockquote><div><br =
class=3D""></div>yes</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_4A6FB9D6-D45E-44AB-8F54-E48185B42BC0--

--Apple-Mail=_D6BF9371-27C1-496C-AD42-3DCAE6C47853
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWUlAMACgkQuwUzVZGdMxQGkQCfVfGMWDQ+eYbCOQrRjnvygaz5
Y/0AnjLTMAaLpCowzhKKQjhhX21VTCdz
=5VPi
-----END PGP SIGNATURE-----

--Apple-Mail=_D6BF9371-27C1-496C-AD42-3DCAE6C47853--
