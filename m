Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27875C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:40:01 +0000 (UTC)
Subject: Re: [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 03:39:53 -0700
References: <20260629104801.972184-1-adongare@cisco.com> <DK5YVWWYT9N8.1NLJXFMIU67G1@smile.fr> <DM4PR11MB61898C52F42198EF138C1A0FC4CF2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61898C52F42198EF138C1A0FC4CF2@DM4PR11MB6189.namprd11.prod.outlook.com>
Message-ID: <1255869.1785839993001341750@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qKelleHeD4RoXoQ1vse5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242715

--qKelleHeD4RoXoQ1vse5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have submitted v2 of this curl series after rebase and also include the f=
ixed commit for CVE CVE-2026-4873
as per Paul suggestion in Wrynose curl series.

Please see v2 patches as below:

* openembedded-core@lists.openembedded.org | [scarthgap][PATCH v2 1/5] curl=
: fix CVE-2026 -4873 ( https://lists.openembedded.org/g/openembedded-core/t=
opic/120591390 )
* openembedded-core@lists.openembedded.org | [scarthgap][PATCH v2 2/5] curl=
: fix CVE-2026 -5545 ( https://lists.openembedded.org/g/openembedded-core/t=
opic/120591391 )
* openembedded-core@lists.openembedded.org | [scarthgap][PATCH v2 3/5] curl=
: fix CVE-2026 -6253 ( https://lists.openembedded.org/g/openembedded-core/t=
opic/120591392 )
* openembedded-core@lists.openembedded.org | [scarthgap][PATCH v2 4/5] curl=
: fix CVE-2026 -6429 ( https://lists.openembedded.org/g/openembedded-core/t=
opic/120591397 )
* openembedded-core@lists.openembedded.org | [scarthgap][PATCH v2 5/5] curl=
: fix CVE-2026 -7168 ( https://lists.openembedded.org/g/openembedded-core/t=
opic/120591399 )

Please review.

Regards,
Deepak

--qKelleHeD4RoXoQ1vse5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" data-olk-copy-source=
=3D"MessageBody">Hi Yoann,</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" aria-hidden=3D"true"=
>&nbsp;</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" data-event-added=3D"=
1">I have submitted v2 of this curl series after rebase and also include th=
e fixed commit for CVE<span> CVE-2026-4873</span><br />&nbsp;as per Paul su=
ggestion in Wrynose curl series.</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" aria-hidden=3D"true"=
>&nbsp;</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;">Please see v2 patche=
s as below:</div>
<ul style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West E=
uropean)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', san=
s-serif; font-size: 15px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;=
 background-color: #ffffff; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial;">
<li><a style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px; vert=
ical-align: baseline;" title=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/120591390" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/topic/120591390" data-auth=3D"NotApplicable" data-linkindex=3D"0" =
data-ogsc=3D"">openembedded-core@lists.openembedded.org | [scarthgap][PATCH=
 v2 1/5] curl: fix<span>&nbsp;</span><span data-markjs=3D"true" class=3D"ma=
rkvt0mp8ha5" style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;">CVE-2026</span>-4873</a></li>
<li><a style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px; vert=
ical-align: baseline;" title=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/120591391" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/topic/120591391" data-auth=3D"NotApplicable" data-linkindex=3D"1" =
data-ogsc=3D"">openembedded-core@lists.openembedded.org | [scarthgap][PATCH=
 v2 2/5] curl: fix<span>&nbsp;</span><span data-markjs=3D"true" class=3D"ma=
rkvt0mp8ha5" style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;">CVE-2026</span>-5545</a></li>
<li><a style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px; vert=
ical-align: baseline;" title=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/120591392" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/topic/120591392" data-auth=3D"NotApplicable" data-linkindex=3D"2" =
data-ogsc=3D"">openembedded-core@lists.openembedded.org | [scarthgap][PATCH=
 v2 3/5] curl: fix<span>&nbsp;</span><span data-markjs=3D"true" class=3D"ma=
rkvt0mp8ha5" style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;">CVE-2026</span>-6253</a></li>
<li><a style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px; vert=
ical-align: baseline;" title=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/120591397" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/topic/120591397" data-auth=3D"NotApplicable" data-linkindex=3D"3" =
data-ogsc=3D"">openembedded-core@lists.openembedded.org | [scarthgap][PATCH=
 v2 4/5] curl: fix<span>&nbsp;</span><span data-markjs=3D"true" class=3D"ma=
rkvt0mp8ha5" style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;">CVE-2026</span>-6429</a></li>
<li><a style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px; vert=
ical-align: baseline;" title=3D"https://lists.openembedded.org/g/openembedd=
ed-core/topic/120591399" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/topic/120591399" data-auth=3D"NotApplicable" data-linkindex=3D"4" =
data-ogsc=3D"">openembedded-core@lists.openembedded.org | [scarthgap][PATCH=
 v2 5/5] curl: fix<span>&nbsp;</span><span data-markjs=3D"true" class=3D"ma=
rkvt0mp8ha5" style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;">CVE-2026</span>-7168</a></li>
</ul>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" aria-hidden=3D"true"=
>&nbsp;</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;">Please review.</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;" aria-hidden=3D"true"=
>&nbsp;</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;">Regards,</div>
<div style=3D"border: 0px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-=
east-asian: inherit; font-variant-alternates: inherit; font-variant-positio=
n: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: in=
herit; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: i=
nherit; font-kerning: inherit; font-feature-settings: inherit; font-variati=
on-settings: inherit; font-language-override: inherit; margin: 0px; padding=
: 0px; vertical-align: baseline; color: #000000; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;">Deepak</div>
</div>

--qKelleHeD4RoXoQ1vse5--

