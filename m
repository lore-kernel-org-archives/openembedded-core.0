Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEEF734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 1BB67608E1A
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
	<560A8690.1050809@collabora.co.uk>
	<CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
	<1443538247.5162.43.camel@linuxfoundation.org>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <560AA5A1.1090309@collabora.co.uk>
Date: Tue, 29 Sep 2015 16:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443538247.5162.43.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] dbus: merge .bb and .inc
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
X-List-Received-Date: Tue, 29 Sep 2015 14:52:22 -0000
X-Groupsio-MsgNum: 71747
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uh9lCqA4UbwOi3cngtrn9qrbiiljWKHDT"

--uh9lCqA4UbwOi3cngtrn9qrbiiljWKHDT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29/09/15 16:50, Richard Purdie wrote:
> On Tue, 2015-09-29 at 15:41 +0100, Burton, Ross wrote:
>> > On 29 September 2015 at 13:39, Andrew Shadura
>> > <andrew.shadura@collabora.co.uk> wrote:
>> >>        There hasn't been anything on this for two weeks already, ha=
s
>> >>        anyone
>> >>         considered merging these patches?
>> >
>> > Sorry but they didn't quite make the M3 deadline (well, the patches
>> > did, but reviewing didn't as we were heads down trying to fix the
>> > build).  If you can rebase and resend when master re-opens (when 2.0=

>> > is released) that would be much appreciated.
> Just to add that what would help is a little bit more explanation about=

> what happened in the patches. It looks like dbus-glib isn't needed for
> example but the commit message doesn't mention why?

Thanks. I will update the patches when I submit them next time.

--=20
Cheers,
  Andrew


--uh9lCqA4UbwOi3cngtrn9qrbiiljWKHDT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWCqWhAAoJEEFnG7NKhJOBLBYQAJXrC0f8o2asNFAEjxKIn0g3
LP3kV4Zl5HOeq/JD9MxHAkvd9GvGXGTwx1wootB491n6PH7u6prepw2X7+yjzC2I
deuqnM7bZLYL2a9AAhGM4J0d3jZQdkUNh79LKUVDbymlUoMaVyZ1oDgm4+I7jFRu
367/8UWua8TrPwOhw0T/D0tbNv20n6AyYpne2B0EX79iR5jlIh6GfTZLji+sLqY+
obObDj9m2gdC8oU83WmGXTwohcdfMS7xV3zlI8LDHfU9BLVR4Mhl1ZPpiYt/F0oo
jwBPX5fw3fEniZJt7bAWR5+FCoCj5CKhcDPQA5bSA1eEydqX7d029/LGjcdY2kN+
lV5UZOSYqFn+OUIzgtvly4NZqZIoXKhR2j1HIHE9wDw/1Ar392rbwAOSn/iM6ujh
BgUg0Wka39Znx5agyqUyUcph1k43qVSjWSadCSscFIU3BuZoEmrsKYTZyLDoqBBe
h33ThuCEaq7IiMjMaflkoiAnP3Nl9wqxCdg87WLuH0HSba0E3DAM0rW/r/ooKJSd
rX96VYNOSjA2TWYsB1IwpNwxWMQkR9hdqPw1sFKOZ1D6NrCTmgZRq4E4aT/ZwAAr
FGKwP16YQj0QOq9Hg3z6qZO6gQqx1y+dxICXJIjQFF975cc73FSoIAktQ54mtA1a
dwpZ4/C3r/Izs3EgLE7R
=X611
-----END PGP SIGNATURE-----

--uh9lCqA4UbwOi3cngtrn9qrbiiljWKHDT--
