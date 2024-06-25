Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07471C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 10:25:58 +0000 (UTC)
Subject: Re: [PATCH v2] archiver.bbclass: Fix work-shared checking for kernel recipes
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.22)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Jun 2024 03:25:51 -0700
References: <2c451a09-c3da-4e3c-ac0b-8c7de58abf8b@freemail.hu>
In-Reply-To: <2c451a09-c3da-4e3c-ac0b-8c7de58abf8b@freemail.hu>
Message-ID: <6942.1719311151586666925@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 10:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201127

Can backport this fix to scarthgap LTS also?

