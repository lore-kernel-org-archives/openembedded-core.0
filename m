Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BFDA36B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:46:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2013 08:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="365631852"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2013 08:46:20 -0700
Message-ID: <52138F4C.1000602@linux.intel.com>
Date: Tue, 20 Aug 2013 08:46:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1377008073.git.sgw@linux.intel.com>
	<1377009976.25999.98.camel@ted>
	<CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
In-Reply-To: <CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/25] Final Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 15:46:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 08:06 AM, Otavio Salvador wrote:
> On Tue, Aug 20, 2013 at 11:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2013-08-20 at 07:28 -0700, Saul Wold wrote:
>>> Richard,
>>>
>>> This has been ACK'ed by Ross and Paul, I re-ordered the tune file
>>> usage patches and will create a patch to clean up the comment that
>>> Ross mentions.
>>>
>>> I agree with Ross on the texinfo patch, his name is there in the
>>> email.
>>
>> Merged, thanks!
>
> Thanks for merging the patches but one change, the poky.conf change
> (http://patchwork.openembedded.org/patch/55893/), has not been merged.
>
Right, forgot to mention that patch in the this email.

Richard can you pull the other part of Otavio's patch set.

Thanks
	Sau!

> Regards,
>

