Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.15765.1594632584499831909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 02:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B4yzB4kLBz5tl9;
	Mon, 13 Jul 2020 11:29:42 +0200 (CEST)
Date: Mon, 13 Jul 2020 11:29:41 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: =?utf-8?Q?=C5=81ukasz?= Dywicki <luke@code-house.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Wireguard and wg-quick systemd unit location
Message-ID: <20200713092940.qtrhmzd6pqaxgdax@qschulz>
References: <096144b2-ab6d-9abc-ca9d-0ada7b52237c@code-house.org>
 <20200710130131.qlmwqq4hwrrnsbeq@qschulz>
 <357f8b8e-ac96-fbf1-a728-fd25f1dcb3b5@code-house.org>
 <6ac87daa-ebc3-42ef-d7f3-30253f721618@code-house.org>
MIME-Version: 1.0
In-Reply-To: <6ac87daa-ebc3-42ef-d7f3-30253f721618@code-house.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi =C5=81ukasz,

On Fri, Jul 10, 2020 at 08:54:36PM +0200, =C5=81ukasz Dywicki wrote:
> Given basic nature of the issue I was able to patch it quickly. It work=
s
> as expected. Thank you very much for the pointer.
>=20
> I am not quite sure which channel is intended for sending patches. Shal=
l
> I create bugzilla entry for this one liner?
>=20

Please send a patch since you already have the solution to your bug :)

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
should give you enough pointers. Should you struggle with it, let us
know, that means the doc can be improved.

Cheers,
Quentin
