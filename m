Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3031C4708C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Subject: Re: create-spdx: question about virtual/kernel dependency
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Zenson di Piave, Veneto, IT (87.5.19.5)
X-Originating-Platform: Linux Firefox 99
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 03:14:53 -0700
References: 
 <a202e0b962ce90da8c68599db32bc1d218be6530.camel@linuxfoundation.org>
In-Reply-To: 
 <a202e0b962ce90da8c68599db32bc1d218be6530.camel@linuxfoundation.org>
Message-ID: <2605.1650536093249509630@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Bmrc6fVJZl8lzPL20GbT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164757

--Bmrc6fVJZl8lzPL20GbT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes we could but I'm not sure if that dependency is needed in the first pla=
ce.
Looking at the dependency graph I can see that other tasks depend upon it s=
o could it be redundant to have it?

Davide

--Bmrc6fVJZl8lzPL20GbT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes we could but I'm not sure if that dependency is needed in the first pla=
ce.<br />Looking at the dependency graph I can see that other tasks depend =
upon it so could it be redundant to have it?<br /><br />Davide

--Bmrc6fVJZl8lzPL20GbT--

