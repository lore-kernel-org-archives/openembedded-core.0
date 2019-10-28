Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD5047FA8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:36:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 14:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="189740088"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga007.jf.intel.com with ESMTP; 28 Oct 2019 14:36:35 -0700
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
References: <20191025191233.18461-1-ftoth@exalondelft.nl>
	<20191025193239.2330.37885@do>
	<d4f5d7f5-a72d-7602-0ed7-b77821609f28@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <66c4f274-4174-f3d2-53dc-5aed60ace3bf@intel.com>
Date: Mon, 28 Oct 2019 21:36:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d4f5d7f5-a72d-7602-0ed7-b77821609f28@gmail.com>
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
X-List-Received-Date: Mon, 28 Oct 2019 21:36:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 25/10/2019 21:39, Ferry Toth wrote:
> Op 25-10-2019 om 21:32 schreef Patchwork:
>> == Series Details ==
>>
>> Series: sudo: Fix fetching sources
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/20684/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Series does not apply on top of target branch 
>> [test_series_merge_on_head]
>>    Suggested fix    Rebase your series on top of targeted branch
>>    Targeted branch  master (currently at 1a8d18eeee)
>>
>>
>>
>> If you believe any of these test results are incorrect, please reply 
>> to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your 
>> concerns.
>> Otherwise we would appreciate you correcting the issues and submitting 
>> a new
>> version of the patchset if applicable. Please ensure you add/increment 
>> the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH 
>> v2] ->
>> [PATCH v3] -> ...).
> 
> The patch applies to thud.

But the patch doesn't say [thud] in the subject so nobody else knows 
this, and the patch process says we fix master, then zeus, then warrior, 
then thud.

Ross

