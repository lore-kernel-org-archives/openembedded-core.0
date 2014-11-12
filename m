Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E106165C91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:40:08 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id a108so8928003qge.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0aNNVKZOTGDEz3qG14kwlz69jztMcWVNwy1+xuYd9+I=;
	b=cB/pYwPjHQN88Zz3FhnAr1kBwkgR3nJCo7jU/fVoxDL0nqpp8l7e9iSITM4i+L0THG
	lFZ1LOXAqwIdwlCMb8sYooJPAWXCx44buL6m9AISTYvoGV+px7AmPlJuVu5fBzsIOrFL
	uwf1TRF0K4lex2MroyIkJhW8l2HI38FCorrC68HwP4NnzcQ0M+MKjG7WR+2HM6SVlci0
	kyH/Y5gJwKXWCgBz5XaGbwFPjmRL6mdbqc18w89FEFzAMgzXMLClN6o5Go/4EH1CgJ0l
	gq6W78vXqDpqg5oAkkChUftQ1EymC0HYzUT0ZkAXuNzvS/b+smCgDtgMyY8MzKkvITb2
	bhlg==
X-Gm-Message-State: ALoCoQmakq69WEfpZjA1r+VTC2fWyp7MjR0x4Gh4JCIYWa29OJJ6be5Ycn/sL/xMzXW8unoVKDVb
X-Received: by 10.229.176.198 with SMTP id bf6mr26430668qcb.12.1415810407225; 
	Wed, 12 Nov 2014 08:40:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 08:39:47 -0800 (PST)
In-Reply-To: <54638918.2040500@gmail.com>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
	<CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
	<CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>
	<54638918.2040500@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 16:39:47 +0000
Message-ID: <CAJTo0LZb4fRLx1O2Cc+-9CpP2A03fiBWZX4oY6ryLH9rLfQF6A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Wed, 12 Nov 2014 16:40:09 -0000
Content-Type: multipart/alternative; boundary=001a11c3057e64704c0507ac0ccf

--001a11c3057e64704c0507ac0ccf
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 16:21, akuster808 <akuster808@gmail.com> wrote:

> Thanks for the ping, merged to mut.
>>
>
> What part did you take care of? Master or Dizzy?
>

MUT feeds into master when Richard merges it.  You can backport from master
when it's there.

Ross

--001a11c3057e64704c0507ac0ccf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2014 16:21, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">Thanks for the ping, merged to mut.<br>
</span></blockquote>
<br>
What part did you take care of? Master or Dizzy?<br></blockquote><div><br><=
/div><div>MUT feeds into master when Richard merges it.=C2=A0 You can backp=
ort from master when it&#39;s there.</div><div><br></div><div>Ross=C2=A0</d=
iv></div></div></div>

--001a11c3057e64704c0507ac0ccf--
