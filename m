Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DC2CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 11:30:46 +0000 (UTC)
Subject: Re: [PATCH v2] llvm/mesa/rust: simplify llvm-config handling
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Jun 2026 04:30:45 -0700
References: <20260610112611.649074-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260610112611.649074-1-Deepesh.Varatharajan@windriver.com>
Message-ID: <80249.1781091045679716549@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mdhpVYiwJqFv7sALOwNZ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 11:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238353

--mdhpVYiwJqFv7sALOwNZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Everyone,

The patch has been tested on the following architectures:
x86-64
x86
arm64
arm
riscv64

The following recipes were successfully built and validated:
rust
clang
mesa
nativesdk-rust
nativesdk-clang
nativesdk-mesa

Additionally, with multilib enabled, rust, clang, and mesa were tested succ=
essfully on x86-64.

Regards,
Deepesh

--mdhpVYiwJqFv7sALOwNZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Everyone,<br /><br />The patch has been tested on the following =
architectures:<br />x86-64<br />x86<br />arm64<br />arm<br />riscv64<br /><=
br />The following recipes were successfully built and validated:<br />rust=
<br />clang<br />mesa<br />nativesdk-rust<br />nativesdk-clang<br />natives=
dk-mesa<br /><br />Additionally, with multilib enabled, rust, clang, and me=
sa were tested successfully on x86-64.<br /><br />Regards,<br />Deepesh</di=
v>

--mdhpVYiwJqFv7sALOwNZ--

