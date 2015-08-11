Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4452976477
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 16:50:38 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so71125052qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 09:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OY7KSG22c3zJme/w+peDI8iXGcZPLoyPplM1c3akvpw=;
	b=mOc+RBnEGEjz0rW32yDuQdFcyp7LwG9IJ1xF2Mv/3iRgM3UGOYjEXd8xzFGqX2EkpZ
	EBRo+MmEJgI9kjkNCeTjCCpx2RuFaI4Q6Qb00pUL7SH26NbSDeO+CVV7iPmQ0L9ZiLDW
	T31v9OtRnbKvy0sOLc7QR6dorcs2oVR7AW4iXGVAC9/IPBtFGnNfKMMpIrbmi80/OOQA
	WLBh4GXJIDI3TGOw5V+hPY5kAoqEDNc5WnNIidwIPDS7AHN2KhWXMssDp4HDVQwHw0qH
	1JFBkoo2NGEyMmM1r1FwIHj//dwbfHoXchk4fanLiY7jajutj+j2Sl1lh0zlR1NoHiSc
	HN4A==
X-Gm-Message-State: ALoCoQkSwRijwVIUKlVmdzq6rPKkt6/cVOtFohNhj88GU8wGLd/vX5LO5AzKj9m2PwW4ypboGtDA
X-Received: by 10.55.20.207 with SMTP id 76mr22335535qku.67.1439311838387;
	Tue, 11 Aug 2015 09:50:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 09:50:19 -0700 (PDT)
In-Reply-To: <55CA27AD.6080204@linux.intel.com>
References: <1439311301-18243-1-git-send-email-anibal.limon@linux.intel.com>
	<55CA27AD.6080204@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 17:50:19 +0100
Message-ID: <CAJTo0LYSNPvO1p-twXhA6i-tLG7CmeZNRHhgNBXVTf7sfGPTEg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] distrodata: Make self-contained.
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
X-List-Received-Date: Tue, 11 Aug 2015 16:50:39 -0000
Content-Type: multipart/alternative; boundary=001a11400532d934c5051d0be63d

--001a11400532d934c5051d0be63d
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 17:49, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Is there a PATCH 2/2?
>

It's on the poky list as it is for meta-yocto.

(both in MUT)

Ross

--001a11400532d934c5051d0be63d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 17:49, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":17t" class=3D"a3s" style=3D"overflow:hidden">Is there a PAT=
CH 2/2?<br></div></blockquote></div><br>It&#39;s on the poky list as it is =
for meta-yocto.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">(both in MUT)</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a11400532d934c5051d0be63d--
