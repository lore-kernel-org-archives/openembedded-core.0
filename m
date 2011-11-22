Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSwLG-0003xy-OF
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:49:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 11:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,554,1315206000"; d="scan'208";a="78092429"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2011 11:42:45 -0800
Message-ID: <4ECBFB35.9070105@linux.intel.com>
Date: Tue, 22 Nov 2011 11:42:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<4ECBCBA7.8080208@linux.intel.com>
	<29FD771C-BFCA-4EB8-8CB0-6268D1933203@dominion.thruhere.net>
	<4ECBEF81.8030000@linux.intel.com>
In-Reply-To: <4ECBEF81.8030000@linux.intel.com>
Subject: Re: [RFC][PATCH 1/2] libjson: add 0.9
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
X-List-Received-Date: Tue, 22 Nov 2011 19:49:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 10:52 AM, Joshua Lock wrote:
>
>
> On 22/11/11 10:40, Koen Kooi wrote:
>>
>> Op 22 nov. 2011, om 17:19 heeft Saul Wold het volgende geschreven:
>>
>>> On 11/21/2011 10:12 AM, Koen Kooi wrote:
>>>> +LICENSE = "MIT/X11"
>>>
>>> I believe that LICENSE = "MIT" (or MIT-X) as the standard entry.
>>> Maybe Beth can give the correct version here.
>>
>
> I think it's MIT, there's no MIT-X in the SPDX registry:
> http://spdx.org/licenses/
>
In that case, we need to fix some older recipes that still contain MIT-X 
in the LICENSE field (that's why I was unsure, and I did not have the 
spdx.org website loaded in my brain).

Sau!

> Joshua


