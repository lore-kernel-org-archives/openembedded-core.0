Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F09C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:46:26 +0000 (UTC)
Subject: Re: [PATCH] oeqa/runtime/parselogs: whitelist drm failure in common
 errors list
To: openembedded-core@lists.openembedded.org
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
X-Originating-Location: Penang, MY (192.198.147.175)
X-Originating-Platform: Windows Chrome 95
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 28 Oct 2021 03:46:24 -0700
References: 
 <CANNYZj-XFdwRg=AdgfdGnjjkrd=LL8--A3SDrXfEN0oBXOd-Mw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-XFdwRg=AdgfdGnjjkrd=LL8--A3SDrXfEN0oBXOd-Mw@mail.gmail.com>
Message-ID: <30330.1635417984928081754@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TmukXrKXdreuNxPwskIB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157591

--TmukXrKXdreuNxPwskIB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

you're right, sorry I get confused with the question just now. Yes, the ent=
ire string doesn't have to match, it's enough if the string is part of the =
error message. I will go ahead and send out a v2 patch.

Thanks,

Jay

--TmukXrKXdreuNxPwskIB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-far=
east-language: EN-US;">Hi Alex, <br/><br/>you&#39;re right, sorry I get con=
fused with the question just now. Yes, the entire string doesn&#39;t have t=
o match, it&#39;s enough if the string is part of the error message. I will=
 go ahead and send out a v2 patch. </span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-far=
east-language: EN-US;">=C2=A0</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-far=
east-language: EN-US;">Thanks,</span></p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;"><span style=3D"mso-far=
east-language: EN-US;">Jay</span></p>

--TmukXrKXdreuNxPwskIB--

