Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C3E4471A8C;
	Fri, 26 Jan 2018 19:43:34 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f71so3383869wmf.0;
	Fri, 26 Jan 2018 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=5/DblxUgbZv4jqzO/MgCj9gcvgoq75L3Hfr7cj/cUFE=;
	b=b7wCqyVWyCx8q1DXRRoRUqKM3wfgSOo2Y9iFpiaFi5rMNK6ECmI0aePlloOZMYDETX
	tE+3l5QpN2xHW78JBQ6JWBGiCK7NA0vOLSTNZZuT8NtemL9v6/EuSPNedT6DpMIJVW3f
	MqKmbv6FOEepPWiF+c4FHziuB2wg7/UjzLfW1imN7Ov8alkuPza81ia5Qo+dg4ExWMX9
	9lqGJ2euCAqk9mbdPge6acwynpcYr6gM8wpB6gn7q/CFOeF0VBS7l0Rctt0bcB5D2Z/v
	BcCtvF2kHiaen6f0bvMHHlyEtX5NAggegwm7xyTtxdQ/E8Lyn96ntSeP2xw00Bz/zJ0a
	bX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=5/DblxUgbZv4jqzO/MgCj9gcvgoq75L3Hfr7cj/cUFE=;
	b=tKh56sFHV5UqJQqQabDZEXvi+IBWpEGKLD1mLSFiRlY6GY6X1XeJJ9L0T9PA7TD1jc
	2OQifCJeKg+hvvSRYme5ROkRiDtK2bwP3xtvWAL3lTn6LCIwT00wCUb+WI3aMlgxjqko
	JMCeiVfh7R96S8fBbw/jRx5Abs4Q2uzDF/x+rfTErV6J55lZdxGvF2yaT2r4gUh/GeRY
	xc1o3pRQBBa4CC8xr6QH2utfA3sONoOTxrsDHX3dgRejRj8kv5IaqdZ1ztEDsygaj7b+
	a6e+btZ3Y5rxiiJJjLB/qfa1ZU9f+vS4z4w20NTINg5MJbTdtCoDsdQDdubHyEE0UbCd
	Q+Wg==
X-Gm-Message-State: AKwxytfITlT82vvdJPTeIfyx0VYYfynJGGTta73nTlWJzT7E5o6ZPAYR
	s1iWORWm6RwzzlYh75XkZOqGDIydAECrSDi2KmaGAE26
X-Google-Smtp-Source: AH8x224ziNvulMIy1pRRBM6ocO2lpAjlS+F28xjhSYdcLI1tE6k0gMHNb8U+hB2qPvla6L+X387xZ7NKsNIc8F3qDaE=
X-Received: by 10.28.125.68 with SMTP id y65mr11229394wmc.106.1516995814809;
	Fri, 26 Jan 2018 11:43:34 -0800 (PST)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.48 with HTTP; Fri, 26 Jan 2018 11:43:14 -0800 (PST)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 26 Jan 2018 11:43:14 -0800
X-Google-Sender-Auth: NYvLROb1uz8DhpxTSkMw-nM3MKs
Message-ID: <CA+YB3rYK3Voqa7XgPbuuauko6MYeK4yaZMqY6bmVfn4_SBDvgA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org
Subject: OEDAM
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
X-List-Received-Date: Fri, 26 Jan 2018 19:43:35 -0000
Content-Type: multipart/alternative; boundary="001a1142107caae79d0563b31c61"

--001a1142107caae79d0563b31c61
Content-Type: text/plain; charset="UTF-8"

The time for ELC North America approaches fast, and many of you are
planning travel.

We have set up an OEDAM (OpenEmbedded Developers' American Meeting) on
Sunday, March 11, the day before ELC starts. The meeting will start late to
enable people to arrive that morning. Lunch and coffee etc are provided by
the grace of Mentor Graphics, where the event will be held.

If you are able to attend, please add your name and any agenda items you'd
like to see on the wiki page.

https://www.openembedded.org/wiki/OEDAM_2018

We are planning to at least webcast the meeting - ideally we will make it
interactive remotely as well.

There is also a general remote meeting set up for February 21 to discuss
agenda items for this meeting, please feel free to join.

thanks

-- 
Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation

--001a1142107caae79d0563b31c61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The time for ELC North America approaches fast, and m=
any of you are planning travel. <br><br></div>We have set up an OEDAM (Open=
Embedded Developers&#39; American Meeting) on Sunday, March 11, the day bef=
ore ELC starts. The meeting will start late to enable people to arrive that=
 morning. Lunch and coffee etc are provided by the grace of Mentor Graphics=
, where the event will be held.<br><div><div><br></div><div>If you are able=
 to attend, please add your name and any agenda items you&#39;d like to see=
 on the wiki page.<br></div><div><br></div><div><a href=3D"https://www.open=
embedded.org/wiki/OEDAM_2018">https://www.openembedded.org/wiki/OEDAM_2018<=
/a></div><div><br></div><div>We are planning to at least webcast the meetin=
g - ideally we will make it interactive remotely as well.</div><div><br></d=
iv><div>There is also a general remote meeting set up for February 21 to di=
scuss agenda items for this meeting, please feel free to join.</div><div><b=
r></div><div>thanks<br clear=3D"all"></div><div><div><br>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Jeff Osier-Mixon - Open Source C=
ommunity Manager, Intel Corporation</div></div></div>
</div></div></div></div>

--001a1142107caae79d0563b31c61--
