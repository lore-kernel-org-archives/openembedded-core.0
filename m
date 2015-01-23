Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3F17972718
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 10:48:48 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id x12so5188452qac.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 02:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7MlSyeOCnMKGU/1Q9qbNciHbsRzua/5xxgphz4A5vVA=;
	b=fx6rexQovKu+m9bKterayxKc5cQjgzbYVHrYDbfUNk4usLJdBeBqNh3wSrcSL2d3YV
	Jgz0KYK+P5VgrmznqTg+5b8Ndy/QUouM+snO7pfojQk0n6a3Nm+Vej2l0JMBfZamYTmT
	m72QKDtsJ5tDxhaBQjTbJ/BHbuCTpv2GSCMJUOaTMQOoTOK/aowZItlXU9/eRdSrHgQU
	fwNxbgMbZP/0ChzoxGUHHOWl+0bOr0YoMv0Yc/mQ306d6JhCNomwk36zVStHej3IAA7E
	TipTCNCnM3S9cjrKEuI3eRBDDXmkvdfvi6AqKtObgt+vuPHuLocfXZL2tRUvuIvj3YQv
	npmQ==
X-Gm-Message-State: ALoCoQksLHy1DjO8DiKPOTq5jaU1Q+Wv10Brg4vOLTYdpm09bU38/bERHTvc1PiKmoCXEjmXlcOd
X-Received: by 10.140.92.138 with SMTP id b10mr11860736qge.59.1422010128415;
	Fri, 23 Jan 2015 02:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 23 Jan 2015 02:48:27 -0800 (PST)
In-Reply-To: <CADO9-pf1mA5ykXAnGnArDxTcK3a39zy=VcDMo68k77fNVWs2mw@mail.gmail.com>
References: <CADO9-pf1mA5ykXAnGnArDxTcK3a39zy=VcDMo68k77fNVWs2mw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jan 2015 10:48:27 +0000
Message-ID: <CAJTo0La=KJweGLdAFcLZ1_5ZJ7BiDW6oZqBRKnH-aLtDtcE4QA@mail.gmail.com>
To: Yong Li <sdliyong@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Add XFCE image build bb file
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
X-List-Received-Date: Fri, 23 Jan 2015 10:48:56 -0000
Content-Type: multipart/alternative; boundary=001a113a5d5e925da2050d4f8847

--001a113a5d5e925da2050d4f8847
Content-Type: text/plain; charset=UTF-8

On 23 January 2015 at 07:55, Yong Li <sdliyong@gmail.com> wrote:

>  meta/recipes-graphics/images/core-image-xfce.bb | 16 ++++++++++++++++
>

This doesn't belong in oe-core, add it to meta-xfce instead.

Ross

--001a113a5d5e925da2050d4f8847
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2015 at 07:55, Yong Li <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sdliyong@gmail.com" target=3D"_blank">sdliyong@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>=C2=A0meta/recipes-graphics/im=
ages/<a href=3D"http://core-image-xfce.bb" target=3D"_blank">core-image-xfc=
e.bb</a> | 16 ++++++++++++++++</div><div></div></blockquote></div><br>This =
doesn&#39;t belong in oe-core, add it to meta-xfce instead.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a5d5e925da2050d4f8847--
