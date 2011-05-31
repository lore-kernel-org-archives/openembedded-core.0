Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QRV1B-0003sY-NK
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 21:54:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 May 2011 12:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,299,1304319600"; 
   d="scan'208";a="9998413"
Received: from unknown (HELO [10.255.13.70]) ([10.255.13.70])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 12:51:10 -0700
Message-ID: <4DE546AE.1090301@intel.com>
Date: Tue, 31 May 2011 12:51:10 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
	<4DE53C21.7020000@linux.intel.com>
In-Reply-To: <4DE53C21.7020000@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"poky@yoctoproject.org Project" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
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
X-List-Received-Date: Tue, 31 May 2011 19:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 12:06 PM, Saul Wold wrote:
> On 05/31/2011 11:45 AM, Koen Kooi wrote:
>> Shouldn't patches like this be sent to the oe-core list? It wouldn't
>> have saved me from the selinux bug in shadow, though :)
>>
> Scott,
>
> I would agree with Koen, this is a oe-core change, not a Poky only
> change, please resend this request to the oe-core list.

Sure, I'll resend it to oe-core.

That said, I have no idea what criteria should be used to determine 
which list to send things to, and I'm sure I'm not the only one. Is this 
documented anywhere?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


