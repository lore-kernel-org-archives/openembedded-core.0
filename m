Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D12EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:17:31 +0000 (UTC)
Subject: Re: [PATCH] vulkan-validation-layers: cleanup recipe
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Jun 2023 14:17:30 -0700
References: <20230611231135.1995485-1-vince@underview.tech>
In-Reply-To: <20230611231135.1995485-1-vince@underview.tech>
Message-ID: <6569.1686691050659740442@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pojjZdmxJlklwBGDUT4C"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182726

--pojjZdmxJlklwBGDUT4C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sorry, Guys want to cancel this MR. Thought I saw the VulkanHeadersConfig.c=
make be located in <recipes-sysroot>/usr/share/cmake when testing on other =
platforms
and different distro features. Changes to VULKAN_HEADERS_INSTALL_DIR fail i=
n certain configurations.

--pojjZdmxJlklwBGDUT4C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sorry, Guys want to cancel this MR. Thought I saw the <code class=3D"notran=
slate">VulkanHeadersConfig.cmake</code> be located in <code class=3D"notran=
slate">&lt;recipes-sysroot&gt;/usr/share/cmake</code> when testing on other=
 platforms<br />and different distro features. Changes to VULKAN_HEADERS_IN=
STALL_DIR fail in certain configurations.

--pojjZdmxJlklwBGDUT4C--

