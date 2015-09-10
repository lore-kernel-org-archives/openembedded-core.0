Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECC373232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:33:57 +0000 (UTC)
Received: by qkap81 with SMTP id p81so23054028qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=S6qjlU5m6zH4zUX11EEnQosFOqHDHnuLBPno0X8GoOw=;
	b=D1D/y/K3KYUYFgEML8uMPrgd36tfgeu2pZnIl2ucSm5am2dXlnredbEqxcgZOYNqBP
	VAvPTVtycF5MHJDyXOXzhotu+TfDUdlOhZmh1mPBMKMQVdhKLEl6KJCI8iKoeUTfUtZ4
	6W24fN1UWmqcat1EHh2RTS+qGD1wrnE4wSqFaAQVdH4w0WZPLzyuxqcTFX/+8Tj32pWE
	jodrwYOrgdkS42wdoQ8kgYRVUx6FTl7uAhGnY/oLNTGkXcRIGs2ei+6OaN2FK+20E1wF
	7FcPVpq2WJcAGS2ot1Dc29waqPU3PPOnEB+qxl2Qf/ry+fJotQXgRzvJlkNPPXnFYukl
	77ig==
X-Gm-Message-State: ALoCoQloq7drKoVp8lRUZQ4f+mypTN9lUMmnny+u7PIvHgVGpw0TCa8KHQcxTV/mgIu/4QJk+KCB
X-Received: by 10.55.221.199 with SMTP id u68mr55128308qku.83.1441913637760;
	Thu, 10 Sep 2015 12:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 12:33:38 -0700 (PDT)
In-Reply-To: <20150910193310.GE2387@jama>
References: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
	<20150910193310.GE2387@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 20:33:38 +0100
Message-ID: <CAJTo0LZcOLYi6_psehUKvtu-+LeRkPPHHQfQnn7BLLc3WMQ2bw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: Fix Upstream-Status statements
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
X-List-Received-Date: Thu, 10 Sep 2015 19:34:00 -0000
Content-Type: multipart/alternative; boundary=001a114997582d1fc4051f69aea7

--001a114997582d1fc4051f69aea7
Content-Type: text/plain; charset=UTF-8

On 10 September 2015 at 20:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> There are at least 2 cases where SOB line is added, why?
>

Should have mentioned that.  There are two cases from memory, where I was
fixing a Upstream-Status by hand and looked at the git history to identify
who added the file.

Ross

--001a114997582d1fc4051f69aea7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 September 2015 at 20:33, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":22h" c=
lass=3D"a3s" style=3D"overflow:hidden">There are at least 2 cases where SOB=
 line is added, why?</div></blockquote><div><br></div><div>Should have ment=
ioned that.=C2=A0 There are two cases from memory, where I was fixing a Ups=
tream-Status by hand and looked at the git history to identify who added th=
e file.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114997582d1fc4051f69aea7--
