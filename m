Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE3AE6A88D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 11:27:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5HBR9WJ012484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 04:27:09 -0700 (PDT)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 17 Jun 2013 04:27:09 -0700
Message-ID: <51BEF28C.5020109@windriver.com>
Date: Mon, 17 Jun 2013 19:27:08 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1371461969-16134-1-git-send-email-jackie.huang@windriver.com>
	<1371466776.20823.101.camel@ted>
In-Reply-To: <1371466776.20823.101.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus-wait: fix the help message typo
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
X-List-Received-Date: Mon, 17 Jun 2013 11:27:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/2013 6:59 PM, Richard Purdie wrote:
> On Mon, 2013-06-17 at 17:39 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../dbus-wait/dbus-wait/fix-dbus-wait-typo.patch   |   31 ++++++++++++++++++++
>>   meta/recipes-core/dbus-wait/dbus-wait_git.bb       |    6 ++-
>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch
>
> I took this but since the Yocto Project is the upstream for this, I
> merged that, then updated the SRCREV instead.

Ok, that's better, thanks!

Thanks,
Jackie

>
> Cheers,
>
> Richard
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

