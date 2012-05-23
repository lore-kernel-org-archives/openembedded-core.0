Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXCoo-0005GC-GG
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:45:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 07:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146777620"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2012 07:35:31 -0700
Message-ID: <4FBCF5B3.3070705@linux.intel.com>
Date: Wed, 23 May 2012 07:35:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337771338-12407-1-git-send-email-valentin.popa@intel.com>
	<4FBCF0B9.40503@linux.intel.com>
	<0F0EDA1B-C376-4EFC-86D7-6A779A92FAD8@dominion.thruhere.net>
In-Reply-To: <0F0EDA1B-C376-4EFC-86D7-6A779A92FAD8@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 23 May 2012 14:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 07:26 AM, Koen Kooi wrote:
>
> Op 23 mei 2012, om 16:14 heeft Saul Wold het volgende geschreven:
>
>> On 05/23/2012 04:08 AM, Valentin Popa wrote:
>>> From: valentin<valentin@valentin-linux.(none)>
>>>
>>> The licenses are the same, only some white
>>> spaces added/removed.
>>>
>>> Signed-off-by: valentin<valentin.popa@intel.com>
>>> ---
>>>   .../xz/{xz_5.0.3.bb =>   xz_5.1.1alpha.bb}           |   10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>   rename meta/recipes-extended/xz/{xz_5.0.3.bb =>   xz_5.1.1alpha.bb} (72%)
>>>
>> Why update to an "Alpha" Version, clearly we want to wait for the released version.
>
> xz is not getting updated a lot and this release should bring parallel xz support. I asked about this a few weeks ago here, but didn't get much response: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/018706.html
>

Your right about it looking pretty stable

Does anyone know Lasse Collin, to query him or their mailing list about 
when the next release will happen?

Sau!


> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


