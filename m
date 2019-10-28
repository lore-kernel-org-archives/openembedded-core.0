Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 37E2E7F9DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:07:42 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iPE6w-0013n4-Gg for openembedded-core@lists.openembedded.org;
	Tue, 29 Oct 2019 00:07:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Tue, 29 Oct 2019 00:07:36 +0100
Message-ID: <feb592fc-847f-7d02-8e0b-ce6a0c9ffc70@gmail.com>
References: <20191025191233.18461-1-ftoth@exalondelft.nl>
	<20191025193239.2330.37885@do>
	<d4f5d7f5-a72d-7602-0ed7-b77821609f28@gmail.com>
	<66c4f274-4174-f3d2-53dc-5aed60ace3bf@intel.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
In-Reply-To: <66c4f274-4174-f3d2-53dc-5aed60ace3bf@intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN1ZG86IEZpeCBmZXRjaGluZyBzb3VyY2Vz?=
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
X-List-Received-Date: Mon, 28 Oct 2019 23:07:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Op 28-10-2019 om 22:36 schreef Ross Burton:
> On 25/10/2019 21:39, Ferry Toth wrote:
>> Op 25-10-2019 om 21:32 schreef Patchwork:
>>> == Series Details ==
>>>
>>> Series: sudo: Fix fetching sources
>>> Revision: 1
>>> URL   : https://patchwork.openembedded.org/series/20684/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>>
>>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>>> an automated response. Several tests have been executed on the proposed
>>> series by patchtest resulting in the following failures:
>>>
>>>
>>>
>>> * Issue             Series does not apply on top of target branch 
>>> [test_series_merge_on_head]
>>>    Suggested fix    Rebase your series on top of targeted branch
>>>    Targeted branch  master (currently at 1a8d18eeee)
>>>
>>>
>>>
>>> If you believe any of these test results are incorrect, please reply 
>>> to the
>>> mailing list (openembedded-core@lists.openembedded.org) raising your 
>>> concerns.
>>> Otherwise we would appreciate you correcting the issues and 
>>> submitting a new
>>> version of the patchset if applicable. Please ensure you 
>>> add/increment the
>>> version number when sending the new version (i.e. [PATCH] -> [PATCH 
>>> v2] ->
>>> [PATCH v3] -> ...).
>>
>> The patch applies to thud.
> 
> But the patch doesn't say [thud] in the subject so nobody else knows 
> this, and the patch process says we fix master, then zeus, then warrior, 
> then thud.

Yes, sorry about that. I wanted to send v2 for master but then found it 
has already been patched. Good to know it will eventually be backported 
to Thud.

> Ross



