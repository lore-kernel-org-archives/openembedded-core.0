Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 15BF860017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 10:37:42 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so25894619qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 03:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QsSyhBOMXbO7YBxWiQ+AfOo9aZNpxZbWFfWUM6spAHg=;
	b=avX3rTNGwup0wZWyzzYPbAcDx3HyIhCW/DGjV7dtNOFPg4G8MMYOOzCiSyaXhN/jMO
	ak3DWanGZmfiCP83rxOWcldcTx8JS/vTKCeS/cCpQtm8D30OkPGhstvzCFqwDvo5laCk
	yUKhSc7gmtOsS319ZENd1C+FgQqkq79HULKlIyCkS9iaOnpurmFJ3UsBTP9K+9odm+W9
	80LmYtZCilXZNIl3P8TLFtTwijdKoCS9d6P+6zlIlI2zsKt7Mv0l5WsMixTR0RPHoDiD
	FLbd3+y81ET4OhQsFwzCPBf5rdcLrxdWNLKfkc2RGpe4HlvUCdaFgX+CwF1xh8fcWHmA
	R7Ig==
X-Gm-Message-State: ALoCoQmUjGAxopKJTCDAWbe5VcCxUTXXfYS8iqf5xaax3Awn4yXZHs9VCTqMs1HzC1h42mKExXCg
X-Received: by 10.55.15.129 with SMTP id 1mr54103239qkp.29.1435747061978; Wed,
	01 Jul 2015 03:37:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 1 Jul 2015 03:37:22 -0700 (PDT)
In-Reply-To: <5593BC65.60807@windriver.com>
References: <5593BC65.60807@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Jul 2015 11:37:22 +0100
Message-ID: <CAJTo0Lb9AkKLfaQf_EfBtNrocAJx+STY8dk0fnfNoe3152EwiQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Cherry-pick request: oe-core rev 2471f9b on branch dizzy
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
X-List-Received-Date: Wed, 01 Jul 2015 10:37:44 -0000
Content-Type: multipart/alternative; boundary=001a1146f1009dedb60519cde9c2

--001a1146f1009dedb60519cde9c2
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 11:09, Kang Kai <Kai.Kang@windriver.com> wrote:

> Would you like to cherry-pick one commit  2471f9b  which is useful from
> branch dizzy to master, please?
>

How did that get into dizzy without going through master... :/

This doesn't apply to master anymore - would you be able to port and verify
it works correctly?

Ross

--001a1146f1009dedb60519cde9c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 July 2015 at 11:09, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mailto:K=
ai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><font size=3D"+1">Would you li=
ke to cherry-pick one commit=C2=A0 2471f9b=C2=A0 which is useful
      from branch dizzy to master, please?<br></font></blockquote></div><br=
>How did that get into dizzy without going through master... :/</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This doesn&#39;t =
apply to master anymore - would you be able to port and verify it works cor=
rectly?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1146f1009dedb60519cde9c2--
