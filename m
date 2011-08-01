Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QnrpW-0008Oc-LQ
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 14:42:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2011 05:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,300,1309762800"; d="scan'208";a="36635418"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2011 05:37:21 -0700
Received: from [10.255.25.61] (ltian4-mobl1.ccr.corp.intel.com [10.255.25.61])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CB1FD6A4087;
	Mon,  1 Aug 2011 05:37:19 -0700 (PDT)
Message-ID: <4E369DFE.50704@linux.intel.com>
Date: Mon, 01 Aug 2011 20:37:18 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312199543.git.ke.yu@intel.com>
	<AC4BB956-16B6-4228-A2D3-266C94B0223E@dominion.thruhere.net>
In-Reply-To: <AC4BB956-16B6-4228-A2D3-266C94B0223E@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/1] Fix rpm typo for multilib
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
X-List-Received-Date: Mon, 01 Aug 2011 12:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/8/1 20:05, Koen Kooi wrote:
>
> Op 1 aug. 2011, om 13:54 heeft Yu Ke het volgende geschreven:
>
>> The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
>>   Bruce Ashfield (1):
>>         poky.conf: explicitly referenced preferred linux-yocto version
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib kyu3/ml-rpm
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/ml-rpm
>
> When submitting patches to oe-core please base them against oe-core, not poky.

Fair enough. here is the new branch:

http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=kyu3/oecore/ml-rpm 


Regards
Ke


