Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id B1B44607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 22:15:13 +0000 (UTC)
Received: by qcji3 with SMTP id i3so11684862qcj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 15:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sOhIHb8WfDQnmriuEP03WOQiVh5cbpQE7R5t0xV4vkI=;
	b=augBP/0h9jg98fzLE85MFENkmuLonzaAHMhy/+cS0S6XoMLGHDj1tubI6D8COM8btH
	5Uc+Rfu2eO1AZqRxJTt/t8u0xuX5MzXVz/kfwDEyPeYFvbrUQt2DECqCphKgByzAC71b
	IUyBwBb4e6QfSyeJerJPjNm8gyMfiwDGAQXipyY8+Na6rAiyx4O5z+RNYzeOjprpLhyI
	c++BrtAkdH98mpPaNrr+6Ke7VFgG/MgEeJvouYhLATNzpc/CsnbrvgY3xEUbujpTJdK7
	0S7JIuaW1yWyTW0D+uCkwGJbemoX2u1PL4drc89R0ErXnCsX7zcMqN2D8Oqgue6Hpre5
	SNeg==
X-Gm-Message-State: ALoCoQmTAHKDa1Csoacdi0K6w2usVTv4oQvxIwjgeBd29Bs1YaFIeROo35FmwrDJNiyXucGjxSAc
X-Received: by 10.140.43.199 with SMTP id e65mr6321222qga.80.1435011314806;
	Mon, 22 Jun 2015 15:15:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 22 Jun 2015 15:14:55 -0700 (PDT)
In-Reply-To: <55888523.8090203@balister.org>
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
	<558882AB.2060703@kernelconcepts.de> <55888523.8090203@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jun 2015 23:14:55 +0100
Message-ID: <CAJTo0Lbkh11ucPqu1cJdEeXbjxRVt89TFpjt82xt_rfkXrFj=w@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of Qt4 recipes
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
X-List-Received-Date: Mon, 22 Jun 2015 22:15:18 -0000
Content-Type: multipart/alternative; boundary=001a113a9baaab200e0519229b6c

--001a113a9baaab200e0519229b6c
Content-Type: text/plain; charset=UTF-8

On 22 June 2015 at 22:58, Philip Balister <philip@balister.org> wrote:

> That said, it will be unsupported before the next release goes unsupported.
>

Exactly: a few months after 1.9 ships, Qt4 is officially dead.   So the
question remains, is Qt4 actually heavily used, or has everyone moved to
Qt5 already? (note that both Qt3 and Qt5 are maintained in their own
layers).

Ross

--001a113a9baaab200e0519229b6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2015 at 22:58, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"=
mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19e" class=3D"a3=
s" style=3D"overflow:hidden">That said, it will be unsupported before the n=
ext release goes unsupported.<br></div></blockquote></div><br>Exactly: a fe=
w months after 1.9 ships, Qt4 is officially dead. =C2=A0 So the question re=
mains, is Qt4 actually heavily used, or has everyone moved to Qt5 already? =
(note that both Qt3 and Qt5 are maintained in their own layers).</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9baaab200e0519229b6c--
