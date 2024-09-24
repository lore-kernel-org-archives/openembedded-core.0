Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FFACF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 12:12:33 +0000 (UTC)
Subject: Re: [PATCH 4/4] scripts/install-buildtools: Update to 4.0.21
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: DE (147.161.169.88)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Sep 2024 05:12:31 -0700
References: <289C5BB3-5EEC-4C28-B85C-F4148FE5DE41@arm.com>
In-Reply-To: <289C5BB3-5EEC-4C28-B85C-F4148FE5DE41@arm.com>
Message-ID: <15848.1727179951712740986@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mw3A2pnl3AGoxahQw5VA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 12:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204858

--mw3A2pnl3AGoxahQw5VA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 01:30 PM, Ross Burton wrote:

>=20
> On 24 Sep 2024, at 08:57, Aleksandar Nikolic via lists.openembedded.org
> <aleksandar.nikolic010=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> I was thinking since 4.1 (and higher versions) are EOL and since this is
>> the kirkstone branch, the buildtools should also reflect the latest
>> available release on the kirkstone branch, which is 4.0.21. But I am not
>> really sure what's the right solution here, if someone else could chime
>> in, I'd be thankful.
>=20
> If these patches are for a stable branch then please make that obvious by
> putting [kirkstone] in the subject.

I forgot to do that and only saw it after the patches were sent out (did it=
 correctly for scarthgap later). Should I send a new patch series (v2) with=
 [kirkstone] in the subject?

Aleksandar

>=20
> Ross

--mw3A2pnl3AGoxahQw5VA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Sep 24, 2024 at 01:30 PM, Ross Burton wrote:</div>
<div>
<blockquote>On 24 Sep 2024, at 08:57, Aleksandar Nikolic via lists.openembe=
dded.org &lt;aleksandar.nikolic010=3Dgmail.com@lists.openembedded.org&gt; w=
rote:<br />
<blockquote>I was thinking since 4.1 (and higher versions) are EOL and sinc=
e this is the kirkstone branch, the buildtools should also reflect the late=
st available release on the kirkstone branch, which is 4.0.21. But I am not=
 really sure what's the right solution here, if someone else could chime in=
, I'd be thankful.</blockquote>
If these patches are for a stable branch then please make that obvious by p=
utting [kirkstone] in the subject.</blockquote>
I forgot to do that and only saw it after the patches were sent out (did it=
 correctly for scarthgap later). Should I send a new patch series (v2) with=
 [kirkstone] in the subject?</div>
<div>&nbsp;</div>
<div>Aleksandar</div>
<div><br />
<blockquote>Ross</blockquote>
</div>

--mw3A2pnl3AGoxahQw5VA--

