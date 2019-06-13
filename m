Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 814367E090
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 04:23:06 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id k13so14886202iop.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 21:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=UqbEbQVXwR5I34KhHY3T65QDClnOxuN3bNzNqQZDDTI=;
	b=j0BVhElAUE9f1dNpO4biHnpQ+S0U7GgVjxVoZ8SGFHj9o25BWZq9FBt9J37G+07mhs
	E9qFzbT4XHyhzG+a6fZTkmTXWZaYMCqP82Djk0zZCoq75C445DHkrhsHioPxEwRCS0rq
	Ee4//P9RkqLbNrOkgoOlfOexvkv1o8JcnJqf3bcO8ShYGQmB8Ac4Ns9lytQixN3JtUaX
	byVNdP/P+oQaPJH2s/w+w8StU9iA6vgbo329RNBRNxem59AhjIvo95ljLPCnZMh36pzg
	D11a+zVqMycnjWwR1lccuBHiyzSAYXNCyXxqtd2kCqMJutA56PgfNZzBrWZdxCkrNsho
	2I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UqbEbQVXwR5I34KhHY3T65QDClnOxuN3bNzNqQZDDTI=;
	b=UMCaLaMveqZSMr7yVMC8yIhbL9fpyVXmrxqT6YipGP3ZUTdRgyrJXH7d7KykFfqGfE
	zNUPGym9usib7E6G92TITv3SJWqlBeKYGRQWnATuINLDPMphYZZzLGmXWFLoEZo57+Yf
	VR8fC7D9/hDdEeH5a5WwjasHCU5HYc71323oVynYRbNii7qePhrYf8LIEa7VoH1OCru/
	c4mapAl9vuCuP0KNyF3udpAc2RoV0HRCS0omJiAft9giA9Yl96kirFBxlWyaoxEEgj++
	1K4LSZLgKsCOhwHK7qEo8CGTPHUXN9k+Yd9NouhsecNPCSRpCPtfrPKz7neWzWV7ZuxJ
	9csg==
X-Gm-Message-State: APjAAAV4AvGCICysK8RakrqUaR1hMSzKsWRETOBMx/YURIyCfLDdEcYD
	oMkqCx8XDzwx2XE5m08wRtvwOhudpW8U28u9cIw=
X-Google-Smtp-Source: APXvYqx/uPHKOSmO6nwhkJPOPHkHziAyOF7Eg7AlT7gUOVtfXaCaV9SRK+z4vCvYcLX8bWG4ILQ5o+obxdezQwAevcs=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr17801999iof.142.1560399787657;
	Wed, 12 Jun 2019 21:23:07 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Jun 2019 21:22:56 -0700
Message-ID: <CANx9H-BtwDCHvbZYTXo-w8rm+=o_EWt1aX+9ZEFSjCweB9wvyA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Thank you for scons cleanup
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
X-List-Received-Date: Thu, 13 Jun 2019 04:23:07 -0000
Content-Type: multipart/alternative; boundary="0000000000000d0ddc058b2ce313"

--0000000000000d0ddc058b2ce313
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hope to have a chance to test, but I truly thank you for doing the right
thing. In hind sight I was rushing a little bit to get this =E2=80=9Cmajor=
=E2=80=9D change
into M1. And we are catching and fixing the fallout. Just as intended.
Great team.

=E2=80=94Tim

--0000000000000d0ddc058b2ce313
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I hope to have a chance to test, but I truly thank you fo=
r doing the right thing. In hind sight I was rushing a little bit to get th=
is =E2=80=9Cmajor=E2=80=9D change into M1. And we are catching and fixing t=
he fallout. Just as intended. Great team.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">=E2=80=94Tim</div>

--0000000000000d0ddc058b2ce313--
