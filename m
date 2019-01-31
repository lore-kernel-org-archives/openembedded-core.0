Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id B36236C4F2;
	Thu, 31 Jan 2019 07:26:15 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id a16so1549699lfg.3;
	Wed, 30 Jan 2019 23:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jJdIzAK0xRlmPbsM+2f0JTkyevzALH20AG2uP+tf+ig=;
	b=ueS5maEIE/kHwNKHUFL0iRQKVf+jNjSSHX+brbzbq6/P7OOrJftawQ/4Ap+2titp3K
	SbsVM5/lH9mx3p2HLZd/KTmJP9FozSNVnnajPFpKti0QMs+5jaAH0gzA0PXitL32HW+u
	ncD6JdAJyHU1TkbE7vKT97ZErydgektEp5LgQunlGUxvOgBRnugMUheJkOUzsjFNOkRF
	V43DD6P1lfvx9vB9OTWszGgAHXphHfYKrVNuzb7KbBnutY0g8mkrUKz9ZnqKexHqwaT2
	tKEZMXzwsXdqxug+HhVPFQtwBuUMbCe4uOhkaUI5WUT7Lje2ydT0EhEv1O1pXrqVpSgP
	x6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jJdIzAK0xRlmPbsM+2f0JTkyevzALH20AG2uP+tf+ig=;
	b=DdvsYxUzFP48cPV7eLcR8Tfnw9brdc8a6Qm8yw5dQnGSW+0HsXVNfnTXmB/C47hAxs
	omjusJV0PpCriU6W3zAoDCsquXi9YtarPlXR4+vQoC9PEqW0mjpsaDnMxCb3dhKrBAyK
	ESfsKIaMvUKQ9LdvGNz/53ZDN5cCo6haKsNfWnyQwTrf0S/a8moe5ncPiwkKjoWmZi53
	McXL69p3zTHOjLLSzNRZPLjrM0EOdH1FeYI8xN5PP+mfJa8rOG3hqswqvvbmxep4RxhI
	ZZxkCoV+8Rgd8fbTSNpAdZmRKMCy8sjJghS43/aBFPEaOrFgYtsuYh01bE6e+IJvdhoL
	xqpA==
X-Gm-Message-State: AJcUukeGCgGy0fcvnmWJoRwofQaE5EI18TQ2Z1364OLg23RoQ3dpwal3
	EpUobn9DQ6GEn9gBdxXsRQQPMJi6lyfsTtxZXEE=
X-Google-Smtp-Source: ALg8bN4df1O8FqsZ6G6KGDKkD+1yNFMIsZYn/+v1U3IEv2rGWSM7kKwmMckD7yiKtietQTuygiHSoI5k92XG2OnUfNA=
X-Received: by 2002:a19:c995:: with SMTP id z143mr25731433lff.79.1548919575961;
	Wed, 30 Jan 2019 23:26:15 -0800 (PST)
MIME-Version: 1.0
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 31 Jan 2019 02:26:04 -0500
Message-ID: <CAHUNapTBZZRA4+RiFLVHYX6CAkAC8_s9jA0KrFc8Rvs0ksLG-Q@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE Summit @ SCaLE 17x - Sunday March 10th 2019 - Pasadena CA
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
X-List-Received-Date: Thu, 31 Jan 2019 07:26:16 -0000
Content-Type: multipart/alternative; boundary="0000000000001c67090580bbf15b"

--0000000000001c67090580bbf15b
Content-Type: text/plain; charset="UTF-8"

We're excited to announce the inaugural "OpenEmbedded Summit" taking place
Sunday March 10th 2019 as part of the Southern California Linux Expo
(SCaLE) 17x at the Pasadena Convention Center.

For the past few years there's been an ever-growing OpenEmbedded event as
part of SCaLE. This year, with the missing Spring ELC, we felt it was time
to do something more "formally" so OE enthusiasts could get together
without having to wait until August.

The initial suggestion for this summit came at last year's OEDEM in
Edinburgh. At that time an idea was also floated to hold this year's OEDAM
at the same time. Just to be absolutely clear: this suggestion was
rejected; there will be no OEDAM at the OE Summit at SCaLE 17x. However,
this summit is taking place with the full approval of the OpenEmbedded
Board of Directors, many of whom have also been helping out with its
organization.

The schedule for the OE Summit has been posted:
https://www.socallinuxexpo.org/scale/17x/schedule/sunday
https://www.socallinuxexpo.org/scale/17x/open-embedded-summit-0

So if you're in the Southern California area, or are generally interested
in hanging out with some OpenEmbedded people, please join us in Pasadena on
March 10th!

Your OE Summit organizing committee:
  Tom King
  Behan Webster
  Trevor Woerner

--0000000000001c67090580bbf15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We&#39;re excited to announce the inaugural &quot;Ope=
nEmbedded Summit&quot; taking place Sunday March 10th 2019 as part of the S=
outhern California Linux Expo (SCaLE) 17x at the Pasadena Convention Center=
.</div><div><br></div><div>For the past few years there&#39;s been an ever-=
growing OpenEmbedded event as part of SCaLE. This year, with the missing Sp=
ring ELC, we felt it was time to do something more &quot;formally&quot; so =
OE enthusiasts could get together without having to wait until August.</div=
><div><br></div><div>The initial suggestion for this summit came at last ye=
ar&#39;s OEDEM in Edinburgh. At that time an idea was also floated to hold =
this year&#39;s OEDAM at the same time. Just to be absolutely clear: this s=
uggestion was rejected; there will be no OEDAM at the OE Summit at SCaLE 17=
x. However, this summit is taking place with the full approval of the OpenE=
mbedded Board of Directors, many of whom have also been helping out with it=
s organization.</div><div><br></div><div>The schedule for the OE Summit has=
 been posted:</div><div><a href=3D"https://www.socallinuxexpo.org/scale/17x=
/schedule/sunday" target=3D"_blank">https://www.socallinuxexpo.org/scale/17=
x/schedule/sunday</a></div><div><a href=3D"https://www.socallinuxexpo.org/s=
cale/17x/open-embedded-summit-0" target=3D"_blank">https://www.socallinuxex=
po.org/scale/17x/open-embedded-summit-0</a></div><div><br></div><div>So if =
you&#39;re in the Southern California area, or are generally interested in =
hanging out with some OpenEmbedded people, please join us in Pasadena on Ma=
rch 10th!</div><div><br></div><div>Your OE Summit organizing committee:<br>=
</div><div>=C2=A0 Tom King</div><div>=C2=A0 Behan Webster</div><div>=C2=A0 =
Trevor Woerner<br></div></div>

--0000000000001c67090580bbf15b--
