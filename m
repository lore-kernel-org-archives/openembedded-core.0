Return-Path: <vishal.gupta_1@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE955D26D72
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 16:33:10 +0000 (UTC)
Subject: Re: [PATCH 1/1] wpa-supplicant: fix sed expression
To: openembedded-core@lists.openembedded.org
From: vishal.gupta_1@philips.com
X-Originating-Location: London, England, GB (155.190.13.104)
X-Originating-Platform: Linux Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 08:33:05 -0800
References: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com> <CANNYZj-xn-KQUFor=QFG_OBq0MF1tuBacUYyQJUDwF2gqnZA9Q@mail.gmail.com> <250823.1766152615641090465@lists.openembedded.org> <421adaf51e6bd83585166b0e3292402bcb319650.camel@pbarker.dev>
In-Reply-To: <421adaf51e6bd83585166b0e3292402bcb319650.camel@pbarker.dev>
Message-ID: <596925.1767976385307036169@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4zk8EU43g4xCAXQ186hw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 16:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229135

--4zk8EU43g4xCAXQ186hw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, i agree its not a functional issue for wpa_supplicant as this line wil=
l be treated as comment.
But this patch is just fixing the sed expression which is intended to delet=
e this line.=C2=A0 :)

Regards
Vishal Gupta

--4zk8EU43g4xCAXQ186hw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br /><br />Yes, i agree its not a functional issue for wpa_supplic=
ant as this line will be treated as comment.&nbsp;<br />But this patch is j=
ust fixing the sed expression which is intended to delete this line.&nbsp; =
:)<br /><br />Regards<br />Vishal Gupta</div>

--4zk8EU43g4xCAXQ186hw--

