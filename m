Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B1ED46616
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:06:07 +0000 (UTC)
Subject: Re: [[PATCH v2] 3/4] generate-cve-exclusions: Move python script
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 11:06:04 -0800
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com> <20260106191001.3385117-3-valentin.boudevin@gmail.com> <PA3PR07MB10721F18495C3995F7D9E2CA58A85A@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721F18495C3995F7D9E2CA58A85A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Message-ID: <160048.1768503964549796463@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ozwvpjAZHErXZritUusr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229432

--ozwvpjAZHErXZritUusr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I updated the class based on your recommendations: https://lists.openembedd=
ed.org/g/openembedded-core/message/229427

Now it works with a custom repo/a fixed SRCREV for deterministic purposes (=
also integrated an offline mode based on DL_DIR content).

Keep me informed if you see something else to modify.

--ozwvpjAZHErXZritUusr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Daniel,&nbsp;</div>
<div>&nbsp;</div>
<div>I updated the class based on your recommendations: <a href=3D"https://=
lists.openembedded.org/g/openembedded-core/message/229427" target=3D"_blank=
" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/messa=
ge/229427</a></div>
<div>&nbsp;</div>
<div>Now it works with a custom repo/a fixed SRCREV for deterministic purpo=
ses (also integrated an offline mode based on DL_DIR content).</div>
<div>&nbsp;</div>
<div>Keep me informed if you see something else to modify.</div>

--ozwvpjAZHErXZritUusr--

