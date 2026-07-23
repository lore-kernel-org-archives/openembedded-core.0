Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FC0C531D1
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:02:22 +0000 (UTC)
Subject: Re: [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1
To: openembedded-core@lists.openembedded.org
From: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
X-Originating-Location: Handen, Stockholm County, SE (37.46.181.228)
X-Originating-Platform: Mac Firefox 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 08:02:14 -0700
References: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
Message-ID: <1009290.1784818934825857798@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NsHywr69FwXZnVscdU02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241853

--NsHywr69FwXZnVscdU02
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This is a false positive. The @v3=C2=A0flagged by patchtest is from a verba=
tim upstream git log entry:

8e31cd254be3 github: bump codeql version to @v3

It refers to a GitHub Actions version tag (actions/codeql-action@v3), not a=
 GitHub username mention.

I'd prefer to keep the upstream log intact rather than modify it.

Happy to resend with the @=C2=A0stripped if maintainers prefer, but wanted =
to flag this as a patchtest false positive that might be worth addressing i=
n the test itself.

Thanks,
Jaipaul

--NsHywr69FwXZnVscdU02
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">Hi,</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">This is a false positive. The @v3&nbsp;fla=
gged by patchtest is from a verbatim upstream git log entry:</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">&nbsp; 8e31cd254be3 github: bump codeql ve=
rsion to @v3</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">It refers to a GitHub Ac=
tions version tag (actions/codeql-action@v3), not a GitHub username mention=
.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">I'd prefer to keep the u=
pstream log intact rather than modify it.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">Happy to resend with the @&nbsp;stripped i=
f maintainers prefer, but wanted to flag this as a patchtest false positive=
 that might be worth addressing in the test itself.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Arial, Helvetica, sans-serif; color: #000000;">&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">Thanks,</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Arial, Helveti=
ca, sans-serif; color: #000000;">Jaipaul</div>
</div>

--NsHywr69FwXZnVscdU02--

