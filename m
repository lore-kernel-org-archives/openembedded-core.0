Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD74C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 11:58:08 +0000 (UTC)
Subject: Re: [PATCH] vim: put xxd in its own package
To: openembedded-core@lists.openembedded.org
From: "Paulo Neves" <ptsneves@gmail.com>
X-Originating-Location: Krakow, Lesser Poland, PL (85.128.83.172)
X-Originating-Platform: Android Phone Firefox 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Jun 2022 04:58:00 -0700
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
Message-ID: <29553.1654689480120240103@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1lexkJJrjRozf4iYOO4X"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 11:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166701

--1lexkJJrjRozf4iYOO4X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Forgive me if it is a stupid question, but does xxd not rdepend on ncurses-=
terminfo-base as well? I ask because before your patch it could was implied=
 it that it did, s part of PN.

--1lexkJJrjRozf4iYOO4X
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Forgive me if it is a stupid question, but does xxd not rdepend on ncurses-=
terminfo-base as well? I ask because before your patch it could was implied=
 it that it did, s part of PN.

--1lexkJJrjRozf4iYOO4X--

