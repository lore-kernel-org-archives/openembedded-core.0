Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1FCC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 07:10:55 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] binutils-cross-canadian: add gprofng package as runtime dependency
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: IN (106.216.205.206)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Apr 2024 00:10:50 -0700
References: <20240402220808fdb5c468@mail.local>
In-Reply-To: <20240402220808fdb5c468@mail.local>
Message-ID: <3323.1712301050979578893@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oRVzt4wn6Sly1Rz3r54e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 07:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197976

--oRVzt4wn6Sly1Rz3r54e
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried with bitbake core-image-minimal -c populate_sdk build is successful=
 and sdk is also installing successfully. I tried to do bitbake core-image-=
mingw-sdktest:do_populate_sdk -k got following ERROR: Nothing PROVIDES 'cor=
e-image-mingw-sdktest'.

Thanks,

Harish Sadineni

--oRVzt4wn6Sly1Rz3r54e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I tried with bitbake core-image-minimal -c populate_sdk build is success=
ful and sdk is also installing successfully. I tried to do bitbake core-ima=
ge-mingw-sdktest:do_populate_sdk -k got following ERROR: Nothing PROVIDES '=
core-image-mingw-sdktest'.</p>
<p>Thanks,</p>
<p>Harish Sadineni</p>

--oRVzt4wn6Sly1Rz3r54e--

