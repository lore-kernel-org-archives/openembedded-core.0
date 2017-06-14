Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2306678208
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 12:30:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 05:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="114803903"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2017 05:30:20 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<20170613195620.24139-1-jose.perez.carranza@linux.intel.com>
	<55205388-5b23-4912-2ed3-033f1e416cca@linux.intel.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <a5107f4d-40b4-27c4-bfd9-70f18e06901b@linux.intel.com>
Date: Wed, 14 Jun 2017 07:32:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <55205388-5b23-4912-2ed3-033f1e416cca@linux.intel.com>
Subject: Re: [PATCH v4] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Wed, 14 Jun 2017 12:30:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/14/2017 07:00 AM, Alexander Kanavin wrote:
> On 06/13/2017 10:56 PM, jose.perez.carranza@linux.intel.com wrote:
>> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
>>
>> Add test cases to test “exclude” and “installroot“ options, also modify
>> the logic of filtering packages on the feed to have all the packages
>> needed by the tests.
>
> Looks good. Hopefully this is the last time you needed to revise the 
> patch :)
Thanks for you advise on this, I hope so too, this time I do a series of 
tests on AB and they were executed correctly
>
> Alex
>

-- 
Saludos
José


