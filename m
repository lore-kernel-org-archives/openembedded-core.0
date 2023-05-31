Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD1AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 20:27:39 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/5] recipetool: create: npm: Remove duplicate function to not have future conflicts
To: openembedded-core@lists.openembedded.org
From: belouargamohamed@gmail.com
X-Originating-Location: Cahors, Occitanie, FR (79.80.30.96)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 31 May 2023 13:27:38 -0700
References: <CAOSpxdarKUdwjV-F7XCT9Q_-iSkY_MjSvTMVQfhb-7yT0L6yaA@mail.gmail.com>
In-Reply-To: <CAOSpxdarKUdwjV-F7XCT9Q_-iSkY_MjSvTMVQfhb-7yT0L6yaA@mail.gmail.com>
Message-ID: <18872.1685564858187475725@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="f4rpHyVoGuccJTd8cI20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 20:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182037

--f4rpHyVoGuccJTd8cI20
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I fixed the problem on master branch.
*For master:*

In order that my changes work, Some patches on bitbake should be accepted:
https://lists.openembedded.org/g/bitbake-devel/message/14815?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
163598
https://lists.openembedded.org/g/bitbake-devel/message/14819?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
230772
https://lists.openembedded.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
248868
And:
https://lists.openembedded.org/g/openembedded-core/message/182022?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0=
%2C99248914
And this series of patches:
https://lists.openembedded.org/g/openembedded-core/message/181961?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0=
%2C99230551

*For kirkstone:*
In order that my changes work, Some patches on bitbake should be accepted:
https://lists.openembedded.org/g/bitbake-devel/message/14815?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
163598
https://lists.openembedded.org/g/bitbake-devel/message/14819?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
230772
https://lists.openembedded.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
248868

And this series of patches.

Thanks

--f4rpHyVoGuccJTd8cI20
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I fixed the problem on master branch.<br /><strong>For ma=
ster:</strong><br /><br />In order that my changes work, Some patches on bi=
tbake should be accepted:<br /><a href=3D"https://lists.openembedded.org/g/=
bitbake-devel/message/14815?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate=
%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99163598" target=3D"_blank" rel=3D"=
nofollow noopener">https://lists.openembedded.org/g/bitbake-devel/message/1=
4815?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarg=
a%2C20%2C2%2C0%2C99163598</a><br /><a href=3D"https://lists.openembedded.or=
g/g/bitbake-devel/message/14819?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpost=
date%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99230772" target=3D"_blank" rel=
=3D"nofollow noopener">https://lists.openembedded.org/g/bitbake-devel/messa=
ge/14819?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelo=
uarga%2C20%2C2%2C0%2C99230772</a><br /><a href=3D"https://lists.openembedde=
d.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecent=
postdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99248868" target=3D"_blank"=
 rel=3D"nofollow noopener">https://lists.openembedded.org/g/bitbake-devel/m=
essage/14820?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2C=
belouarga%2C20%2C2%2C0%2C99248868</a><br />And:<br /><a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/message/182022?p=3D%2C%2C%2C20%2C0%=
2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99248914=
" target=3D"_blank" rel=3D"nofollow noopener">https://lists.openembedded.or=
g/g/openembedded-core/message/182022?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecen=
tpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99248914</a><br />And this=
 series of patches:<br /><a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/message/181961?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%=
2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99230551" target=3D"_blank" rel=3D"n=
oopener">https://lists.openembedded.org/g/openembedded-core/message/181961?=
p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C2=
0%2C2%2C0%2C99230551</a><br /><br /><strong>For kirkstone:</strong><br />In=
 order that my changes work, Some patches on bitbake should be accepted:<br=
 /><a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/14815?=
p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C2=
0%2C2%2C0%2C99163598" target=3D"_blank" rel=3D"nofollow noopener">https://l=
ists.openembedded.org/g/bitbake-devel/message/14815?p=3D%2C%2C%2C20%2C0%2C0=
%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99163598</a=
><br /><a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/14=
819?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga=
%2C20%2C2%2C0%2C99230772" target=3D"_blank" rel=3D"nofollow noopener">https=
://lists.openembedded.org/g/bitbake-devel/message/14819?p=3D%2C%2C%2C20%2C0=
%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C9923077=
2</a><br /><a href=3D"https://lists.openembedded.org/g/bitbake-devel/messag=
e/14820?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelou=
arga%2C20%2C2%2C0%2C99248868" target=3D"_blank" rel=3D"nofollow noopener">h=
ttps://lists.openembedded.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C20=
%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C992=
48868</a><br /><br />And this series of patches.<br /><br />Thanks<br />

--f4rpHyVoGuccJTd8cI20--

