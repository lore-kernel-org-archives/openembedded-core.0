Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QNEyb-0007Mv-Om
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:58:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2011 18:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; 
   d="scan'208";a="1280777"
Received: from unknown (HELO [10.255.12.115]) ([10.255.12.115])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2011 18:55:08 -0700
Message-ID: <4DD5C9FC.9000101@linux.intel.com>
Date: Thu, 19 May 2011 18:55:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1305756151.git.dvhart@linux.intel.com>
	<4DD5C275.9000101@intel.com>
In-Reply-To: <4DD5C275.9000101@intel.com>
Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>,
	Yi Zhao <yi.zhao@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] u-boot: update SRCREV to 2011.03
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
X-List-Received-Date: Fri, 20 May 2011 01:58:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/19/2011 06:23 PM, Saul Wold wrote:
> On 05/18/2011 03:05 PM, Darren Hart wrote:
>> From: Darren Hart<dvhart@linux.intel.com>
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>    Branch: dvhart/beagle
>>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/beagle
>>
>> Thanks,
>>      Darren Hart<dvhart@linux.intel.com>
>> ---
>>
>>
>> Darren Hart (1):
>>    u-boot: update SRCREV to 2011.03
>>
>>   meta/recipes-bsp/uboot/u-boot_git.bb |    8 ++++----
>>   1 files changed, 4 insertions(+), 4 deletions(-)
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> Pulled, but it had a problem with MD5SUM for the readme!
> 
> I did not catch that as I should have, I have an updated recipe and will 
> send it up in tonight's pull request.

This built for me as is, I'm curious what would have triggered a
problem. In particular, if my testing process is broken, I want to fix it.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


