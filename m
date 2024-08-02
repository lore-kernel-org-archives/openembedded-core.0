Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2466AC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:25:54 +0000 (UTC)
Subject: Re: [PATCH] libyaml: Amend CVE status as 'upstream-wontfix'
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 07:25:46 -0700
References: <20240801101719.89910-1-niko.mauno@vaisala.com>
In-Reply-To: <20240801101719.89910-1-niko.mauno@vaisala.com>
Message-ID: <2427.1722608746946415660@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4tPARwIEE2WwQgu7fwbA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202915

--4tPARwIEE2WwQgu7fwbA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I wonder if it would be good to backport this to Scarthgap. I'm getting the=
 following warning for unpatched CVE on latest scarthgap:

WARNING: libyaml-0.2.5-r0 do_cve_check: Found unpatched CVE (CVE-2024-35328=
), for more information check /home/builder/yocto/build/tmp/work/cortexa9t2=
hf-neon-tdx-linux-gnueabi/libyaml/0.2.5/temp/cve.log

Would this patch silence it?

--4tPARwIEE2WwQgu7fwbA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I wonder if it would be good to backport this to Scarthgap. I'm gettin=
g the following warning for unpatched CVE on latest scarthgap:</div>
<div>&nbsp;</div>
<div>WARNING: libyaml-0.2.5-r0 do_cve_check: Found unpatched CVE (CVE-2024-=
35328), for more information check /home/builder/yocto/build/tmp/work/corte=
xa9t2hf-neon-tdx-linux-gnueabi/libyaml/0.2.5/temp/cve.log</div>
<div>&nbsp;</div>
<div>Would this patch silence it?</div>

--4tPARwIEE2WwQgu7fwbA--

