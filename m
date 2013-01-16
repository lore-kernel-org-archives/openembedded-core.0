Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TvHBt-00084I-IB
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 01:49:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2013 16:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="274236576"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2013 16:33:55 -0800
Message-ID: <50F5F573.4040702@linux.intel.com>
Date: Tue, 15 Jan 2013 16:33:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<50ED85D4.9000806@linaro.org>
	<CAMKF1srWtx55LRNM6_Dkrfsvb3N-kLnpNofjPwx8eeNV4TnMqA@mail.gmail.com>
	<50ED9C11.4060502@linux.intel.com>
	<CAMKF1sqO8DGu6=2xjzDEzQAOyfqTDk6AoUPE9_BqiNG-=2-JnA@mail.gmail.com>
In-Reply-To: <CAMKF1sqO8DGu6=2xjzDEzQAOyfqTDk6AoUPE9_BqiNG-=2-JnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2013 00:49:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 02:53 PM, Khem Raj wrote:
>>>
>>> cool the patching error is now fixed. I have updated the contrib tree so
>>> if you
>>> reapply the patches then meta-toolchain issue should be gone too.
>>>
>> I will update  the MUT branch also, I saw this issue last night on the
>> Autobuilder and was going to send email, glad I read email first!
>>
>
> The tar files are now uploads to dl yp org and I have updated the recipes
> to reflect the new download location in recipes and pushed to pull branch
> this would be the last update before pushing this change. Please update
>

Khem,

I think we might be trying to get the baisc systemd update done first 
then update it for eglibc 2.17 and then pull this patch set. I will be 
talking with RP and Ross about this tomorrow.

This might wait another week or so.

Thanks for the update.

Sau!

> Thanks
> -Khem
>
>


