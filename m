Return-Path: <just4tech83@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 747416FF9B;
	Tue,  5 Jan 2016 13:09:09 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id es1so1255778obc.2;
	Tue, 05 Jan 2016 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OxTJwChB6XDBKsPIFgwsbBKhdJpK4NO/307tdFevFhE=;
	b=FnkVdnhLovCm+Q77pzaAV74G1H1Thi7ruaas08v51ZCqXOH14Ut8BO7+3jr++rNms4
	9EBYuHqjfzl4FD9qTXOrO5Biln9bdgk2Kl7fgCuT3gqpQ0x4cpWc0/3vuugT7JujrK9p
	4ET6J0d17k9LelBANj1EFFRwIVJx7EvTh7DoE1zp2XkW0klLZa9gKipwX3yg9UjlWyto
	vrOiz1p7gZr7jPHokdohcrLjplLIaj5IKNLylfkjWz9o/nJUzBGjs5W/WKC1HnHbLrK2
	oZf+jljLaqTLbIzN2E5oVK38zN3b1LxKb0jWVR56dJQbNGwFikyw/aIa0IZypsUs0nL+
	jtMQ==
MIME-Version: 1.0
X-Received: by 10.60.246.135 with SMTP id xw7mr35322220oec.37.1451999350491;
	Tue, 05 Jan 2016 05:09:10 -0800 (PST)
Received: by 10.202.71.10 with HTTP; Tue, 5 Jan 2016 05:09:10 -0800 (PST)
Received: by 10.202.71.10 with HTTP; Tue, 5 Jan 2016 05:09:10 -0800 (PST)
In-Reply-To: <CAD2C2VSOXLTPM-yu6JFajf0LMHoE1t3utWG0vLFUzERcZs+7HA@mail.gmail.com>
References: <CAD2C2VSOXLTPM-yu6JFajf0LMHoE1t3utWG0vLFUzERcZs+7HA@mail.gmail.com>
Date: Tue, 5 Jan 2016 18:39:10 +0530
Message-ID: <CAD2C2VRiUjiSFPHC+6KSyp_feBq0xhNeTgLJQdKyHF11kPuRCA@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-issues@lists.openembedded.org
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
X-List-Received-Date: Tue, 05 Jan 2016 13:09:10 -0000
Content-Type: multipart/alternative; boundary=001a11368fca801b51052895f18f

--001a11368fca801b51052895f18f
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: "Bryan" <just4tech83@gmail.com>
Date: Dec 18, 2015 1:03 PM
Subject: korean/chinese keyboard layout support on yocto
To: <openembedded-core@lists.openembedded.org>
Cc:

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

--001a11368fca801b51052895f18f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">---------- Forwarded message ----------<br>From:=
 &quot;Bryan&quot; &lt;<a href=3D"mailto:just4tech83@gmail.com">just4tech83=
@gmail.com</a>&gt;<br>Date: Dec 18, 2015 1:03 PM<br>Subject: korean/chinese=
 keyboard layout support on yocto<br>To:  &lt;<a href=3D"mailto:openembedde=
d-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>=
&gt;<br>Cc: <br><br type=3D"attribution"><p dir=3D"ltr">Hi, <br>
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
</div>

--001a11368fca801b51052895f18f--
