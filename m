Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id B653965CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 13:41:07 +0000 (UTC)
Received: by qgii95 with SMTP id i95so41346420qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XIMg83cpUJHs3T4a/Up3KXf6CFcNEv3qvFlqg9UhXHw=;
	b=lnNfxxdz2IQQqUp+BLkVBKVV4y7k/Z63WqaGzjRyDU2XSniT/O1NFXVngT1Hn2LgFV
	YodJfKpH/b2K4m85to0sIpJl9xCsjQMI5qUkjR72fgxvBY6W8FqIojJFnpGd1OxJOFM6
	Gi6CFAZ+sABkqiQrbBW0e4Ek9Nt/nFN7lfLW7HfqHdXckIXFJm0vbzTQRoqGcEOx+WSG
	tySRUS3B5wJOFjaUmBFXX44hfkrd7DdIhrhngPP1UBGfhuRvQk20gyR7Xf9ViRqZ8i5U
	yLRD2uAP1qtrYCaBXbdgm4xZmrDXgdCbo2BekDMs2cCZvX/whu/2Q/+9RLKNiXkecemy
	fbWA==
X-Gm-Message-State: ALoCoQmNNm6SNDHI4EftV5KZXwTwZnvSZ7I9roIgnw2LcAaflvPVd8Tts7R0Vs99sA/c2PgOVB2Y
X-Received: by 10.55.43.95 with SMTP id r92mr45307698qkh.67.1437399667262;
	Mon, 20 Jul 2015 06:41:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Jul 2015 06:40:47 -0700 (PDT)
In-Reply-To: <1436965490-8865-1-git-send-email-costin.c.constantin@intel.com>
References: <1436965490-8865-1-git-send-email-costin.c.constantin@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 14:40:47 +0100
Message-ID: <CAJTo0Lajwx-z1DX9W6ovxYU99F6g0tBXyxZBhf73LWjcGe8tCw@mail.gmail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/devtool: add useful failure messages for some test cases
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
X-List-Received-Date: Mon, 20 Jul 2015 13:41:11 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc916e49051b4eb0b5

--001a1147b8dc916e49051b4eb0b5
Content-Type: text/plain; charset=UTF-8

I think this patch is responsible for the devtool failures in
https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio
.

Ross

--001a1147b8dc916e49051b4eb0b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">I think this patch is responsib=
le for the devtool failures in=C2=A0<a href=3D"https://autobuilder.yoctopro=
ject.org/main/builders/nightly-oe-selftest/builds/78/steps/Running%20oe-sel=
ftest/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightl=
y-oe-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio</a>.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a1147b8dc916e49051b4eb0b5--
