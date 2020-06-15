Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7490.1592181186138789730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 17:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05F0X1cA019804
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 14 Jun 2020 17:33:02 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 14 Jun
 2020 17:33:01 -0700
Subject: Re: [OE-core] Yocto Project Status WW23'20
To: <openembedded-core@lists.openembedded.org>,
        Sakib Sajal
	<sakib.sajal@windriver.com>,
        "Slater, Joseph" <joe.slater@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <10c601d63e6c$61797c30$246c7490$@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <8a0a5043-564f-a64f-a672-e0f78c3a2ad5@windriver.com>
Date: Sun, 14 Jun 2020 20:32:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <10c601d63e6c$61797c30$246c7490$@gmail.com>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 05F0X1cA019804
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-06-09 10:43 a.m., Stephen Jolley wrote:
> One which isn=92t and is looking slightly more problematic is the qemu=20
> upgrade to 5.0.0, help would be welcome there.

Sakib and Joe have worked on upreving qemu.
If things go well they'll send the uprev this week.

I wouldn't hold M1 for it.

--=20
# Randy MacLeod
# Wind River Linux
