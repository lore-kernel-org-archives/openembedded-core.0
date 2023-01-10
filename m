Return-Path: <openembedded@hetsh.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C175C61DB3
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:20:16 +0000 (UTC)
Subject: Re: [PATCH] toolchain-scripts: compatibility with unbound variable protection
To: openembedded-core@lists.openembedded.org
From: "Jan Kircher" <openembedded@hetsh.de>
X-Originating-Location: Sindelfingen, Baden-Württemberg, DE (46.142.169.238)
X-Originating-Platform: Linux Firefox 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Jan 2023 08:20:07 -0800
References: <20230110161118.8527-1-openembedded@hetsh.de>
In-Reply-To: <20230110161118.8527-1-openembedded@hetsh.de>
Message-ID: <817.1673367607129811817@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175720

This also applies to langdale and kirkstone. Kirkstone has this class in me=
ta/classes/toolchain-scripts.bbclass.

