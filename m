Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TsyqY-0007VA-Rx
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 17:49:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jan 2013 08:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,438,1355126400"; d="scan'208";a="189378086"
Received: from unknown (HELO [10.255.14.147]) ([10.255.14.147])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jan 2013 08:34:25 -0800
Message-ID: <50ED9C11.4060502@linux.intel.com>
Date: Wed, 09 Jan 2013 08:34:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<50ED85D4.9000806@linaro.org>
	<CAMKF1srWtx55LRNM6_Dkrfsvb3N-kLnpNofjPwx8eeNV4TnMqA@mail.gmail.com>
In-Reply-To: <CAMKF1srWtx55LRNM6_Dkrfsvb3N-kLnpNofjPwx8eeNV4TnMqA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Wed, 09 Jan 2013 16:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2013 07:02 AM, Khem Raj wrote:
> On Wed, Jan 9, 2013 at 6:59 AM, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>> W dniu 05.01.2013 01:00, Khem Raj pisze:
>>> I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
>>> booted on all supported qemu images.
>>>
>>> This is however now the final set since I have to put the 2.17 tars on
>>> downloads location
>>>
>>> Please try it out in your configurations and let me know if you find issues.
>>
>> Other than meta-toolchain I did not found any new bugs while built for
>> AArch64 target.
>>
>
> cool the patching error is now fixed. I have updated the contrib tree so if you
> reapply the patches then meta-toolchain issue should be gone too.
>
I will update  the MUT branch also, I saw this issue last night on the 
Autobuilder and was going to send email, glad I read email first!

Sau!

>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


