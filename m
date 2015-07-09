Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDC660557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:05:13 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so117237186qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qayD9f6PQO33wKNUMkbuWE3gjpeUwMXttMP30cF8P1w=;
	b=YyY4HgwusOY7Vi2/YEje7DlTeVnw97X43gZvA3kP31AiNJGFHjAvP/D2c3v5BYMFWg
	qzbErIctqJTLZOILb+j5koXpk0E7c82bVBtg0GmAQ4OUDGP1Olp54zDqMI7191IXK4KN
	+ydyWW40khN9d7EmGgQMxBselZYzFSeENeBfdsUjoPGsostubGniR8welfXQM8pvYvmX
	Ag5ecOy6+HPbm1IALbshMxm+YjAk3qV0Ie6urktRiTLu/rTVt2Dz6XFMq6LbyXoHPWcO
	ZoelxxM5RJFQSBUfkbUBZGTtIi9Jso4Y+0LGGjKCI6DaTPO0IxU8x2EuRoLkwJ2ryiih
	m4jA==
X-Gm-Message-State: ALoCoQkLWi3YeqSpBGWKp+R7MyszprszNjKXTKwrx0h+Na9PXRQsoJ53lopnbte0sm27N/mAs92q
X-Received: by 10.55.53.193 with SMTP id c184mr24727483qka.62.1436457913632;
	Thu, 09 Jul 2015 09:05:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 09:04:52 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB44B12A9E@irsmsx105.ger.corp.intel.com>
References: <cover.1436452048.git.cristian.iorga@intel.com>
	<ffb48ef3e2d7e9eb1e0adcff1226dd77b9b10553.1436452048.git.cristian.iorga@intel.com>
	<20150709143248.GC2446@jama>
	<CAJTo0LYjQBPh1qBRvrasYTyknaVG+hKbxmS8kcFpRjrgrjgxKw@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB44B12A9E@irsmsx105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 17:04:52 +0100
Message-ID: <CAJTo0LYSi_4P66WHMapyRKPfWM6F-oACAzSTYwNehRwQtmbkHw@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Thu, 09 Jul 2015 16:05:16 -0000
Content-Type: multipart/alternative; boundary=001a11476f14ad6202051a736b93

--001a11476f14ad6202051a736b93
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 July 2015 at 16:57, Iorga, Cristian <cristian.iorga@intel.com> wrote:

> Hahaha. I am laughing because I assumed that the word =E2=80=9Carchive=E2=
=80=9D means the
> file will stay there forever with the same checksum. Silly me. J
>
> They have another link, but I am not sure if that stays up and that the
> checksum does not change.
>
> Is this always true, that the checksum changes?
>
>
Github automated tarballs are apparently dynamically generated and cached.
They also offer hosting for release tarballs, but not many projects use
those.

Ross

--001a11476f14ad6202051a736b93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 16:57, Iorga, Cristian <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNorm=
al"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif;color:#1f497d">Hahaha. I am laughing because I assumed that the word =
=E2=80=9Carchive=E2=80=9D means the file will stay there forever with the s=
ame checksum. Silly me.
</span><span style=3D"font-size:11.0pt;font-family:Wingdings;color:#1f497d"=
>J</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif;color:#1f497d"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">They have another link, but I am not =
sure if that stays up and that the checksum does not change.<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Is this always true, that the checksu=
m changes?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Github automated tarballs=
 are apparently dynamically generated and cached.=C2=A0 They also offer hos=
ting for release tarballs, but not many projects use those.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f14ad6202051a736b93--
