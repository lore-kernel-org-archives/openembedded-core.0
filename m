Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 029BC713A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:01:25 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id m20so9512178qcx.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/JIGnv3dkGx9X+xxBzYaU3Ghgynnbal5AF0xAOv47uQ=;
	b=aIe6eG4mz2eaRFbLVJBGWBhNSrU3SyYVgXjeQBguQCZ5bzKYqAFsyo1es2R286rihx
	s2Jhd393cUlPU78H06jvxFNqnHESLpGvWS2jje826IzEXsyK51w4b0HSY1uyd8u++55a
	1VgQfCpiiC1wR4zHBdaUNg+3yEmDp9sBouXy49wXLuSKLfQuriuispHi8dPCV0L2LnAW
	2KZ2j13ILug/ojfP0Xgm1BEQfiR4gPvy8I5miBgSy4V22J9z3vvYlRUt6H0Ob9zYBHdl
	ljMI3dX15S2eZ2uKJmbiJZ/1Dt6WXsF0NMxIdi+ZSQCPetEjBTTFwzBZto3Ov/OVsrKt
	HkUg==
X-Gm-Message-State: ALoCoQkes46sWnSVuy0Du36doEZENO1Exisf05Pu42L9XDbdai5Yp+fpRXJ11I5cghkDAkHTFmT9
X-Received: by 10.224.2.135 with SMTP id 7mr63597241qaj.64.1415808085441; Wed,
	12 Nov 2014 08:01:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 08:01:05 -0800 (PST)
In-Reply-To: <CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>
	<CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 16:01:05 +0000
Message-ID: <CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
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
X-List-Received-Date: Wed, 12 Nov 2014 16:01:32 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa00d6e90507ab820b

--001a11c3defa00d6e90507ab820b
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 10:28, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Ping?
>

Managed to totally miss this due to the dizzy tag, sorry for that.  Thanks
for the ping, merged to mut.

Ross

--001a11c3defa00d6e90507ab820b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2014 10:28, Andrei Gherzan <span dir=3D"ltr">&lt;<a href=3D"=
mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ping?</div><div=
 class=3D"gmail_extra"></div></blockquote></div><br>Managed to totally miss=
 this due to the dizzy tag, sorry for that.=C2=A0 Thanks for the ping, merg=
ed to mut.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11c3defa00d6e90507ab820b--
