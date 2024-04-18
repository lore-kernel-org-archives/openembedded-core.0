Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2D9C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 11:40:33 +0000 (UTC)
Subject: Re: [PATCH 2/2] gcc: Oe-selftest failure analysis - allowing multiple ssh sessions
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 04:40:22 -0700
References: <20240418113416.93878-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20240418113416.93878-2-Harish.Sadineni@windriver.com>
Message-ID: <9804.1713440422938442851@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="17OJYnhHSUiEsUGogT9p"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 11:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198515

--17OJYnhHSUiEsUGogT9p
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Time taken to run gcc testsuite w/o multiple ssh sessions -> 16-18 hrs
Time taken to run gcc testsuite w/ multiple ssh sessions -> 11-12 hrs
There is an improvement of ~30% in execution time.

Thanks,

Harish

--17OJYnhHSUiEsUGogT9p
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p><span style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (W=
est European)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-size: 14.6667px;">Time taken to run gcc test=
suite w/o multiple ssh sessions -&gt; 16-18 hrs</span><br /><span style=3D"=
color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (West European)', 'S=
egoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans=
-serif; font-size: 14.6667px;">Time taken to run gcc testsuite w/ multiple =
ssh sessions -&gt; 11-12 hrs</span><br /><span style=3D"color: #242424; fon=
t-family: 'Segoe UI', 'Segoe UI Web (West European)', 'Segoe UI', -apple-sy=
stem, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: =
14.6667px;">There is an improvement of ~30% in execution time.&nbsp;</span>=
</p>
<p><span style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (W=
est European)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-size: 14.6667px;">Thanks,</span></p>
<p><span style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (W=
est European)', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-size: 14.6667px;">Harish</span></p>

--17OJYnhHSUiEsUGogT9p--

