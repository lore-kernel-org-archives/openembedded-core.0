Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 90357734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:49:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id DF21A608E1A
To: "Burton, Ross" <ross.burton@intel.com>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
	<560A8690.1050809@collabora.co.uk>
	<CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <560AA4D7.3010609@collabora.co.uk>
Date: Tue, 29 Sep 2015 16:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Sep 2015 14:49:06 -0000
X-Groupsio-MsgNum: 71744
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="CwnpqRxXI5bdlBNpKoKwj3RflooXA4MnW"

--CwnpqRxXI5bdlBNpKoKwj3RflooXA4MnW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29/09/15 16:41, Burton, Ross wrote:
> On 29 September 2015 at 13:39, Andrew Shadura
> <andrew.shadura@collabora.co.uk <mailto:andrew.shadura@collabora.co.uk>=
>
> wrote:
>=20
>>    There hasn't been anything on this for two weeks already, has anyon=
e
>>    considered merging these patches?

> Sorry but they didn't quite make the M3 deadline (well, the patches did=
,
> but reviewing didn't as we were heads down trying to fix the build).  I=
f
> you can rebase and resend when master re-opens (when 2.0 is released)
> that would be much appreciated.

Cool thanks, at least I won't feel being ignored anymore :)

So, what is the planned date for the release?

--=20
Cheers,
  Andrew


--CwnpqRxXI5bdlBNpKoKwj3RflooXA4MnW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWCqTeAAoJEEFnG7NKhJOB1b4P/j3gS90UqaDzDDIKhv6t5Uw2
C//QVurBaiy8j8Pu7CKDiYLOa5IM9ry88v/ZrvmEzAGj32Et99G5bQgH2ohsdx0J
BHvrqYICAGzQxa0JUoH3JiBzDQpU/kdbIJkP+bOKCCYkAQJXvsNPj2grI9B5xISw
4L+P12d65jxFTpPCUWCXghm+kfDPtkPc6+CQegkZF/KFVtajF8cFmpbCZH0RKfbp
MjQixzjLYIuqel5vo6VJLNVorSFqvt95L/jqsc9W+VApAQlQoyRgIQ9VbAgYRY6p
CBFizZqyaV5LEX+Ibm3j75gfZLDcygzpNjnnN2zR/hPKDz0BoX18zei/ELDk235P
QrVEQoZ7N/GQC4YHfVRaxoiL9VP20GLgzB57BMNzJzc2wQ3lYXndXhcrhzKdHz8y
qZhUH/+9ebMgqRvcnLdbzawdSYXIrxMAPI1rKZg52ctjtqy7dS6Opk9wuNhLrl9V
qGagM8wNVfEYPHWtIDMoLpXnvIEgxltefTZti16sxWOC4ckQRgyegeQhYQ1xvLuX
ax092PzM/gTFhhyLo4bdt//I30af6BQTDfncT0+1fXyDJDpV6aDdnDiY/jng7M5u
/xbKTBQ/3xhQlVLBKGKh7L1J8GOr37YHJBMSXHdDceoMA+jL+9BHkVLF/7IllBib
V3s8FknXR1I+LF5QwBg0
=w5nO
-----END PGP SIGNATURE-----

--CwnpqRxXI5bdlBNpKoKwj3RflooXA4MnW--
