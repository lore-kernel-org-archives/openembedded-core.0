Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3B2CAC5A7
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 15:23:54 +0000 (UTC)
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250808 -> 20250917
To: openembedded-core@lists.openembedded.org
From: "Vivek Puar" <vpuar@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.40)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 08:23:44 -0700
References: <dvtmteaczr4linkwvzu773akab4iea7bhpyjocpruoc4qjw6to@tveqo7ktp6ez>
In-Reply-To: <dvtmteaczr4linkwvzu773akab4iea7bhpyjocpruoc4qjw6to@tveqo7ktp6ez>
Message-ID: <15571.1758381824308318004@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OuDMZCCT9GOP5SBh1qmv"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 15:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223781

--OuDMZCCT9GOP5SBh1qmv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 05:41 AM, Dmitry Baryshkov wrote:

>=20
>=20
>> Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP firmware
>> for qcs615 platform, ${PN}-qcom-x1e80100-compute to include CDSP firmwar=
e
>> for x1e80100 platform, and ${PN}-qcom-sm8350-adreno to include the GPU
>> firmware for SM8350.
>>=20
>> Extend Qualcomm QCS8300 RIDE and SA8775P platform to include audio
>> topology
>> and include linaro license with both the packages.
>=20
> This didn't happen. You haven't updated licence for the packages.

Thanks, will update and add the license.

--OuDMZCCT9GOP5SBh1qmv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat, Sep 20, 2025 at 05:41 AM, Dmitry Baryshkov wrote:</div>
<div>
<blockquote>
<blockquote>Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP =
firmware<br />for qcs615 platform, ${PN}-qcom-x1e80100-compute to include C=
DSP firmware<br />for x1e80100 platform, and ${PN}-qcom-sm8350-adreno to in=
clude the GPU<br />firmware for SM8350.<br /><br />Extend Qualcomm QCS8300 =
RIDE and SA8775P platform to include audio topology<br />and include linaro=
 license with both the packages.</blockquote>
This didn't happen. You haven't updated licence for the packages.</blockquo=
te>
Thanks, will update and add the license.</div>

--OuDMZCCT9GOP5SBh1qmv--

