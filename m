Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1890C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 09:52:52 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] kernel.bbclass: check, if directory exists before removing empty module directory
To: openembedded-core@lists.openembedded.org
From: "Heiko" <heiko.thole@entwicklung.eq-3.de>
X-Originating-Location: Aurich, Lower Saxony, DE (217.7.137.154)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Apr 2024 02:52:51 -0700
References: <a357002eff78472d58c5864cd6f258eb67450fea.camel@ew.tq-group.com>
In-Reply-To: <a357002eff78472d58c5864cd6f258eb67450fea.camel@ew.tq-group.com>
Message-ID: <28425.1712915571508713687@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="qhDQYyjkdcm1P5t5Um3c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 09:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198160

--qhDQYyjkdcm1P5t5Um3c
Content-Type: multipart/alternative; boundary="i9cq3onhYjap0f6ZgmTY"

--i9cq3onhYjap0f6ZgmTY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I used " git send- email". I don`t know, why the tabs were replaced.

I have attached the patch with tabs. (Or do I have to create a new post?)

Best regards,
Heiko

--i9cq3onhYjap0f6ZgmTY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I used "<span style=3D"white-space-collapse: preserve;">git send-</span><sp=
an style=3D"white-space-collapse: preserve;">email". I don`t know, why the =
tabs were replaced.<br /><br />I have attached the patch with tabs. (Or do =
I have to create a new post?)<br /><br />Best regards,<br />Heiko</span>

--i9cq3onhYjap0f6ZgmTY--

--qhDQYyjkdcm1P5t5Um3c
Content-Type: application/octet-stream; name="kirkstone-kernel.bbclass-check-if-directory-exists-before-removing-empty-module-directory.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="kirkstone-kernel.bbclass-check-if-directory-exists-before-removing-empty-module-directory.diff"

ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9r
ZXJuZWwuYmJjbGFzcwppbmRleCBkYmQ4OTA1N2YzLi45ODhhNDg5Mzk2IDEwMDY0NAotLS0gYS9t
ZXRhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNs
YXNzCkBAIC00NTIsNyArNDUyLDcgQEAga2VybmVsX2RvX2luc3RhbGwoKSB7CnJtIC1mICIke0R9
JHtub25hcmNoX2Jhc2VfbGliZGlyfS9tb2R1bGVzLyR7S0VSTkVMX1ZFUlNJT059L2J1aWxkIgoJ
CXJtIC1mICIke0R9JHtub25hcmNoX2Jhc2VfbGliZGlyfS9tb2R1bGVzLyR7S0VSTkVMX1ZFUlNJ
T059L3NvdXJjZSIKCQkjIFJlbW92ZSBlbXB0eSBtb2R1bGUgZGlyZWN0b3JpZXMgdG8gcHJldmVu
dCBRQSBpc3N1ZXMKLQkJZmluZCAiJHtEfSR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vbW9kdWxlcy8k
e0tFUk5FTF9WRVJTSU9OfS9rZXJuZWwiIC10eXBlIGQgLWVtcHR5IC1kZWxldGUKKwkJWyAtZCAi
JHtEfSR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9OfS9rZXJu
ZWwiIF0gJiYgZmluZCAiJHtEfSR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vbW9kdWxlcy8ke0tFUk5F
TF9WRVJTSU9OfS9rZXJuZWwiIC10eXBlIGQgLWVtcHR5IC1kZWxldGUKCWVsc2UKCQliYm5vdGUg
Im5vIG1vZHVsZXMgdG8gaW5zdGFsbCIKCWZpCg==

--qhDQYyjkdcm1P5t5Um3c--

