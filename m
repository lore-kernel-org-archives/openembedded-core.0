Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81252C624D4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 00:01:27 +0000 (UTC)
Subject: Re: [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Royal Oak, Michigan, US (99.71.187.50)
X-Originating-Platform: Linux Firefox 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 17:01:18 -0700
References: <20260712184307.3259642-1-vince@underview.tech> <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com> <953617.1784488771319074426@lists.openembedded.org> <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org> <2546320.1788388183210489037@lists.openembedded.org> <44e11d55e07f423de965992fc4821ff8573e7049.camel@linuxfoundation.org>
In-Reply-To: <44e11d55e07f423de965992fc4821ff8573e7049.camel@linuxfoundation.org>
Message-ID: <2546320.1788393678217660963@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="B6b7RSPSmJRkv21rVS5F"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 00:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244993

--B6b7RSPSmJRkv21rVS5F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes,

Setting PACKAGE_ARCH and updating PACKAGE_ARCHS.

Will run into

do_create_spdx: Could not find a static SPDX document named *static* -liveu=
sb-console-linux

Which could probably be fix fairly easily. Will post when I'm further.

--B6b7RSPSmJRkv21rVS5F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Yes,</div>
<div>&nbsp;</div>
<div>Setting PACKAGE_ARCH and updating PACKAGE_ARCHS.</div>
<div><br />Will run into</div>
<div>&nbsp;</div>
<div>do_create_spdx: Could not find a static SPDX document named <strong>st=
atic</strong>-liveusb-console-linux<br /><br />Which could probably be fix =
fairly easily. Will post when I'm further.</div>

--B6b7RSPSmJRkv21rVS5F--

