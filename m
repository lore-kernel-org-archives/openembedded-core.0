Return-Path: <fpiechocki@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2788F60C19
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:37:41 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so581359lbd.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 04:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VIS/WGLpQNtOtuJdXpb/iOiFtguXVywQyf+JLpWtVvA=;
	b=VJdrDZPZtZGxEW5UNBR01Tv1evqRp4HOdooyqbMFdtOGNaCt3sNU+BC1oNOQndGl3O
	KjHrCt7MjtAuv1xdFbGxrqJA4sw65IIEYu5cA5frSYslsWv2kDeiVk4NlYzTg6xExZeM
	F1NHDWFqfmsItNTTgG55rQzliTDVOjLWTU92wa91dW1VryA/k7P314j90BjginAgHlHc
	qnmb3QW5CjA/PcsDffDK353lD5k47Zwm6Wh2qQcse+4B4iRS4kcKFm4qjh734bnhzvaq
	ksXqj3Bl8dqJOI4visdRA9RPNRjnwurQ5Nu3rjg5KV8epatiMekIjaxdc9ypC4QTWqpC
	CAUw==
MIME-Version: 1.0
X-Received: by 10.152.87.140 with SMTP id ay12mr2320885lab.1.1393418261593;
	Wed, 26 Feb 2014 04:37:41 -0800 (PST)
Received: by 10.112.199.103 with HTTP; Wed, 26 Feb 2014 04:37:41 -0800 (PST)
Date: Wed, 26 Feb 2014 13:37:41 +0100
Message-ID: <CAALoMC0Q=On1S-w99bK_JFZxQLanBdR3BySa3fAYwKV6WLf4RA@mail.gmail.com>
From: Filip Piechocki <fpiechocki@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: how to install FreeSans.ttf
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
X-List-Received-Date: Wed, 26 Feb 2014 12:37:42 -0000
Content-Type: multipart/alternative; boundary=001a11c34e0c8182a404f34e780b

--001a11c34e0c8182a404f34e780b
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I've built rpi-basic-image from poky's dora branch with omxplayer installed
but it complains that cannot find "fonts/FreeSans.ttf" font (and is right
here). Also Qt5 apps display squares because cannot find any fonts. What
recipe should I bake to get this font (or any fonts) installed in the image?

Best Regards,
Filip Piechocki

--001a11c34e0c8182a404f34e780b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>I&#39;ve built rpi-basic-image from=
 poky&#39;s dora branch with omxplayer installed but it complains that cann=
ot find &quot;fonts/FreeSans.ttf&quot; font (and is right here). Also Qt5 a=
pps display squares because cannot find any fonts. What recipe should I bak=
e to get this font (or any fonts) installed in the image?</div>
<div><br></div><div>Best Regards,</div><div>Filip Piechocki</div></div>

--001a11c34e0c8182a404f34e780b--
