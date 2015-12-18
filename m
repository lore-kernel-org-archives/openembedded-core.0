Return-Path: <just4tech83@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id D5656731B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:33:36 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id iw8so74138729obc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 23:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1oanILXKdWMhS7Ei+FTLqQ6J91AaYwMdZMgZdUuh6Ks=;
	b=kfdfd+UcPCi42eWzo/ebsgF/gKYpudlFGq8mJ8odnvQzqA9GAK9igwSZFSSEUIbvnQ
	Y1K6WY4kexSOAQjo9LffmGJlRZBSoflQV5T+iGOZTO53+KjMjronV+pYLY8TEgudZDR0
	q+0vxcHzWkkyTpw7gEQ1n1hC6l6gZdyOnelNQLP3xm2xbd8kdMEDySRfSg9I6RoB0WrP
	wJLyznpWiJGV52VohL9USIHEaRLw5nwpx92O8Ki8lSS5yvYQ/5QvxtOee2ewPZcv+7p2
	nO9JfbI2ErQqqSX7RnliVlc2YPnBAyFviEp8ICvb8l592jl9J0dECDmGjnH4fvPmK/x5
	vzfA==
MIME-Version: 1.0
X-Received: by 10.182.247.9 with SMTP id ya9mr902418obc.50.1450424017420; Thu,
	17 Dec 2015 23:33:37 -0800 (PST)
Received: by 10.202.0.204 with HTTP; Thu, 17 Dec 2015 23:33:37 -0800 (PST)
Received: by 10.202.0.204 with HTTP; Thu, 17 Dec 2015 23:33:37 -0800 (PST)
Date: Fri, 18 Dec 2015 13:03:37 +0530
Message-ID: <CAD2C2VSOXLTPM-yu6JFajf0LMHoE1t3utWG0vLFUzERcZs+7HA@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: korean/chinese keyboard layout support on yocto
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
X-List-Received-Date: Fri, 18 Dec 2015 07:33:38 -0000
Content-Type: multipart/alternative; boundary=089e015380525518b50527272863

--089e015380525518b50527272863
Content-Type: text/plain; charset=UTF-8

Hi,
    I am working on yocto poky-dizzy 1.7.1 and have developed some
application on top of customized os image. I have a reqirement to support
korean/chinese keyboard layout for application.
I have added cross complied libraries for  ibus-hangul pckages. Can
somebody suggest me how can i add support for keyboart layout and how to
enable automatically.

Is there any bitbake recipe available to support these keyboard layout.


regards
Bryan

--089e015380525518b50527272863
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi, <br>
=C2=A0=C2=A0=C2=A0 I am working on yocto poky-dizzy 1.7.1 and have develope=
d some application on top of customized os image. I have a reqirement to su=
pport korean/chinese keyboard layout for application. <br>
I have added cross complied libraries for=C2=A0 ibus-hangul pckages. Can so=
mebody suggest me how can i add support for keyboart layout and how to enab=
le automatically. </p>
<p dir=3D"ltr">Is there any bitbake recipe available to support these keybo=
ard layout. </p>
<p dir=3D"ltr"> <br>
regards<br>
Bryan</p>

--089e015380525518b50527272863--
