Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACD9D72B1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 03:24:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O3Oadb029617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 20:24:36 -0700 (PDT)
Received: from [128.224.162.235] (128.224.162.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Sun, 23 Aug 2015 20:24:36 -0700
Message-ID: <55DA8E6B.8030005@windriver.com>
Date: Mon, 24 Aug 2015 11:24:27 +0800
From: He Zhe <zhe.he@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1439279286.git.zhe.he@windriver.com>
	<55CD576D.8090906@windriver.com>
In-Reply-To: <55CD576D.8090906@windriver.com>
X-Originating-IP: [128.224.162.235]
Subject: Re: [PATCH 0/1] kernel: Correct mishandling of linux.bin for building uImage
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
X-List-Received-Date: Mon, 24 Aug 2015 03:24:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Ping.

On 08/14/2015 10:50 AM, He Zhe wrote:
> Ping.
>
> On 08/11/2015 04:22 PM, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> The following changes since commit a16e0b4014173af46ef80d643bb71055219b0dab:
>>
>>   bitbake: toaster: reduced amount of instance attributes (2015-08-10 13:58:02 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib zhe/kernel-uboot
>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/kernel-uboot
>>
>> for you to fetch changes up to 925eb33167a5510d9d2ec76b0d3e1c2f3f109008:
>>
>>   kernel: Correct mishandling of linux.bin for building uImage (2015-08-11 03:37:27 -0400)
>>
>> ----------------------------------------------------------------
>> He Zhe (1):
>>       kernel: Correct mishandling of linux.bin for building uImage
>>
>>  meta/classes/kernel-uboot.bbclass | 1 -
>>  1 file changed, 1 deletion(-)
>>


