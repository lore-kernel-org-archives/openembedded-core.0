Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5502B6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:25:31 +0000 (UTC)
Received: by qcbii10 with SMTP id ii10so2908406qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 14:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OY/at9/MsjDT1WoAd/AVGmGzErVWD2aCIcMSBlIKOw0=;
	b=JWcAyr/Xf18+L50tVEnXdwR5Yo1tYYQvhSeH+MFewiVSdxqtTOrzGAORKw3HOhjtHj
	uTzJjiZSwioJnHL8VhYhrOAEgMMGn5SCUCFRkqVIUif0DOiy4WziYTMkx21HyZSykWiU
	kf0EzSnAgAPhXyd3TH9uVVIFrBsk2CSVbwQR+fhUGO357QMd0i5+ygFgFtLnD2rsso67
	T/WnFxuWQOJDZ+ywKsRBO7Qc245hdd/QpSAmqBTEkDrsOBM6k68lHpCtizr8w+t/bTTy
	zAkN0KdTcpYYg+wTTKTTcUZOz2Rl/hMDmN0X5zrdxzWEl2wv05nfoUx62ydq0tCZqCPM
	w3+w==
X-Gm-Message-State: ALoCoQncJQrGeM4oZfOOv7QrU708HyeyOUPiuiG2a4DZqtnv0323LUWI1TISQmgyLGm3lfvkNJDc
X-Received: by 10.55.18.17 with SMTP id c17mr16381879qkh.25.1427837131959;
	Tue, 31 Mar 2015 14:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 14:25:11 -0700 (PDT)
In-Reply-To: <1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
References: <20150330224732.GA27217@linux.intel.com>
	<1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 22:25:11 +0100
Message-ID: <CAJTo0LYLsPht9UmqOZgHcFwMFftfFi6rRkFyFztHyGChGdwubA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo: Implement --dbpath command line option
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
X-List-Received-Date: Tue, 31 Mar 2015 21:25:32 -0000
Content-Type: multipart/alternative; boundary=001a1146edd60c438205129c3da5

--001a1146edd60c438205129c3da5
Content-Type: text/plain; charset=UTF-8

Hi Ed,

On 31 March 2015 at 00:49, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Upstream-Status: Pending
>

The commit log needs just a Signed-off-by; the patch needs an explanation,
Signed-off-by, and Upstream-Status.  The goal is that the patch itself is
self-explanatory, so should explain what it does and why, whether it went
upstream and why (not), and who admits creating it in the first place.

Ross

--001a1146edd60c438205129c3da5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Ed,</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On =
31 March 2015 at 00:49, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3de" clas=
s=3D"a3s" style=3D"overflow:hidden">Upstream-Status: Pending<br></div></blo=
ckquote><div><br></div><div>The commit log needs just a Signed-off-by; the =
patch needs an explanation, Signed-off-by, and Upstream-Status.=C2=A0 The g=
oal is that the patch itself is self-explanatory, so should explain what it=
 does and why, whether it went upstream and why (not), and who admits creat=
ing it in the first place.</div><div><br></div><div>Ross</div></div></div><=
/div>

--001a1146edd60c438205129c3da5--
