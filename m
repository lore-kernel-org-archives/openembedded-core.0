Return-Path: <mubin10@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9E7731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 07:32:46 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id t40so131924467ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2016 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=DRbGKbLABGrjO8k7C+9v+glyQsqM0XRlQcnKhSK9H14=;
	b=YuVqvO32kjqQub9z0DNseDu51ReCUBDmfXIKXk0SFhsTz/ycWa7XxSw7sgDqsTkX6u
	F8qPueTxsgV9lHLuI/vCZASYPfWX5zKwRRXyi8yOl29+GvX4v4qynJJdMeG1mNZXDvG8
	yoOrWBhN0pp483/7jGinMEZuzlns1BBkP6NY1H6kLcIT38DCWyX0S/yhuYJWMgNzzHp/
	022quepdhz7jc5+jc35P/gNFhM/ehHCRLQ299xE464RWSR7FDzAv7AD2siAloSmmJz/0
	7QXohIsr1Of+KUXB07dxx15Zh8/OD9p5j/ptsLa/dkf7qeNYcPoARnt9UoxAlcfWiNkg
	gUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DRbGKbLABGrjO8k7C+9v+glyQsqM0XRlQcnKhSK9H14=;
	b=BTqgVc3JBlO7BHPkUq0QAWrJKS6JPQKFOiaLzHapMLk2E0rkV9XYqkTC7PCEBFZSwB
	Z2QJvxkuS4GqK80wMBL1e6isfLWKIlxDb5sGErQLh9XaoGu0cDVN5TOYbHO4ehVQQX2x
	wKvXB30tzz4uZkE4tvIX1e6SHpXCF5aXzP8m0jZ0FqfLcghIA036+dMYivbFFqGNoHiN
	/hjk2rG9GpHgD2c3Z6931G33oKoa0Wzo4Ww3DefLSY2HBfDSd2VH8YT9Rxvo2Bbmfk8k
	LZfO4zVyY3Ze4arHsXhBeGDUI+x3GMakn9WXSqu/CtjBcgqufKwdHhu340RgrNoIL/uG
	xM9g==
X-Gm-Message-State: ALyK8tIXwXlCB7mEsYIsoWIOBMF2GdgWWMejXK+mndNLcBVeyCfu41FjcjxApfk7EVQKDdBBDkVDqQ5lgbj3Sg==
X-Received: by 10.107.155.1 with SMTP id d1mr22786819ioe.62.1465198367188;
	Mon, 06 Jun 2016 00:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.128.203 with HTTP; Mon, 6 Jun 2016 00:32:46 -0700 (PDT)
From: mubin syed <mubin10@gmail.com>
Date: Mon, 6 Jun 2016 13:02:46 +0530
Message-ID: <CAFUnDm_LEnNqq3ebvHqN8hw1o1XeBvwhH2693tg97d-hmQKytA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: LICENCE file for LLVM based recipes
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
X-List-Received-Date: Mon, 06 Jun 2016 07:32:47 -0000
Content-Type: multipart/alternative; boundary=001a1140ad7833b0da0534971438

--001a1140ad7833b0da0534971438
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to write recipe for dhrystone benchmarks, it is LLVM licensed
benchmarks.
I went through some of the LLVM recipes, they are using NCSA license
files(not using explicit
LLVM license files).
Please let me know, which license file  i need to use for dhrystone(i.e.
LLVM licensed benchmark) recipe.

Thanks & Regards,
Mubin

--001a1140ad7833b0da0534971438
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to write recipe for dhr=
ystone benchmarks, it is LLVM licensed benchmarks.</div><div>I went through=
 some of the LLVM recipes, they are using NCSA license files(not using expl=
icit</div><div>LLVM license files).</div><div>Please let me know, which lic=
ense file =C2=A0i need to use for dhrystone(i.e. LLVM licensed benchmark) r=
ecipe.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Mubin=C2=A0=
</div></div>

--001a1140ad7833b0da0534971438--
