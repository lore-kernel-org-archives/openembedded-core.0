Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id A668A75A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:33:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9TEXLA8001148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 29 Oct 2015 07:33:21 -0700
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 29 Oct 2015 07:33:21 -0700
To: Kang Kai <Kai.Kang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442546459.git.kai.kang@windriver.com>
	<49a75fb1c8a88fbaf77f9b19b054802cc21559d6.1442546459.git.kai.kang@windriver.com>
	<CAJTo0LayLRNJPRe69m8D12qBC0j8+j-DiHAwjZRY_V06T9to+Q@mail.gmail.com>
	<55FF64E9.2000103@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56322E30.703@windriver.com>
Date: Thu, 29 Oct 2015 10:33:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <55FF64E9.2000103@windriver.com>
X-Originating-IP: [172.25.44.6]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bind: 9.10.2-P4 -> 9.10.3
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
X-List-Received-Date: Thu, 29 Oct 2015 14:33:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-09-20 10:01 PM, Kang Kai wrote:
> On 2015年09月18日 18:53, Burton, Ross wrote:
>>
>> On 18 September 2015 at 04:22, <kai.kang@windriver.com
>> <mailto:kai.kang@windriver.com>> wrote:
>>
>>     Upgrade bind to 9.10.3 to fix CVE issues.
>>
>>
>> Sorry, but we just had the M3 build so can you submit this as a patch
>> to 9.10.2-P4 instead of an upgrade?
>>
>> Ross
>
> OK. I'll do that.

Ross,

Kai has been working on other things.

9.10.3 appears to be a bug fix only minor upgev.
If Kai can show that there are only bug fixes can
we accept that version for oe-core-2.0.1?

../Randy

>
> --
> Regards,
> Neil | Kai Kang
>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

