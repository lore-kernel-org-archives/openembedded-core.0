Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8527214C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 19:02:56 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so7950961qgd.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 11:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cFJsvsp646aIah8X3+VKJ3fW7EXlzrcug4KRSxJw0GI=;
	b=mHM6tnfmDEvXFgUxYET8Z4eqlL857ScNRtichlypvTPbCw6EmG6a2mEnNYfguncFnz
	cwQS57N8vy1+PvH54WVW2fuvcUXhTx6DuroC387d09shMTccXD7GF7LufE/b0zvcWHt0
	sU2Hn521ZhCf5VSLEC4QoJpAU1lajhD1W9sTIkuu/GBv7xL09oTMvo4CnSBJcKlVMHSg
	cpa+u0eR0J2CLwvXqZvj0mgJCW7qR7A9NFYeL0gxez9MCKtx/4RijfSYhFA9lLA/4xqc
	0Ro5FCSjwj+USDczFhg+qr8z5ill8wwKH67termUGkMTBBNULGozwovjN/F5aOGpKrfm
	yqRw==
X-Gm-Message-State: ALoCoQlEWLy0QRGMqZfXfSXBe3Ql7EHz+wb9nyFzIdPCKO5Gnnpk6Cck/S5Bi8GtvZI487OR/18c
X-Received: by 10.140.109.135 with SMTP id l7mr58648876qgf.80.1417460577049;
	Mon, 01 Dec 2014 11:02:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 1 Dec 2014 11:02:36 -0800 (PST)
In-Reply-To: <CAOMwXhNv7vXjdgE0p6WQ1=H0TadbyEuFQ8ZLU0D=k-k+o_dcbw@mail.gmail.com>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNv7vXjdgE0p6WQ1=H0TadbyEuFQ8ZLU0D=k-k+o_dcbw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 19:02:36 +0000
Message-ID: <CAJTo0LYjU=q40CwE0gTXm8kzwyD3ewqtM-JcgVxezQygZmai9g@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Mon, 01 Dec 2014 19:03:05 -0000
Content-Type: multipart/alternative; boundary=001a113a4eb22db51505092c426f

--001a113a4eb22db51505092c426f
Content-Type: text/plain; charset=UTF-8

On 1 December 2014 at 18:08, Laszlo Papp <lpapp@kde.org> wrote:

> Is it worth referring to bug number 6735?
>

Yes, done locally, thanks for reminding me.

Ross

--001a113a4eb22db51505092c426f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 18:08, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><font color=3D"#888888">Is it worth refer=
ring to bug number 6735?<br></font></blockquote></div><br>Yes, done locally=
, thanks for reminding me.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a113a4eb22db51505092c426f--
