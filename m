Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 155B07FE94
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:11:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0093BIcI000461
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 8 Jan 2020 19:11:18 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 8 Jan 2020 19:11:17 -0800
From: He Zhe <zhe.he@windriver.com>
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1578311007-154786-1-git-send-email-zhe.he@windriver.com>
	<4cec857f-1816-2514-2905-dd111f6c1600@intel.com>
	<a6c99210-1be3-a20e-0049-6fc5304f8658@windriver.com>
Message-ID: <57b4bf3d-d355-f409-778c-6cf778e4ad5c@windriver.com>
Date: Thu, 9 Jan 2020 11:11:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a6c99210-1be3-a20e-0049-6fc5304f8658@windriver.com>
X-Originating-IP: [128.224.162.175]
Subject: Re: [PATCH v2] ltp: nm01: Remove prefix zeros of the addresses output by nm before comparing
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
X-List-Received-Date: Thu, 09 Jan 2020 03:11:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross,

It seems that the upgrading of ltp is not moving on. And this patch is not included in ltp 20190930. Could we get this merged first?

Thanks,
Zhe

On 1/6/20 8:32 PM, He Zhe wrote:
> I saw that thread stop a few days ago. This was just merged in ltp about 10 hours ago and should not be in that patch.
>
> Regards,
> Zhe
>
> On 1/6/20 7:51 PM, Ross Burton wrote:
>> We've a patch queued to upgrade to 20190930, is this fix included in that release or does this patch need to be rebased?
>>
>> Ross


