Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCB1605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:28:11 +0000 (UTC)
Received: by qcvp6 with SMTP id p6so15874279qcv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5+Xgi/e96yzh0a67047x5ZiK8sQU3FuH+Ha+jF8sd2A=;
	b=Ov3MNLD/jUitKIs8byDB38CKt+z5rj1+i1qywZSzPzCIMc9DiPaCNV/IiGka/LNvhf
	4hg4TPtpQf0A0vlR6RwnEivHWNnLdQ980vi+1Bbe07EHey4Ktsw9ac5F6R+PJmgXERb4
	sB03AJ02mXOHVoHJLUbpGiVJAdo9DmQ8vM4O+JRa723c4v33gc7TgW9MI+4WymHO6h54
	mUOj2YH8D/LuIgJcZTG++1i4S9kC13xSHSC7Wkyaf9El0C0LoKnX/ezoMuVxrBp7g/nw
	EG72WvOJmTCOr2Vfm/3HvZh8s9Jvgw432fASejimAfW9wxB7c6w1/YIsEb/MAL/kj8oc
	7L0A==
X-Gm-Message-State: ALoCoQm4ajc7vMMouNJNSErxDrPcDxQB5hjCR/MQs6LqxgiVlh+qM9j4vSsuRDd1U8XBSVP7Z2wQ
X-Received: by 10.140.194.204 with SMTP id p195mr32167777qha.21.1425068892595; 
	Fri, 27 Feb 2015 12:28:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Feb 2015 12:27:52 -0800 (PST)
In-Reply-To: <CAC1BbcSzdugU3LkehYOyAMHyK6ZCjbfk6iScNLaphjazKPeVvQ@mail.gmail.com>
References: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
	<CAC1BbcSzdugU3LkehYOyAMHyK6ZCjbfk6iScNLaphjazKPeVvQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Feb 2015 20:27:52 +0000
Message-ID: <CAJTo0LaTQYtHXeKTWOw2ocxSXbdG2ZV_6h6CpOWJc05St-_4=g@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] sato: fix typo in packagegroup
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
X-List-Received-Date: Fri, 27 Feb 2015 20:28:17 -0000
Content-Type: multipart/alternative; boundary=001a1143245e1fbf4e051017b5a3

--001a1143245e1fbf4e051017b5a3
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 19:44, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> core-image-sato fails to build, so please consider merging as it sound
> like it should fix that inconvenience..
>

This is merged to master as of 19:03 GMT. :)

Ross

--001a1143245e1fbf4e051017b5a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2015 at 19:44, Bernhard Reutner-Fischer <span dir=3D"ltr">&l=
t;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:2kh" class=3D"a3s" style=3D"overflow:hidden">core-image-sato fails to buil=
d, so please consider merging as it sound<br>
like it should fix that inconvenience..<br></div></blockquote></div><br>Thi=
s is merged to master as of 19:03 GMT. :)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143245e1fbf4e051017b5a3--
