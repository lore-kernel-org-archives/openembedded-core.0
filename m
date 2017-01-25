Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id BB10F71E10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:38:28 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id C8238A00DB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:38:38 +0100 (CET)
Received: from [172.16.25.193] ([172.16.25.193])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017012516382769-126908 ;
	Wed, 25 Jan 2017 16:38:27 +0100 
To: openembedded-core@lists.openembedded.org
References: <1485356957-6760-1-git-send-email-d.schultz@phytec.de>
	<20170125152332.4466.81544@do.openembedded.org>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <e7c31049-618c-9edb-5c3a-d2093fd43d24@phytec.de>
Date: Wed, 25 Jan 2017 16:38:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170125152332.4466.81544@do.openembedded.org>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 25.01.2017 16:38:27,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 25.01.2017 16:38:27
X-TNEFEvaluated: 1
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGNyeXB0b2RldjogRml4IGNoYW5nZWQgbW0gaW50ZXJmYWNlIGluIEtlcm5lbCA0Ljk=?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2017 15:38:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I have backported this patch and I won't add the signed-off by myself.
How should I proceed?

Am 25.01.2017 um 16:23 schrieb Patchwork:
> =3D=3D Series Details =3D=3D
>
> Series: cryptodev: Fix changed mm interface in Kernel 4.9
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4970/
> State : failure
>
> =3D=3D Summary =3D=3D
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             A patch file has been added, but does not have a Sign=
ed-off-by tag [test=5Fsigned=5Foff=5Fby=5Fpresence]
>   Suggested fix    Sign off the added patch file (meta/recipes-kernel/cry=
ptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch)
>
> * Issue             Added patch file is missing Upstream-Status in the he=
ader [test=5Fupstream=5Fstatus=5Fpresence]
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/re=
cipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page=
-API.patch (possible values: Pending, Submitted, Accepted, Backport, Denied=
, Inappropriate)
>
>
>
> If you believe any of these test results are incorrect, please reply to t=
he
> mailing list (openembedded-core@lists.openembedded.org) raising your conc=
erns.
> Otherwise we would appreciate you correcting the issues and submitting a =
new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz

