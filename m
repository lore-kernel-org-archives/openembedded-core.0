Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5704.1586910237435707422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 17:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03F0Nsvr007260
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 14 Apr 2020 17:23:55 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 14 Apr
 2020 17:23:54 -0700
Subject: Re: [OE-core] [PATCH] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>,
        <openembedded-core@lists.openembedded.org>
References: <1585825857-28025-1-git-send-email-rahulk@mvista.com>
 <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com>
 <CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail.com>
 <92f149f2-051b-e67f-6fd5-e329da893e39@windriver.com>
 <CANv91vOGzdA52oLRuzDOB2hUA2dzeOb3vcMVO42F4T2iSSyRkA@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <27d4dc4e-1d96-eadf-1023-1840dfdc8e55@windriver.com>
Date: Tue, 14 Apr 2020 20:23:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANv91vOGzdA52oLRuzDOB2hUA2dzeOb3vcMVO42F4T2iSSyRkA@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03F0Nsvr007260
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-04-13 9:48 p.m., Rahul Kumar wrote:
> Hi Randy,
>=20
> Thanks for your=C2=A0 feedback.
> As per your suggestion,I am working on that.
>=20
> currently my patch has Upstream-Status: Inappropriate.
>=20
> Since I am not aware of the patch submission process on bzip2, I posted=
=20
> a query on bzip2 mailing list (2 days back)=C2=A0 but I did not get any=
=20
> response from there.
> If they are not responding, in this case shall=C2=A0i keep=C2=A0Upstrea=
m-Status:=20
> Inappropriate and send the v2 to oe-core=C2=A0 Or=C2=A0 should i wait f=
or his=20
> response?

It's your call but I'd like to see:
    Upstream-Status: Submitted.

as per:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

Submitted [where]
   - Submitted to upstream, waiting approval
   - Optionally include where it was submitted,
        such as the author, mailing list, etc.
> Or
> Do you have any idea how to submit the patch for bzip2-test repo.

No, I don't. If there's no answer, ping me here and we'll see if
someone can find a connection to the upstream developer(s).

../Randy

>=20
> *Thanks & Regards,*
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> <https://plus.google.com/+CodeTwoSoftware>


--=20
# Randy MacLeod
# Wind River Linux
