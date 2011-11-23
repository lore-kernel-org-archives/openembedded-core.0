Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTIiO-0006U4-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 20:42:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2011 11:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,560,1315206000"; d="scan'208";a="88612651"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2011 11:36:03 -0800
Message-ID: <4ECD4B23.1010604@linux.intel.com>
Date: Wed, 23 Nov 2011 11:36:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322032702.git.xiaofeng.yan@windriver.com>
	<5a1109761eb7eba8ddd028bea09ec12c63bc6bbb.1322032702.git.xiaofeng.yan@windriver.com>
	<27383A15-EAE2-4714-8E61-F9B194CFB581@dominion.thruhere.net>
In-Reply-To: <27383A15-EAE2-4714-8E61-F9B194CFB581@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] directfb: change check sum
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
X-List-Received-Date: Wed, 23 Nov 2011 19:42:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 11:37 PM, Koen Kooi wrote:
>
> Op 23 nov. 2011, om 08:21 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Change check sum of directfb. The previous check sum is wrong.
>
> Why is it wrong? What has changed?
>
>
Seems that when the recipe update occurred, the checksums where not 
properly updated at the same time, this is a valid and needed patch as 
it corrects the checksums for the 1.4.15 tarball.

Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


