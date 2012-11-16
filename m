Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TZRcs-0005To-8p
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 20:30:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2012 11:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,266,1352102400"; d="scan'208";a="220782650"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2012 11:16:54 -0800
Message-ID: <50A69126.2070506@linux.intel.com>
Date: Fri, 16 Nov 2012 11:16:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20121116080712.GA3411@jama.jama.net>
In-Reply-To: <20121116080712.GA3411@jama.jama.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils 2.23 call for testing the recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 19:30:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2012 12:07 AM, Martin Jansa wrote:
> On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
>> Hi
>>
>> Binutils 2.23 branch has started upstream. Given that toolchain
>> components require a lot of soak time, I have created the recipes
>> for binutils 2.23 and pushed it here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.23
>>
>> If you are using angstrom set
>>
>> ANGSTROM_BINUTILS_VERSION = "2.23" in local.conf after pulling that branch
>> for OE-Core it will work as it is
>>
>> Let me know if you see any errors.
>>
>> I will keep updating it until 2.23 release
>
> Now with danny released, can this be merged? Maybe updated to 2.23.1 too.
>
Apparently there is an issue with the SDK that is being worked on, once 
that issue is resolved we will look into merging the updated version of 
binutils.

Sau!

> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


