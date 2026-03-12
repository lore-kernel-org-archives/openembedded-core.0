Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548AF105A596
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:02:40 +0000 (UTC)
Subject: Re: [PATCH] rust: Enable dynamic LLVM linking for nativesdk-rust
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.223.80)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 06:02:38 -0700
References: <20260302132815.2922014-1-sunilkumar.dora@windriver.com> <CANNYZj8TCoYWsniWbOK0-eaTOg+8npU3fxAMFifsS2MjPaYPRQ@mail.gmail.com> <DS0PR11MB790166352B5EF4401D9EA681E047A@DS0PR11MB7901.namprd11.prod.outlook.com> <CANNYZj80WP1SdzzZTADBf1M_EQpEuybNV-ywQU8d9qn-m_ip0A@mail.gmail.com>
In-Reply-To: <CANNYZj80WP1SdzzZTADBf1M_EQpEuybNV-ywQU8d9qn-m_ip0A@mail.gmail.com>
Message-ID: <146381.1773320558231648461@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NDrN6NEuM9kiEEQOabLe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232949

--NDrN6NEuM9kiEEQOabLe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sure Alex. Thanks for the clarification, that makes sense.
I'll update the change to enable shared LLVM linking for all Rust variants =
to ensure the stage1 compiler
is consistently built with dynamic LLVM.

Thanks,
Sunil Dora

--NDrN6NEuM9kiEEQOabLe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Sure Alex. Thanks for the clarification, that makes sense. <br />I'll =
update the change to enable shared LLVM linking for all Rust variants to en=
sure the stage1 compiler <br />is consistently built with dynamic LLVM.<br =
/><br />Thanks,<br />Sunil Dora</div>

--NDrN6NEuM9kiEEQOabLe--

