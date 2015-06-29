Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C821737F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 00:00:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T00KkG025771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Jun 2015 17:00:20 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 28 Jun 2015 17:00:20 -0700
Message-ID: <55908A92.9050805@windriver.com>
Date: Mon, 29 Jun 2015 08:00:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1435108341-25026-1-git-send-email-rongqing.li@windriver.com>
	<1435495042.7287.2.camel@linuxfoundation.org>
In-Reply-To: <1435495042.7287.2.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][v2] unzip: fix three CVE defects
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
X-List-Received-Date: Mon, 29 Jun 2015 00:00:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月28日 20:37, Richard Purdie wrote:
> On Wed, 2015-06-24 at 09:12 +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Port four patches from unzip_6.0-8+deb7u2.debian.tar.gz to fix:
>>       cve-2014-8139
>>       cve-2014-8140
>>       cve-2014-8141
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>
> I've gone and mixed up patches for this one and merged the wrong one.
> Could you send a patch to fix the patches in master to be the correct
> ones please? Sorry about that.
>
> Cheers,
>
> Richard

OK, I will

-Roy

>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

