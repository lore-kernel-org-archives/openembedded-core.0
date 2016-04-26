Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2831B70149
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 13:29:58 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id bi2so96576912igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ViBSEilOVA8D//0uz1JAn3RW7IXa8pBqzmghYerbwvk=;
	b=c1Cz384aROkYeaD+jRnGFw87ZBAiAoE5UlFOrxsQm/UtArssP46+IkjBn7NRqrVAr1
	NmWRFVjdGamEVyz1BPC09z8Dm2kVrX020uLoSawPJiuphZNcB5yZHtY6iEkK2TonTYTs
	erskb3r5ufXoo0uVdWlxQS56zr66QWfuEN4jOhqBJk2wLja1Mp0GW3lZX70mGgWfYAzB
	X9RKDC6HK0vdyOePi3G5WuoYt3t0UM8WmgTnSZW8JGIhiRzqEzBPTegy8iwLkbvzmP6A
	YjjdwZHr1tQPh+hfE+03D1Lmw/MohAPt2WaEf6uTS+djSTTTl2v39PA8ioc/CneKNs9j
	r8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ViBSEilOVA8D//0uz1JAn3RW7IXa8pBqzmghYerbwvk=;
	b=DveEy5SwNCM7iMkQumm/mImHTwB6SPeIgNP21+KgN0JEGfy8jJEOL3B3D9k2nhUiwM
	UUGj0nsc0K/CYlcRdjfiJiifbAGklsr3/ZSMrVhaCTuf+s4aJZzLWPgM/4/OchdgIm+9
	hIlWx7YNi98dDCRH/HWYyliN90rDlGBSD9TX1MNzoPA1xOReZLcLkCzL6VRi9IOdxrMX
	LCR3Ao3LDwfaXzMgXHTqyLRLaTb2Kwaf1S+8xbAXjtHU/zSJ8Xxce0o3YnLHOmV2p3G0
	rjguqbol9XJuLqjdPxpX+7eK2mJbzZcvLgFr/ZSqMGsOr6S7/DaKx4YN0tNPW6YB4mx2
	tNeA==
X-Gm-Message-State: AOPr4FWJKaH5HAmLpsmwMVe9k5Eg02cNcWW92JFZlXnrlEIRBX+KqElwDWQm+h+0eDICNSRhmJvyz99CoygDHb1i
X-Received: by 10.50.62.20 with SMTP id u20mr3538080igr.52.1461677398977; Tue,
	26 Apr 2016 06:29:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 06:29:39 -0700 (PDT)
In-Reply-To: <571EB9F9.3060602@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
	<CAJTo0LZgtTN+6M_Xvwm2zQAibJR0jBXB15eU12HfUtz2ERuYKA@mail.gmail.com>
	<571EB9F9.3060602@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 14:29:39 +0100
Message-ID: <CAJTo0LZN4Y1vFOJJrMxsapm9LL=KT05_KV2C63fH5QkEjZw3og@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Tue, 26 Apr 2016 13:29:59 -0000
Content-Type: multipart/alternative; boundary=047d7bdca606248c880531634a59

--047d7bdca606248c880531634a59
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 April 2016 at 01:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> Thanks, did you mean the following text ? I can't find MIT license there.
>
> /*
>  * Copyright =C2=A9 2001 Red Hat, Inc
>  *
>

Yes, this one.  I've just had a chat with Beth and we both agree that it's
practically MIT, even if it's not worded traditionally.  My personal belief
is that this license is Red Hat's legal department's wording of MIT.
Pointing it at the MIT license is acceptable, but preferable would be
adding a new "RedHat-MIT" license to common-licenses and using that.

Ross

--047d7bdca606248c880531634a59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 April 2016 at 01:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":33j" cl=
ass=3D"a3s aXjCH">Thanks, did you mean the following text ? I can&#39;t fin=
d MIT license there.<br>
<br>
/*<span class=3D""><br>
=C2=A0* Copyright =C2=A9 2001 Red Hat, Inc<br></span>
=C2=A0*<span class=3D""><br></span></div></blockquote></div><br>Yes, this o=
ne.=C2=A0 I&#39;ve just had a chat with Beth and we both agree that it&#39;=
s practically MIT, even if it&#39;s not worded traditionally.=C2=A0 My pers=
onal belief is that this license is Red Hat&#39;s legal department&#39;s wo=
rding of MIT.=C2=A0 Pointing it at the MIT license is acceptable, but prefe=
rable would be adding a new &quot;RedHat-MIT&quot; license to common-licens=
es and using that.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--047d7bdca606248c880531634a59--
