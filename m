Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C3FCEFCF0
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:52:42 +0000 (UTC)
Subject: Re: [PATCH 2/4] generate-cve-exclusions: Add a .bbclass
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Jan 2026 10:52:38 -0800
References: <20260106182822.3377881-1-valentin.boudevin@gmail.com> <20260106182822.3377881-2-valentin.boudevin@gmail.com> <CADkTA4NJcjKbPH4bGWCCWB0eEbpiFmUx+hCkd83ShSWA98uArA@mail.gmail.com>
In-Reply-To: <CADkTA4NJcjKbPH4bGWCCWB0eEbpiFmUx+hCkd83ShSWA98uArA@mail.gmail.com>
Message-ID: <502343.1767725558348723065@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8UHro3B8rEVj8h5BOsWz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228915

--8UHro3B8rEVj8h5BOsWz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your feedback.

Then, I will modify it to be an independent task which can be run with "bit=
bake linux-yocto -c generate_cve_exclusions".
It will remove the mandatory aspect of this task in the workflow.

--8UHro3B8rEVj8h5BOsWz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks for your feedback.&nbsp;</div>
<div>&nbsp;</div>
<div>Then, I will modify it to be an independent task which can be run with=
 "bitbake linux-yocto -c generate_cve_exclusions".</div>
<div>It will remove the mandatory aspect of this task in the workflow.</div=
>
<div>&nbsp;</div>

--8UHro3B8rEVj8h5BOsWz--

