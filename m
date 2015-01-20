Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6A34671144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 20:12:28 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id z107so9894452qgd.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 12:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B3OHbxLycpsewSAj3vZmqnX7nnVIk/1779pgGVGq5kg=;
	b=a8E4xgz5DI5DTEUInOCCddY2upIRbJL9fcByZdTXRUxqgidAYFf68XEnfN7/51no46
	UCZuTAl5FNnMnD5VTrGapKNWEr03WYFZgw16nwKap9392sTslx3wc/8cCpCNeteYdq9d
	wYWkZXlANX0/0boYfsrcx95CVrGRYOMT2Btiyt8u+f3uYIjoDQCHh4d5KeOtjy+9IMvo
	4Wsrnc90b7mEcPqOvh/GVY3dZJjdZYaDz/xc8lOVnnaasR0lISIMABTlE0hmZWx5nyQ6
	Y5MMapQeEuUrta4ZP5OZ6PFHP6FPucBz2aZ9zGrARKzl9JZXfVK8JKfSkgewGeymg0Re
	G84Q==
X-Gm-Message-State: ALoCoQkBWXUMaNWM+bx3hlS8jxd2JiGaVDE+VhWsVnYDAaDMH0IMaZDJEOldb1VQDOKPcFL9vmBx
X-Received: by 10.224.93.6 with SMTP id t6mr61137587qam.93.1421784749456; Tue,
	20 Jan 2015 12:12:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 12:12:09 -0800 (PST)
In-Reply-To: <20150118170615.GB2454@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<20150118170615.GB2454@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 20:12:09 +0000
Message-ID: <CAJTo0LZpQTPeO4PZpDeVudqTdC84p2qmBp=JYVbyNBjSkPXsoA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/4] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Tue, 20 Jan 2015 20:12:36 -0000
Content-Type: multipart/alternative; boundary=089e01495028f0575d050d1b0e0f

--089e01495028f0575d050d1b0e0f
Content-Type: text/plain; charset=UTF-8

On 18 January 2015 at 17:06, Martin Jansa <martin.jansa@gmail.com> wrote:

> Ping, this patchset is stalled since July 2014 :/
>

Whoops.  Merged into my mut for testing.

Thanks for the reminder!

Ross

--089e01495028f0575d050d1b0e0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2015 at 17:06, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3nb" class=
=3D"a3s" style=3D"overflow:hidden">Ping, this patchset is stalled since Jul=
y 2014 :/<br></div></blockquote></div><br>Whoops.=C2=A0 Merged into my mut =
for testing.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Thanks for the reminder!</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--089e01495028f0575d050d1b0e0f--
