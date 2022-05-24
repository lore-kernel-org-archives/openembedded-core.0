Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68053C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 20:37:09 +0000 (UTC)
Subject: Re: [PATCH 1/1] extrausers: Add ability to force password change on
 first login
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Fegyvernek=2C_J=C3=A1sz-Nagykun-Szolnok=2C?=
 =?utf-8?q?_HU_=28178=2E48=2E208=2E198=29?=
X-Originating-Platform: Windows Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 May 2022 13:37:02 -0700
References: <6e0a5eaf-457f-027b-5908-01102d8ad807@kernel.crashing.org>
In-Reply-To: <6e0a5eaf-457f-027b-5908-01102d8ad807@kernel.crashing.org>
Message-ID: <10389.1653424622995356371@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RADDTgsmsXrPD56CR8eT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 20:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166087

--RADDTgsmsXrPD56CR8eT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I am using honister release in Xilinx Yocto (meta-petalinux), my experience=
 is that my root user's password is expired in default and i need to change=
 it in first login. My final root password is pre-configured by usermod -p =
<hash_pass> and i am not using the new passwd-expire command.

Can i disable somehow that default "force password change on first login"? =
I would like to use my final settings from my EXTRA_USERS_PARAMS.

--RADDTgsmsXrPD56CR8eT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"line-height: 1.42857;">Hi!</div>
<div style=3D"line-height: 1.42857;">&nbsp;</div>
<div style=3D"line-height: 1.42857;">I am using honister release in Xilinx =
Yocto (meta-petalinux), my experience is that my root user's password is ex=
pired in default and i need to change it in first login. My final root pass=
word is pre-configured by&nbsp;<em>usermod -p &lt;hash_pass&gt;</em>&nbsp;a=
nd i am not using the new&nbsp;<em>passwd-expire</em>&nbsp;command.</div>
<div style=3D"line-height: 1.42857;">&nbsp;</div>
<div style=3D"line-height: 1.42857;">Can i disable somehow that default "fo=
rce password change on first login"? I would like to use my final settings =
from my&nbsp;<em>EXTRA_USERS_PARAMS</em>.</div>

--RADDTgsmsXrPD56CR8eT--

