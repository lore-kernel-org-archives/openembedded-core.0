Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Sw3Is-0004L6-OH
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 05:39:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6V3Rlsg022129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2012 20:27:48 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 30 Jul 2012 20:27:47 -0700
Message-ID: <501750B4.1020706@windriver.com>
Date: Tue, 31 Jul 2012 11:27:48 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343639326-29842-1-git-send-email-rongqing.li@windriver.com>
	<CABcZANnA4U61b+3ZyWJMmHzLCBT6Q1q73-N8ChkEbhbz_cQttQ@mail.gmail.com>
In-Reply-To: <CABcZANnA4U61b+3ZyWJMmHzLCBT6Q1q73-N8ChkEbhbz_cQttQ@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q6V3Rlsg022129
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH] slang: change char type to signed char in macros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 03:39:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B407=E6=9C=8831=E6=97=A5 00:55, Chris Larson wrote:
> On Mon, Jul 30, 2012 at 2:08 AM,  <rongqing.li@windriver.com> wrote:
>> -SRC_URI_append_arm =3D " file://change-char-type-to-signed-char-in-ma=
cros.patch"
>> +SRC_URI_append =3D " file://change-char-type-to-signed-char-in-macros=
.patch"
>
> Just move this into the main SRC_URI. There's no point retaining the
> separate assignment.
>

Ok, thanks

-Roy

--=20
Best Reagrds,
Roy | RongQing Li




