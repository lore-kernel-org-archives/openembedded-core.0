Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8B13A718E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 19:58:15 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f51so18632642qge.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7p6unCQe3r9OX6/Jdcw1SKqkt+RyMRGnefaRvJJqkn4=;
	b=aX0Vo72kvm2Qho8mWwZM2K67Y7rK+iLmtQEs0bUN5wePDxzM1aPEDRtisxGEm1lsni
	jZHmAui/0I3RHIRNlJrAHe1ciDQqE+yhuAPI4Jx48WbfFG0erX5pTYa6tExTnYoUE5JG
	vgWsvZjwW7SQYugO6RGn86iZlkN+dpzzGrgdcQ3XCNRPxYs4Uj6I4FPXdzHs/DvrVEwk
	BgVgE6mvgqDLKso8+CeDmtMBZBmG+rdhflnAt2EhLow2XhwSWpFLeixWxHnz8kS5s2L7
	0Wdxz8FI3NvttZ6PqAGw8chdgSvPLJVmHhXswAZqnVqbj3Cwc1O54SJVsgfyTXeK8kIp
	5H2Q==
X-Gm-Message-State: ALoCoQmY4xEe1dnNYaZuVpjR2NBF+sBo6KK6dT9y4HqjOh0/wQ9XpYtO7UplBvLxLIRNe5AezCox
X-Received: by 10.140.49.5 with SMTP id p5mr5259qga.15.1422475095702; Wed, 28
	Jan 2015 11:58:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 28 Jan 2015 11:57:55 -0800 (PST)
In-Reply-To: <CACS+7ZQwn67gxNP0HMTxksmW1qoRu_9nas2a-Wzow8wWaWu2zQ@mail.gmail.com>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
	<20150128134756.1cce32c4@bottazzini-ThinkPad-T430>
	<CAJTo0LZhj=0AMXXbeXdiUuRBty9qTMX_ba6Z=u=dbhR+v3d+MQ@mail.gmail.com>
	<CACS+7ZQwn67gxNP0HMTxksmW1qoRu_9nas2a-Wzow8wWaWu2zQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Jan 2015 19:57:55 +0000
Message-ID: <CAJTo0Lb_rQxtgovsRLPALrRqtsye2f6grR1BQO7FHAYJ4x4HPA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] kmod new packageconfig and dbus split package
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
X-List-Received-Date: Wed, 28 Jan 2015 19:58:23 -0000
Content-Type: multipart/alternative; boundary=001a11351944c83078050dbbcabe

--001a11351944c83078050dbbcabe
Content-Type: text/plain; charset=UTF-8

On 28 January 2015 at 18:55, Dan McGregor <danismostlikely@gmail.com> wrote:

> Is there a public place to see what you have queued?
>

Sure it, ross/mut in poky-contrib.  As often seen on the autobuilder in all
red. :)

Ross

--001a11351944c83078050dbbcabe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2015 at 18:55, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4y6"=
 class=3D"a3s" style=3D"overflow:hidden">Is there a public place to see wha=
t you have queued?</div></blockquote></div><br>Sure it, ross/mut in poky-co=
ntrib.=C2=A0 As often seen on the autobuilder in all red. :)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11351944c83078050dbbcabe--
