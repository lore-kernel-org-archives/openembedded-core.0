Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA93CC27C52
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 12:11:26 +0000 (UTC)
Subject: Re: [PATCH 02/19] package_rpm: remove support for DIRFILES
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.16)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Jun 2024 05:11:23 -0700
References: <20240419121945.1920944-2-alex@linutronix.de>
In-Reply-To: <20240419121945.1920944-2-alex@linutronix.de>
Message-ID: <30049.1717416683403790176@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 12:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200248

As i see it is merged only for master branch of poky repo. Will it be merge=
d to scarthgap branch also?

It seems to me i have an issue which can be solved in scarthgap via this pa=
tch:
https://github.com/DynamicDevices/meta-mono/pull/224#issuecomment-214401719=
0

